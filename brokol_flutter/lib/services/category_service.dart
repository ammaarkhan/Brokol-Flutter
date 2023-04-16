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

  readCategories() async {
    return await _repository?.readData('categories');
  }
}
