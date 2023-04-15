// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:brokol_flutter/listpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../categories_screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageURL = "";
    return Drawer(
      child: Container(
        // color: Colors.green,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                accountName: Text("John Appleseed"),
                accountEmail: Text("example@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageURL),
                ),
                // decoration: BoxDecoration(color: Colors.greenAccent),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                // CupertinoIcons.home,
                color: Colors.black,
              ),
              title: Text("List",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ListPage())),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text("Categories",
                  textScaleFactor: 1.3,
                  style: TextStyle(
                    color: Colors.black,
                  )),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CategoriesScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
