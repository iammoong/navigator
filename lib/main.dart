import 'package:flutter/material.dart';
import 'package:navigator/screen/home_screen.dart';
import 'package:navigator/screen/route_one_screen.dart';
import 'package:navigator/screen/route_three_screen.dart';
import 'package:navigator/screen/route_two_screen.dart';

const HOME_ROUTE = '/';
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      //home: HomeScreen(),
      routes: {
        HOME_ROUTE : (context) => HomeScreen(),
        '/one' : (context) => RouteOneScreen(),
        '/two' : (context) => RouteTwoScreen(),
        '/three' : (context) => RouteThreeScreen(),
      },
    ),
  );
}
