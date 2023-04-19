import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreen();
}

class _ItemScreen extends State<ItemScreen> {
  var itemNameController = TextEditingController();
  var itemExpiryController = TextEditingController();

  var _selectedValue;

  var _categories;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(children: <Widget>[
          TextField(
            controller: itemNameController,
            decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Add New Item Name',
            ),
          ),
          // TextField(
          //   controller: itemDescController,
          //   decoration: InputDecoration(labelText: 'Description',
          //   hintText: 'Add New Description Name',),
          // ),
          TextField(
            controller: itemExpiryController,
            decoration: InputDecoration(
                labelText: 'Expiry',
                hintText: 'Pick an Expiry Date',
                prefixIcon: InkWell(
                  onTap: () {},
                  child: Icon(Icons.calendar_today),
                )),
          ),
          DropdownButtonFormField(
            value: _selectedValue,
            items: _categories,
            hint: Text('Category'),
            onChanged: (value) {
              setState(() {
                _selectedValue = value;
              });
            },
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.green,
            ),
            child: Text('Save'),
          )
        ]),
      ),
    );
  }
}
