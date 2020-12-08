import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:neo_list/models/todo_model.dart';
import 'package:neo_list/services/database_service.dart';

class TodoController extends GetxController {
  var todoModelList = List<TodoModel>().obs;
  var aaa = false.obs;

  TextEditingController todoTextController = TextEditingController();
  var dateController;

  @override
  void onReady() {
    getTodo();
    super.onReady();
  }

  Future<void> addTodo() async {
    await DatabaseService.insert(TodoModel(
        todo: todoTextController.text, dateTime: dateController, done: "true"));
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
}
