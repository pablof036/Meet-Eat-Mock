import 'package:flutter/material.dart';
import 'package:mae/views/history_view.dart';
import 'package:mae/views/home_view.dart';
import 'package:mae/views/profile_view.dart';
import 'package:mae/widgets/app_title.dart';

final homeButtonStyle = ButtonStyle(
  foregroundColor: MaterialStateProperty.resolveWith(
    (states) {
      if (states.contains(MaterialState.hovered)) {
        return Colors.black;
      }

      return Colors.black;
    },
  ),
  backgroundColor: MaterialStateProperty.resolveWith(
    (states) {
      if (states.contains(MaterialState.hovered)) {
        return Colors.white10;
      } else if (states.contains(MaterialState.selected)) {
        return Colors.white10;
      }

      return Colors.transparent;
    },
  ),
);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final views = [
    HomeView(),
    HistoryView(),
    ProfileView(),
  ];

  int viewIndex = 0;

  void setViewIndex(int index) {
    setState(() {
      viewIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrainsts) {
        if (constrainsts.maxWidth < 600) {
          return Scaffold(
            backgroundColor: Colors.grey.shade100,
            appBar: AppBar(
              title: const AppTitle("Meet&Eat"),
              backgroundColor: Colors.grey.shade100,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              selectedItemColor: Colors.grey.shade900,
              backgroundColor: Colors.white,
              currentIndex: viewIndex,
              onTap: setViewIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.restaurant),
                  label: 'Inicio',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'Historial',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Perfil',
                ),
              ],
            ),
            body: views[viewIndex],
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const AppTitle("Meet&Eat"),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
              actions: [
                TextButton(
                  onPressed: () => setViewIndex(0),
                  child: Text('Inicio'),
                  style: homeButtonStyle,
                ),
                TextButton(
                  onPressed: () => setViewIndex(1),
                  child: Text('Historial'),
                  style: homeButtonStyle,
                ),
                TextButton(
                  onPressed: () => setViewIndex(2),
                  child: Text('Perfil'),
                  style: homeButtonStyle,
                ),
              ],
            ),
            body: views[viewIndex],
          );
        }
      },
    );
  }
}
