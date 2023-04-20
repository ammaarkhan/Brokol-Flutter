import 'package:brokol_flutter/pages/listpage.dart';
import 'package:brokol_flutter/services/category_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../pages/categories_screen.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  List<Widget> _categoryList = <Widget>[];

  CategoryService _categoryService = CategoryService();

  @override
  void initState() {
    super.initState();
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    var categories = await _categoryService.readCategories();

    setState(() {
      categories.forEach((category) {
        setState(() {
          _categoryList.add(ListTile(
            title: Text(category['name']),
          ));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final imageURL = "";
    return Drawer(
      child: Container(
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
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text(
                "List",
                textScaleFactor: 1.3,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ListPage(),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              title: Text(
                "Categories",
                textScaleFactor: 1.3,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CategoriesScreen(),
                ),
              ),
            ),
            Divider(),
            Column(
              children: _categoryList,
            ),
          ],
        ),
      ),
    );
  }
}
