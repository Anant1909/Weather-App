import 'package:flutter/material.dart';
import 'package:weather_app/loading.dart';
import 'package:weather_app/home.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  initialRoute: '/' ,
  routes: {
    '/':  (context) => const Loading() ,
    '/home' : (context) => const Home(),

  },

));