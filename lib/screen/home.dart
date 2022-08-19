import 'package:flutter/material.dart';
import 'package:flutter_project/model/todo.dart';
import 'package:flutter_project/states/todo_state.dart';
import 'package:flutter_project/widget/widget.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Uuid uuid = Uuid();
    TodoState controller = Get.put(TodoState());
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: 18,
            left: 18,
            right: 18,
            bottom: 30,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Do It !",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Expanded(
                      child: Obx(
                        () => controller.todoList.isNotEmpty
                            ? ListView.separated(
                                padding: EdgeInsets.all(5),
                                itemBuilder: (_, index) {
                                  var item =
                                      controller.todoList.elementAt(index);
                                  return Dismissible(
                                    background: Container(
                                      color: Colors.red,
                                    ),
                                    key: Key(item.id),
                                    onDismissed: (DismissDirection direction) {
                                      controller.removeTodo(item);
                                    },
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        child:
                                            Text(item.title[0].toUpperCase()),
                                      ),
                                      title: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(item.title),
                                          CheckWidget(),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (_, index) {
                                  return Divider(
                                    color: Colors.black,
                                  );
                                },
                                itemCount: controller.todoList.length,
                              )
                            : Center(
                                child: Text("No Task Now"),
                              ),
                      ),
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: TextField(
                        onSubmitted: (v) {
                          controller.addTodo(
                            Todo(id: uuid.v4(), title: v),
                          );
                          controller.textEditingController.clear();
                          // controller.textEditingController.dispose();
                        },
                        controller: controller.textEditingController,
                        decoration: InputDecoration(
                          hintText: "Add todo",
                        ),
                      ),
                      width: 310,
                    ),
                    InkWell(
                      onTap: () {
                        controller.addTodo(
                          Todo(
                            id: uuid.v4(),
                            title: controller.textEditingController.text,
                          ),
                        );
                        FocusManager.instance.primaryFocus?.unfocus();
                        controller.textEditingController.clear();
                      },
                      child: Container(
                        child: Icon(
                          Icons.add,
                        ),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
