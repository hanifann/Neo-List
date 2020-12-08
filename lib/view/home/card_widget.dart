import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/state_manager.dart';
import 'package:neo_list/share/colors.dart';
import 'package:get/get.dart';
import '../../controller/todo_controller.dart';

class CardWidget extends StatelessWidget {
  final TodoController _controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: _controller.categoryItemList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 18.0),
            width: 200,
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 16, 8.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("40 task", style: TextStyle(color: thirdTextColor)),
                    SizedBox(height: 8.0),
                    Text(_controller.categoryItemList[index],
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: textColor)
                    ),
                    SizedBox(height: 8.0),
                    NeumorphicProgress(
                      height: 5.0,
                      percent: 0.50,
                    )
                  ],
                ),
              ),
            )
          );
        },
      ),
    );
  }
}
