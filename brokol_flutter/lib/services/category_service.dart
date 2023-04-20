import 'package:brokol_flutter/repositories/repository.dart';

import '../models/category.dart';

class CategoryService {
  Repository? _repository;

  CategoryService() {
    _repository = Repository();
  }

  // inserting data
  saveCategory(Category category) async {
    return await _repository?.insertData('categories', category.categoryMap());
  }

  // read data from table
  readCategories() async {
    return await _repository?.readData('categories');
  }

  // read data from table by Id
  readCategoryById(categoryId) async {
    return await _repository!.readDataById('categories', categoryId);
  }

  // update data from table
  updateCategory(Category category) async {
    return await _repository!.updateData('categories', category.categoryMap());
  }

  // delete data from table
  deleteCategory(categoryId) async {
    return await _repository!.deleteData('categories', categoryId);
  }
}
