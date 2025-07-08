///this is navigation bar
///it is responsible based on device
///with shipping label

import 'package:flutter/material.dart';
import 'package:velveta/utils/colors.dart';
import 'package:velveta/utils/textstyles.dart';
import 'package:flutter/cupertino.dart';

class Navigation_Bar extends StatefulWidget {
  const Navigation_Bar({super.key});

  @override
  State<Navigation_Bar> createState() => _NaviagationBarState();
}

class _NaviagationBarState extends State<Navigation_Bar> {
  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context,constraints) {

        return Column(
          children: [
            shippinglable(screenWidth),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: screenWidth>=600?1000:600
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //menu icon when screen is smalll
                    if(screenWidth<850)
                      Row(
                        children: [
                          Icon(Icons.menu,size: screenWidth>=600?30:28,),
                          SizedBox(width: 10,),
                          Icon(Icons.search,size: screenWidth>=600?30:28,)
                        ],
                      ),

                    Image(image: AssetImage(screenWidth>=600?"assets/logos/logodesktop.png":"assets/logos/logomoblie.png"),
                    width: screenWidth>=600?182:130,
                      height: screenWidth>=600?79:65,
                    ),

                    //show menu iteams only when screen is big
                    if(screenWidth>=850)
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: 500
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Collections",style: TextstylesDesktop.menulabelstyle,),
                            Text("New In",style: TextstylesDesktop.menulabelstyle,),
                            Text("Velvetaweek",style: TextstylesDesktop.menulabelstyle,),
                            Text("Plus Size",style: TextstylesDesktop.menulabelstyle,),
                            Text("Sustainability",style: TextstylesDesktop.menulabelstyle,),
                          ],
                        ),
                      ),

                    if(screenWidth>=850)
                    Row(
                      children: [
                        Icon(Icons.search,size: 30,),
                        SizedBox(width: 10,),
                        Icon(CupertinoIcons.person,size: 30,),
                        SizedBox(width: 10,),
                        Icon(CupertinoIcons.heart,size: 30,),
                        SizedBox(width: 10,),
                        Icon(Icons.shopping_bag_outlined,size: 30,)
                      ],
                    ),

                    if(screenWidth<850)
                      Row(
                        children: [
                          Icon(CupertinoIcons.heart,size: screenWidth>=600?30:28,),
                          SizedBox(width: 10,),
                          Icon(Icons.shopping_bag_outlined,size: screenWidth>=600?30:28,)
                        ],
                      ),
                  ],
                ),
              ),
            ),



          ],
        );
      }
    );
  }
}


//shipping label
Widget shippinglable(double screenwidth)
{
  bool isdesktop=screenwidth>=600;
  return Container(
      decoration: BoxDecoration(
        color: AppColors.mossStone,

      ),
    child: Center(
      child: Text("Enjoy Free Shipping On All Orders",style: isdesktop?TextstylesDesktop.labelstyle:TextstylesMobile.labelstyle,),
    ),
  );
}
