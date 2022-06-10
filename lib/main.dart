import 'package:flutter/material.dart';
import 'package:sawayo_task/screens/home.dart';
import 'package:sawayo_task/widgets/profileImage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      title: 'Flutter Demo',
      home: HomeScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
