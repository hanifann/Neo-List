import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:neo_list/controller/todo_controller.dart';
import 'package:neo_list/share/colors.dart';
import 'package:neo_list/share/custom_Icon.dart';
import 'package:neo_list/share/list_widget.dart';
import 'package:neo_list/view/insert/input_data_screen.dart';

import '../../share/colors.dart';
import 'card_widget.dart';

class HomeScreen extends StatelessWidget {
  final TodoController _controller = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NeumorphicAppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            color: accentColor,
            onPressed: () {
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              color: accentColor,
              onPressed: () {
                
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 36, right: 36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hai, Budi !",
                style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    color: textColor),
              ),
              SizedBox(height: 24.0),
              Text(
                "Kategori",
                style: TextStyle(color: secTextColor),
              ),
              SizedBox(height: 16.0),
              CardWidget(),
              SizedBox(height: 32.0),
              Text("Today's task", style: TextStyle(color: secTextColor)),
              SizedBox(
                height: 16.0,
              ),
              SizedBox(height: 12),
              Obx((){
                return _controller.todoModelList.isEmpty ?
                Center(
                  child: Column(
                    children: [                      
                      NeumorphicIcon(
                        CustomIcon.empty_set_mathematical_symbol,
                        size: 200,
                        style: NeumorphicStyle(
                          color: backgroundColor,
                          shadowLightColor: HexColor('#FFF')
                        ),
                      ),
                      Text(
                        'Nothing',
                        style: TextStyle(
                          fontFamily: 'Mont',
                          fontSize: 16,
                          color: thirdTextColor
                        ),
                      ),
                      Text(
                        'Go back to sleep',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Mont',
                          color: thirdTextColor
                        ),
                      )
                    ],
                  ),
                ) :
                Expanded(
                  child: ListWidget(
                    itemLength: _controller.todoModelList.length,
                    controller: _controller,
                    modelList: _controller.todoModelList,
                    )
                  );
                }
              ),
            ],
          ),
        ),
        floatingActionButton: NeumorphicFloatingActionButton(
          child: Icon(
            Icons.add,
            color: backgroundColor,
          ),
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.circle(),
            color: accentColor,
            shadowDarkColor: accentColor
          ),
          onPressed: (){
            Get.to(InsertDataScreen());
            _controller.labelValue = '';
          },
        ),
      );
  }
}
