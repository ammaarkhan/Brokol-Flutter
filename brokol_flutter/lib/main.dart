import 'package:brokol_flutter/listpage.dart';
import 'package:brokol_flutter/utils/routes.dart';
import 'package:brokol_flutter/widgets/themes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.listRoute,
      routes: {
        // "/": (context) => LoginPage(),
        MyRoutes.listRoute: (context) => ListPage(),
      },
    );
  }
}
