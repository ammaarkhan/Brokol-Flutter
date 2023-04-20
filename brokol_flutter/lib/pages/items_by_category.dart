import 'package:brokol_flutter/services/item_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/item.dart';

class ItemsByCategory extends StatefulWidget {
  final String category;
  ItemsByCategory({required this.category});
  // const ItemsByCategory({super.key});

  @override
  State<ItemsByCategory> createState() => _ItemsByCategoryState();
}

class _ItemsByCategoryState extends State<ItemsByCategory> {
  List<Item> _itemList = <Item>[];
  ItemService _itemService = ItemService();

  @override
  void initState() {
    super.initState();
    getItemsByCategories();
  }

  getItemsByCategories() async {
    var items =
        await _itemService.readItemsByCategory(this.widget.category.toString());
    items.forEach((item) {
      setState(() {
        var model = Item();
        model.title = item['title'];
        model.category = item['category'];
        model.expDate = item['expDate'];
        model.id = item['id'];

        _itemList.add(model);
      });
      // super.setState(() {});
    });
  }

  _deleteFormDialog(BuildContext context, itemId) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                ),
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                ),
                onPressed: () async {
                  var result = await _itemService.deleteItem(itemId);
                  print(result);
                  if (result > 0) {
                    Navigator.pop(context);
                    getItemsByCategories();
                    setState(() {
                      _itemList.removeWhere((item) => item.id == itemId);
                    });
                    // _showSuccessSnackBar(Text('Deleted'));
                  }
                },
                child: Text('Delete'),
              ),
            ],
            title: Text("Confirm Deletion"),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.category),
        backgroundColor: const Color.fromARGB(255, 50, 116, 106),
      ),
      body: Column(children: <Widget>[
        Expanded(
            child: ListView.builder(
                itemCount: _itemList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        elevation: 8,
                        child: ListTile(
                          leading: IconButton(
                              icon: Icon(Icons.done_outline),
                              onPressed: () {
                                _deleteFormDialog(context, _itemList[index].id);
                              }),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(_itemList[index].title ?? 'no name'),
                            ],
                          ),
                          subtitle:
                              Text(_itemList[index].category ?? 'no category'),
                          trailing:
                              Text(_itemList[index].expDate ?? 'no exp date'),
                        )),
                  );
                }))
      ]),
    );
  }
}
