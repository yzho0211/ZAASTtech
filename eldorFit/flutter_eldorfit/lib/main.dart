import 'package:flutter/material.dart';
import 'home_page.dart';
import 'refills.dart';
import 'add_refill.dart';

void main() {
  runApp(MaterialApp(
    title: 'EldorFit',
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/refills': (context) => Refills(),
      '/add_refill': (context) => AddRefills(),
    },
  ));
}
