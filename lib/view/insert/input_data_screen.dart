import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:neo_list/controller/todo_controller.dart';
import 'package:neo_list/share/colors.dart';

import '../../share/colors.dart';

class InsertDataScreen extends StatelessWidget {
  final TodoController _controller = Get.find<TodoController>();
  final _formKey = GlobalKey<FormState>();
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        leading: Container(),
        actions: [
          InkWell(
            child: Icon(
              Icons.close,
              color: accentColor,
            ),
            onTap: (){
              Get.back();
              _controller.getCategory('kategori','Work');
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Apa yang anda rencanakan ?",
              style: TextStyle(
                color: thirdTextColor
              )
            ),
            Expanded(
              child: Form(
                key: _formKey,
                child: TextFormField(
                  controller: _controller.todoTextController,
                  autofocus: true,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: secTextColor
                  ),
                  maxLines: 255,
                  validator: (value) => value.trim().isEmpty ? 'Form harap diisi' : null ,
                ),
              ),
            ),
            Divider(
              color: secTextColor,
            ),
            DateTimePicker(
              type: DateTimePickerType.dateTime,
              icon: Icon(
                Icons.date_range,
                color: accentColor,
              ),
              initialValue: DateTime.now().toString(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Icon(
                Icons.date_range,
                color: accentColor,
                ),
                border: InputBorder.none
              ),
              onChanged: (val)=> _controller.dateController = val,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 12.0, right: 13.0),
                  child: Icon(
                    Icons.label_outline_rounded,
                    color: accentColor,
                  )
                ),
                Expanded(
                  child: DropdownButton<String>(
                    hint: Text(_controller.labelValue),
                    isExpanded: true,
                    underline: Container(),
                    onChanged: (String newValue) {
                      _controller.labelValue = newValue;
                    },
                    items: <String>['Work', 'Study', 'Shop', 'Travel']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: NeumorphicButton(
                child: Center(
                  child: Text("Simpan",
                    style: TextStyle(
                      color: textColor
                    ),)
                ),
                onPressed: () async{
                  if(_formKey.currentState.validate()){
                    await _controller.addTodo();
                  }
                  print(_controller.labelValue);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}