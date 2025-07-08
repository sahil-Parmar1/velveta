import 'package:flutter/material.dart';
import 'package:velveta/componets/navigation_bar.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Navigation_Bar(),
      ),
    );
  }
}

