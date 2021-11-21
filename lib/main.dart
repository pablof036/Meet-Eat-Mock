import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mae/app_data.dart';
import 'package:mae/bloc/reserve.dart';
import 'package:mae/model/reserve.dart';
import 'package:mae/pages/home.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ReserveCubit(
        const Reserve(
          [],
        ),
      ),
      child: const MyApp(),
    ),
  );
}

class ScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('es_ES');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meet&Eat',
      scrollBehavior: ScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: fabColor,
        brightness: Brightness.light,
      ),
      home: const HomePage(),
    );
  }
}
