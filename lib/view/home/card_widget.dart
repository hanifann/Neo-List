import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:neo_list/share/colors.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var neumorphic = Neumorphic(
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
            Text("Bussiness",
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
    );
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      child: ListView.builder(
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(right: 18.0),
            width: 200,
            child: neumorphic
          );
        },
      ),
    );
  }
}
