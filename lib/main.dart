import 'package:flutter/material.dart';
import './weather.dart';
import './Routes/contact.dart';

void main() {
  runApp(MaterialApp(
    home: Weather(),
    routes: {
      '/contact': (context) => Contact(),
    },
  ));
}
