///for all text styles is used in project

import 'package:flutter/material.dart';
import 'colors.dart';

class TextstylesDesktop
{
  //for label style
  static const TextStyle labelstyle=TextStyle(
    fontSize: 18,
    color: AppColors.cloudMist,
      fontWeight: FontWeight.w300
  );

  //for menu label style
 static const TextStyle menulabelstyle=TextStyle(
   fontSize: 18,
   color:AppColors.smokyGranite,
   fontWeight: FontWeight.w400
 );
  static const TextStyle menulabelhoverstyle=TextStyle(
      fontSize: 18,
      color:AppColors.mossStone,
      fontWeight: FontWeight.w500
  );
}

class TextstylesMobile
{
  //for label style
  static const TextStyle labelstyle=TextStyle(
      fontSize: 15,
      color: AppColors.cloudMist,
      fontWeight: FontWeight.w300
  );

}