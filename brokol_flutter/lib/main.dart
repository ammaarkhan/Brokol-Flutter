import 'package:brokol_flutter/pages/home_page.dart';
import 'package:brokol_flutter/pages/listpage.dart';
import 'package:brokol_flutter/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
