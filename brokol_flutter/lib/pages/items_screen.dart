import 'package:brokol_flutter/services/category_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreen();
}

class _ItemScreen extends State<ItemScreen> {
  var _itemNameController = TextEditingController();
  var _itemExpiryController = TextEditingController();

  var _selectedValue;

  List<DropdownMenuItem> _categories = [];

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  _loadCategories() async {
    var _categoriesService = CategoryService();
    var categories = await _categoriesService.readCategories();
    categories.forEach((category) {
      setState(() {
        _categories.add(DropdownMenuItem(
          child: Text(category['name']),
          value: category['name'],
        ));
      });
    });
  }

  DateTime _dateTime = DateTime.now();

  _selectedToDoDate(BuildContext context) async {
    var _pickedDate = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (_pickedDate != null) {
      setState(() {
        _dateTime = _pickedDate;
        _itemExpiryController.text =
            DateFormat('dd-MM-yyyy').format(_pickedDate);
      });
    }
  }

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
            controller: _itemNameController,
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
            controller: _itemExpiryController,
            decoration: InputDecoration(
                labelText: 'Expiry',
                hintText: 'Pick an Expiry Date',
                prefixIcon: InkWell(
                  onTap: () {
                    _selectedToDoDate(context);
                  },
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
