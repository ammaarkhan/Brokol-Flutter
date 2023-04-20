import 'package:brokol_flutter/pages/items_screen.dart';
import 'package:brokol_flutter/services/item_service.dart';
import 'package:brokol_flutter/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/item.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ItemService? _itemService;

  List<Item> _itemList = <Item>[];

  @override
  initState() {
    super.initState();
    getAllItems();
  }

  getAllItems() async {
    _itemService = ItemService();
    _itemList = <Item>[];

    var items = await _itemService?.readItems();

    items.forEach((item) {
      var model = Item();
      model.id = item['id'];
      model.title = item['title'];
      model.category = item['category'];
      model.expDate = item['expDate'];
      model.isFinished = item['isFinished'];
      _itemList.add(model);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List Page"),
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
          itemCount: _itemList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(_itemList[index].title ?? 'no name'),
                      ],
                    ),
                    subtitle: Text(_itemList[index].category ?? 'no category'),
                    trailing: Text(_itemList[index].expDate ?? 'no exp date'),
                  )),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ItemScreen())),
        child: Icon(Icons.add),
      ),
    );
  }
}
