import 'package:brokol_flutter/repositories/repository.dart';

import '../models/item.dart';

class ItemService {
  Repository? _repository;

  ItemService() {
    _repository = Repository();
  }

  // inserting data
  saveItem(Item item) async {
    return await _repository?.insertData('items', item.itemMap());
  }

  // read data from table
  readItems() async {
    return await _repository?.readData('items');
  }

  // // read data from table by Id
  // readCategoryById(categoryId) async {
  //   return await _repository!.readDataById('categories', categoryId);
  // }

  // update data from table
  // updateCategory(Category category) async {
  //   return await _repository!.updateData('categories', category.categoryMap());
  // }

  // delete data from table
  deleteItem(itemId) async {
    return await _repository!.deleteData('items', itemId);
  }

  // read items by category
  readItemsByCategory(category) async {
    return await _repository!
        .readDataByColumnName('items', 'category', category);
  }
}
