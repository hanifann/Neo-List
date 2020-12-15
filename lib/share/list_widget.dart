import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

import 'colors.dart';

class ListWidget extends StatelessWidget {
  final int itemLength;
  final controller;
  final modelList;

  const ListWidget({Key key, this.itemLength, this.controller, this.modelList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      clipBehavior: Clip.none,
      itemCount: itemLength,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Neumorphic(
                style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12))),
                child: ListTile(
                  leading: Obx(() {
                    return NeumorphicCheckbox(
                      value: controller
                          .intToBoolean(modelList[index].done),
                      onChanged: (x) {
                        var changed = modelList[index];
                        changed.done = controller.boolToInt(x);
                        modelList[index] = changed;
                        debugPrint(changed.done.toString());
                        controller.updateTodo(
                          modelList[index].todo,
                          modelList[index].date,
                          changed.done,
                          modelList[index].kategori,
                          modelList[index].jam,
                          modelList[index].id
                        );
                      },
                      style: NeumorphicCheckboxStyle(
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                    );
                  }),
                  title: Text(
                    modelList[index].todo,
                    style: TextStyle(color: textColor),
                  ),
                  subtitle: Text(
                      modelList[index].date.toString() +
                          ' - ' +
                          modelList[index].jam,
                      style: TextStyle(color: secTextColor)),
                  trailing: InkWell(
                    child: Icon(
                      Icons.close,
                      color: accentColor,
                    ),
                    onTap: () {
                      controller.deleteTodo(modelList[index]);
                    },
                  ),
                )));
      },
    );
  }
}
