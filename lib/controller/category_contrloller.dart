import 'package:get/get.dart';
import 'package:neo_list/models/todo_model.dart';
import 'package:neo_list/services/database_service.dart';

class CategoryContrloller extends GetxController {
  var categoryModelList = List<TodoModel>().obs;

  var categoryItemList = <String>['Work', 'Study', 'Shop', 'Travel'];
  var title = ''.obs;
  final checkList = 0.obs;

  void getCategory(var where, String kategori) async {
    List<Map<String, dynamic>> todoList =
        await DatabaseService.queryClause(where, kategori);
    categoryModelList
        .assignAll(todoList.map((data) => TodoModel.fromJson(data)).toList());
  }

    bool intToBoolean(checkList) {
    if (checkList == 1) {
      return true;
    } else {
      return false;
    }
  }

  int boolToInt(bool data) {
    if (data == true) {
      return 1;
    } else {
      return 0;
    }
  }
}
