

import 'package:get/get.dart';
import 'package:neo_list/models/todo_model.dart';

class CategoryContrloller extends GetxController {
  final categoryList = List<TodoModel>().obs;
  
  var categoryItemList = <String>['Work', 'Study', 'Shop', 'Travel'];
}