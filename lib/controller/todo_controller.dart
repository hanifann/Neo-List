import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:neo_list/models/todo_model.dart';
import 'package:neo_list/services/database_service.dart';

import '../models/todo_model.dart';
import '../services/database_service.dart';

class TodoController extends GetxController {
  var todoModelList = List<TodoModel>().obs;

  TextEditingController todoTextController = TextEditingController();
  var dateController;
  var timeController;
  String labelValue;
  int jumlah;
  final checkList = 0.obs;

  @override
  void onInit() {
    getToday('date', DateFormat('dd MMMM yyyy').format(DateTime.now()));
    super.onInit();
  }

  Future<void> addTodo() async {
    await DatabaseService.insert(TodoModel(
        todo: todoTextController.text,
        date: dateController,
        done: 0,
        kategori: labelValue,
        jam: timeController));
    getHitung();
  }

  Future<void> updateTodo(String todo, String date, int done, String kategori, String jam, int id ) async {
    await DatabaseService.update(
      TodoModel(
        id: id,
        todo: todo,
        date: date,
        done: done,
        kategori: kategori,
        jam: jam
      )
    );
    getToday('date', DateFormat('dd MMMM yyyy').format(DateTime.now()));
    getHitung();
  }

  // void getTodo() async {
  //   todoTextController.text = '';
  //   dateController = '';
  //   timeController = '';
  //   List<Map<String, dynamic>> todoList = await DatabaseService.query();
  //   todoModelList
  //       .assignAll(todoList.map((data) => TodoModel.fromJson(data)).toList());
  // }

  void deleteTodo(TodoModel todoModel) async {
    await DatabaseService.delete(todoModel);
    getToday('date', DateFormat('dd MMMM yyyy').format(DateTime.now()));
    getHitung();
  }

  void getToday(var where, String kategori) async {
    todoTextController.text = '';
    dateController = '';
    timeController = '';
    List<Map<String, dynamic>> todoList =
        await DatabaseService.queryClause(where, kategori);
    todoModelList
        .assignAll(todoList.map((data) => TodoModel.fromJson(data)).toList());
  }

  getHitung() async {
    jumlah = await DatabaseService.getCount();
    return jumlah;
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
