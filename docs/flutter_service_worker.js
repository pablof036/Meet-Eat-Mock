'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "assets/AssetManifest.json": "3635b3a9055d618a423597f1562c8182",
"assets/assets/100montaditos.webp": "3acca6aa7d8b33c311ed0286362d7b8f",
"assets/assets/banner.jpg": "910c3e9644e09893e2bc209b2226b9d6",
"assets/assets/benditoburrito.webp": "1e79c0d3208aea970d26be026e9eafd3",
"assets/assets/castellana.jpg": "48430a735ed0ab973b0a1253e5bac0cf",
"assets/assets/cheesebacon.webp": "1af55259a1636b1d18f457b5ff4e9c0d",
"assets/assets/condestable.webp": "ad0cd7f76f0f448f002bb41e09519ee3",
"assets/assets/dominos.webp": "a98893f8d1aa6a38cb164cc6460fd9f1",
"assets/assets/fosters.webp": "f354c463d08049897b1cb9ed707e7853",
"assets/assets/goiko.webp": "8866e2f9c6dc131fc08f820a24fa0036",
"assets/assets/guru.png": "06d93871f9be38977cbca9d288ac7412",
"assets/assets/hollywood.webp": "22080c4230ca81151166740052146169",
"assets/assets/icon.png": "738d6379dd49a2e7ca8da3887bd017d3",
"assets/assets/labocatelia.webp": "79747e8e07dfb19045ef6a7b5a8265eb",
"assets/assets/lasvegas.webp": "cbda50ac987824127196d8207d007362",
"assets/assets/london.webp": "e01321a0f7aa50c6301e0fb9dee06e49",
"assets/assets/mana.jpg": "907be0c06a31b037c973d36c7403e629",
"assets/assets/metro.jpg": "18fff5db9352030e53f3813b45038d6f",
"assets/assets/paloma.webp": "bbf2d091c7c00692673e9bd0eb1149fc",
"assets/assets/pomodoro.jpg": "5c9c2ae7a3f2088996f7822e318bfda3",
"assets/assets/profile.jpg": "5dd7c993dd4e66324f3f1701616071cc",
"assets/assets/raquetas.jpg": "4d74e6c187326da3daea7a77742e3a70",
"assets/assets/salzillo.webp": "0a5350f60d82e3160fb687c7e818c5e6",
"assets/assets/sanpedro.webp": "df989af7d19b68f6f722b460e3f16a3e",
"assets/assets/tastypoke.webp": "db1d040abcfe4dfcb6cb608c88df4557",
"assets/assets/university.webp": "8db513f92f68f8b209e282b2e349b0c6",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/NOTICES": "48f0a85f147958d68c70cb86e4f69306",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "74bcd572cb51d94d9215ed71d04179db",
"/": "74bcd572cb51d94d9215ed71d04179db",
"main.dart.js": "173e2833b04854cbfd87932c9ecc604e",
"manifest.json": "74a81f7f13239adc29043c80719f1754",
"version.json": "3ac66adbd1ee098b29a603087071053c"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
