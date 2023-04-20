import 'dart:math';

import 'package:flutter/rendering.dart';

class Item {
  int? id;
  String? title;
  String? category;
  String? expDate;
  int? isFinished;

  itemMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['title'] = title;
    mapping['category'] = category;
    mapping['expDate'] = expDate;
    mapping['isFinished'] = isFinished;

    return mapping;
  }
}
