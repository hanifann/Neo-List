import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:neo_list/models/todo_model.dart';
import 'package:neo_list/services/database_service.dart';

import '../models/todo_model.dart';
import '../services/database_service.dart';

class TodoController extends GetxController {
  var todoModelList = List<TodoModel>().obs;
  var kategoriList = List<TodoModel>().obs;

  var categoryItemList = <String>['Work', 'Study', 'Shop', 'Travel'];

  TextEditingController todoTextController = TextEditingController();
  var dateController;
  var timeController;
  String labelValue;
  int jumlah;
  final checkList = false.obs;

  @override
  void onInit() {
    getCategory('date', DateFormat('dd MMMM yyyy').format(DateTime.now()));
    super.onInit();
  }

  Future<void> addTodo() async {
    await DatabaseService.insert(TodoModel(
        todo: todoTextController.text,
        date: dateController,
        done: "true",
        kategori: labelValue,
        jam: timeController));
    getHitung();
  }

  void getTodo() async {
    todoTextController.text = '';
    dateController = '';
    timeController = '';
    List<Map<String, dynamic>> todoList = await DatabaseService.query();
    todoModelList
        .assignAll(todoList.map((data) => TodoModel.fromJson(data)).toList());
  }

  void deleteTodo(TodoModel todoModel) async {
    await DatabaseService.delete(todoModel);
    getCategory('date', DateFormat('dd MMMM yyyy').format(DateTime.now()));
    getHitung();
  }

  void getCategory(var where, String kategori) async {
    todoTextController.text = '';
    dateController = '';
    timeController = '';
    List<Map<String, dynamic>> todoList =
        await DatabaseService.queryClause(where, kategori);
    kategoriList
        .assignAll(todoList.map((data) => TodoModel.fromJson(data)).toList());
  }

  getHitung() async {
    jumlah = await DatabaseService.getCount();
    return jumlah;
  }
}
