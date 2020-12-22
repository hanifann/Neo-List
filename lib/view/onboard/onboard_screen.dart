import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:neo_list/share/colors.dart';

class OnboardingScreen extends StatelessWidget {
  final onboardKey = GlobalKey<IntroductionScreenState>();
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      key: onboardKey,
      pages: [
        PageViewModel(
          title: "Catat semua aktivitas anda",
          body: "Dengan aplikasi Neo List anda dapat mencatat berbagai kegiatan yang anda rencanakan",
          image: Blob.fromID(
            size: MediaQuery.of(context).size.width,
            id:['5-3-1510'],
            styles: BlobStyles(
              color: thirdTextColor
            ),
            child: SvgPicture.asset(
              'asset/images/task.svg',
              
              fit: BoxFit.cover,
              height: 100,
              width: 100,
            ),
          ),
          decoration: PageDecoration(
            pageColor: backgroundColor,
            imagePadding: EdgeInsets.only(top: MediaQuery.of(context).size.height/8),
            titleTextStyle: TextStyle(
              color: textColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
            bodyTextStyle: TextStyle(
              color: secTextColor,
              fontSize: 18.0
            )
          )
        ),
        PageViewModel(
          title: "Tingkatkan produktivitas anda",
          body: "Produktivitas anda akan meningkat secara tidak langsung apabila semua kegiatan anda tercatat dengan baik",
          image: Blob.fromID(
            size: MediaQuery.of(context).size.width,
            id:['4-5-1510'],
            styles: BlobStyles(
              color: thirdTextColor
            ),
            child: SvgPicture.asset(
              'asset/images/business-woman.svg',
              
              fit: BoxFit.contain,
              height: 100,
              width: 100,
            ),
          ),
          decoration: PageDecoration(
            pageColor: backgroundColor,
            imagePadding: EdgeInsets.only(top: MediaQuery.of(context).size.height/8),
            titleTextStyle: TextStyle(
              color: textColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
            bodyTextStyle: TextStyle(
              color: secTextColor,
              fontSize: 18.0
            )
          )
        ),
        PageViewModel(
          title: "Worry-free",
          body: "Anda tidak perlu khawatir karena semua aktivitas anda sudah tersimpan dengan baik",
          image: Blob.fromID(
            size: MediaQuery.of(context).size.width,
            id:['5-3-1520'],
            styles: BlobStyles(
              color: thirdTextColor
            ),
            child: SvgPicture.asset(
              'asset/images/happy.svg',
              
              fit: BoxFit.contain,
              height: 100,
              width: 100,
            ),
          ),
          decoration: PageDecoration(
            pageColor: backgroundColor,
            imagePadding: EdgeInsets.only(top: MediaQuery.of(context).size.height/8),
            titleTextStyle: TextStyle(
              color: textColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
            bodyTextStyle: TextStyle(
              color: secTextColor,
              fontSize: 18.0
            )
          )
        ),
        PageViewModel(
          titleWidget: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
            child: Text('Selamat Datang !'),
          ),
          bodyWidget: Container(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/2,
                  child: Form(
                   child: TextFormField(
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderSide: BorderSide(
                           width: 2,
                           color: secTextColor
                         )
                       )
                     ),
                   ),
                  ),
                ),
              ],
            ),
          ),
          decoration: PageDecoration(
            pageColor: backgroundColor,
            imagePadding: EdgeInsets.only(top: MediaQuery.of(context).size.height/8),
            titleTextStyle: TextStyle(
              color: textColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
            bodyTextStyle: TextStyle(
              color: secTextColor,
              fontSize: 18.0
            )
          )
        ),
      ],
      showSkipButton: true,
      showNextButton: true,
      skip: Text('skip',
        style: TextStyle(
          color: secTextColor,
          fontFamily: 'asset/fonts/Mont'
        ),
      ),
      next: NeumorphicButton(
        onPressed: (){},
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
        style: NeumorphicStyle(
          color: accentColor,
          shadowDarkColor: accentColor,
          boxShape: NeumorphicBoxShape.stadium()
        ),
      ),
      done: NeumorphicButton(
        onPressed: (){},
        child: Text('Mulai',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        style: NeumorphicStyle(
          color: accentColor,
          shadowDarkColor: accentColor,
          boxShape: NeumorphicBoxShape.stadium()
        ),
      ),
      dotsDecorator: DotsDecorator(
        activeColor: accentColor,
        color: thirdTextColor,
        size: Size.square(10.0),
        activeSize: Size(20.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0)
        )
      ),
      onDone: () {  },
    );
  }
}