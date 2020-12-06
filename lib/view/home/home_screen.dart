import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neo_list/share/colors.dart';

import 'card_widget.dart';

class HomeScreen extends StatelessWidget {
  bool aaa = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
          leading: InkWell(
          child: Icon(
            Icons.menu,
            color: accentColor,
          ),
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: accentColor,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 36, right: 36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hai, Budi !",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0,
              color: textColor
            ),),
            SizedBox(height: 24.0),
            Text("Kategori",
              style: TextStyle(
                color: secTextColor
              ),
            ),
            SizedBox(height: 16.0),
            CardWidget(),
            SizedBox(height: 32.0),
            Text("Today's task",
              style: TextStyle(
                color: secTextColor
              )
            ),
            SizedBox(height: 16.0,),
            Expanded(
              child: ListView.builder(
                clipBehavior: Clip.none,
                itemCount: 10,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Neumorphic(
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            NeumorphicCheckbox(
                              padding: EdgeInsets.all(1.0),
                              value: true, 
                              onChanged: (x){
                                print("asd");
                              },
                              style: NeumorphicCheckboxStyle(
                                boxShape: NeumorphicBoxShape.circle(),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Text("Tugas kerjain boss")
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      )
    );
  }
}
