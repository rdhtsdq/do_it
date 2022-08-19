import 'package:flutter/material.dart';
import 'package:flutter_project/model/todo.dart';
import 'package:get/get.dart';

class TodoState extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  var todoList = <Todo>[].obs;

  void addTodo(Todo todo) => todoList.add(todo);
  void removeTodo(Todo todo) => todoList.remove(todo);
}
