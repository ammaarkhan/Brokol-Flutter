
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

  // // read data from table
  // readCategories() async {
  //   return await _repository?.readData('categories');
  // }

  // // read data from table by Id
  // readCategoryById(categoryId) async {
  //   return await _repository!.readDataById('categories', categoryId);
  // }

  // // update data from table
  // updateCategory(Category category) async {
  //   return await _repository!.updateData('categories', category.categoryMap());
  // }

  // // delete data from table
  // deleteCategory(categoryId) async {
  //   return await _repository!.deleteData('categories', categoryId);
  // }
}
