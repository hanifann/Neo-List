import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:neo_list/controller/category_contrloller.dart';
import 'package:neo_list/share/colors.dart';
import 'package:neo_list/share/custom_Icon.dart';
import 'package:neo_list/share/list_widget.dart';

class CategoryScreen extends StatelessWidget {
  final String categoryTitle;
  final CategoryContrloller _categoryController = Get.put(CategoryContrloller());

  CategoryScreen({Key key, this.categoryTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        title: Text(categoryTitle),
        leading: NeumorphicButton(
          child: Icon(
            Icons.arrow_back,
            color: accentColor,
          ),
          onPressed: () => Get.back(),
          style: NeumorphicStyle(
            boxShape: NeumorphicBoxShape.circle()
          ),
        ),
      ),
      body: Obx((){
        return _categoryController.categoryList.isEmpty ?
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [                      
              Center(
                child: NeumorphicIcon(
                  CustomIcon.empty_set_mathematical_symbol,
                  size: 200,
                  style: NeumorphicStyle(
                    color: backgroundColor,
                    shadowLightColor: HexColor('#FFF')
                  ),
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
          ) : 
          Expanded(
            child: ListWidget(
              itemLength: _categoryController.categoryList.length,
              controller: _categoryController,
              modelList: _categoryController.categoryList,
            ),
          );
        }
      ),
    );
  }
}
