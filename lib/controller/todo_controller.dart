import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:neo_list/models/todo_model.dart';
import 'package:neo_list/services/database_service.dart';

import '../models/todo_model.dart';
import '../services/database_service.dart';

class TodoController extends GetxController {
  var todoModelList = List<TodoModel>().obs;
  var kategoriList = List<TodoModel>().obs;

  TextEditingController todoTextController = TextEditingController();
  var dateController;
  String labelValue = 'Kategori';

  @override
  void onReady() {
    getTodo();
    super.onReady();
  }

  Future<void> addTodo() async {
    await DatabaseService.insert(TodoModel(
        todo: todoTextController.text, 
        dateTime: dateController, 
        done: "true",
        kategori: labelValue)
      );
  }

  void getTodo() async {
    todoTextController.text = '';
    dateController = '';
    List<Map<String, dynamic>> todoList = await DatabaseService.query();
    todoModelList
        .assignAll(todoList.map((data) => TodoModel.fromJson(data)).toList());
  }

  void deleteTodo(TodoModel todoModel) async {
    await DatabaseService.delete(todoModel);
    getTodo();
  }

  void getCategory(var where, String kategori) async{
    todoTextController.text = '';
    dateController = '';
    List<Map<String, dynamic>> kateList = await DatabaseService.queryClause(where, kategori);
    kategoriList.assignAll(kateList.map((data) => TodoModel.fromJson(data)).toList());
  }
}
