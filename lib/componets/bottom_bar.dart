///this is componet of bottom bar 

import 'package:flutter/material.dart';
import 'package:velveta/utils/colors.dart';

class Bottom_Bar extends StatelessWidget {
  const Bottom_Bar({super.key});

  @override
  Widget build(BuildContext context) {
    //for responsiveness
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final bool isPhone = screenWidth < 480;
    final bool isTablet = screenWidth >= 480 && screenWidth < 1024;
    final bool isDesktop = screenWidth >= 1024;

    if(isPhone)
    return Center(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        constraints: BoxConstraints(
          maxWidth: 480
        ),
        decoration: BoxDecoration(
          color: AppColors.slateGray
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildfristcolumn(isDesktop, isTablet),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildAbout(isDesktop, isTablet)),
                      Expanded(child: _buildHelp(isDesktop, isTablet))
                    ],
                  ),
                  SizedBox(height: 10,),
                  _buildJoinup(isDesktop, isTablet),
                  SizedBox(height: 10,),
                  _buildsocialactions(isDesktop, isTablet)
                ],
              ),
            )
          ],
        ),
      ),
    );
    else if(isDesktop)
      return Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: AppColors.slateGray
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Expanded(
               child: Column(
                 children: [
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: 1000
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(child: _buildfristcolumn(isDesktop, isTablet)),
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildAbout(isDesktop, isTablet),
                              _buildHelp(isDesktop, isTablet),
                              _buildJoinup(isDesktop, isTablet)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                   SizedBox(height: 25,),
                   Container(
                       constraints: BoxConstraints(
                           maxWidth: 1000
                       ),
                       child: _buildsocialactions(isDesktop, isTablet))
                 ],
               ),
             )
            ],
          ),
        ),
      );
    else
      //for tablet
      return Center(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: AppColors.slateGray
          ),
          child:Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: _buildfristcolumn(isDesktop, isTablet)),

                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: _buildAbout(isDesktop, isTablet)),
                  Flexible(child:_buildHelp(isDesktop, isTablet)),
                  Flexible(child:_buildJoinup(isDesktop, isTablet))
                ],
              ),
              SizedBox(height: 15,),
              Container(
                  constraints: BoxConstraints(
                    maxWidth: 600
                  ),
                  child: _buildsocialactions(isDesktop, isTablet))
            ],
          ),
        ),
      );
  }

  //for label and asking email address for subscribe
  Widget _buildfristcolumn(bool isDesktop,bool isTablet)
  {
    return Container(
      padding: EdgeInsets.all(8.0),
      constraints: BoxConstraints(
        maxWidth: 500
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Join Our Club,Get 15% Off For Your Birthday",style: TextStyle(fontSize: isDesktop?18:isTablet?16:14,color: Colors.white70),),
          SizedBox(height: 10,),
          Container(
            constraints: BoxConstraints(
              maxHeight: 40
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                hintStyle: TextStyle(color: Colors.grey),
                suffixIcon: Icon(Icons.arrow_forward, color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16.0,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {

                },
                activeColor: Colors.grey,        // Box fill color when checked
                checkColor: Colors.white,              // Check mark color
                side: BorderSide(                      // Border when unchecked
                  color: Colors.grey,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(         // Rounded checkbox
                  borderRadius: BorderRadius.circular(4),
                ),
              ),

              Expanded(child: Text("By Submitting Your email,you agree to receive advertising emails from velveta",style: TextStyle(color: Colors.white60,fontSize: isDesktop?12:10),)),

            ],
          )

        ],
      ),
    );
  }

  //for about list
  Widget _buildAbout(bool isDesktop,bool isTablet)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("About Velveta",style: TextStyle(fontSize: isDesktop?16:isTablet?14:12,color: Colors.white70),),
        SizedBox(height: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Collection",style: TextStyle(fontSize: isDesktop?14:isTablet?12:10,color: Colors.white54),),
            Text("Sustainability",style: TextStyle(fontSize: isDesktop?14:isTablet?12:10,color: Colors.white54),),
            Text("Privacy Policy",style: TextStyle(fontSize: isDesktop?14:isTablet?12:10,color: Colors.white54),),
            Text("Support System",style: TextStyle(fontSize: isDesktop?14:isTablet?12:10,color: Colors.white54),),
            Text("Terms & Condition",style: TextStyle(fontSize: isDesktop?14:isTablet?12:10,color: Colors.white54),),
            Text("Copyright Notice",style: TextStyle(fontSize: isDesktop?14:isTablet?12:10,color: Colors.white54),),
          ],
        )
      ],
    );
  }

  //for help & support
  Widget _buildHelp(bool isDesktop,bool isTablet)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Help & Support",style: TextStyle(fontSize: isDesktop?16:isTablet?14:12,color: Colors.white70),),
        SizedBox(height: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Orders & Shipping",style: TextStyle(fontSize: isDesktop?14:isTablet?12:10,color: Colors.white54),),
            Text("Returns & Refunds",style: TextStyle(fontSize: isDesktop?14:isTablet?12:10,color: Colors.white54),),
            Text("FAQs",style: TextStyle(fontSize: isDesktop?14:isTablet?12:10,color: Colors.white54),),
            Text("Contect Us",style: TextStyle(fontSize: isDesktop?14:isTablet?12:10,color: Colors.white54),),
          ],
        )
      ],
    );
  }

  //for join up
  Widget _buildJoinup(bool isDesktop,bool isTablet)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Join Up",style: TextStyle(fontSize: isDesktop?16:isTablet?14:12,color: Colors.white70),),
        SizedBox(height: 10,),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Velveta Club",style: TextStyle(fontSize: isDesktop?14:isTablet?12:10,color: Colors.white54),),
            Text("Careers",style: TextStyle(fontSize: isDesktop?14:isTablet?12:10,color: Colors.white54),),
            Text("Visit Us",style: TextStyle(fontSize: isDesktop?14:isTablet?12:10,color: Colors.white54),),
          ],
        )
      ],
    );
  }

  //for social actions
 Widget _buildsocialactions(bool isDesktop,bool isTablet)
 {
   List<String> logopaths=[
     "assets/logos/instagram.png",
     "assets/logos/facebook.png",
     "assets/logos/pininterst.png",
     "assets/logos/tiktok.png",
   ];
   double size=isDesktop?20:isTablet?18:15;
   return Center(
     child: Container(
       child: Row(
         children: [
           Expanded(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   children: List.generate(logopaths.length, (index){
                     return Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 2.0),
                       child: Image(image: AssetImage(logopaths[index]),
                       width: size,
                         height: size,
                       ),
                     );
                   }),
                 ),
                 SizedBox(height: 5,),
                 Row(
                   children: [
                     Icon(Icons.copyright,size: 15,color: Colors.white24,),
                     Expanded(child: Text("2025 Velveta. All Rights Reserved",style: TextStyle(color: Colors.white24),)),
                   ],
                 )
               ],
             ),
           ),
           Container(
             decoration: BoxDecoration(
               color:AppColors.OliveMoss,
               border: Border.all(width: 2,color: Colors.white60)
             ),
             child: Padding(
               padding: EdgeInsets.all(isDesktop?8.0:isTablet?5.0:4.0),
               child: Icon(Icons.chat_outlined,color: Colors.white60,),
             ),
           )
         ],
       ),
     ),
   );
 }


}



