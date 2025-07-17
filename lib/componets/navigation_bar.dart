///this is navigation bar
///it is responsible based on device
///with shipping label

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velveta/state/models/hover_state.dart';
import 'package:velveta/state/providers.dart';
import 'package:velveta/utils/colors.dart';
import 'package:velveta/utils/textstyles.dart';

class Navigation_Bar extends ConsumerStatefulWidget {
  const Navigation_Bar({super.key});

  @override
  ConsumerState<Navigation_Bar> createState() => _NavigationBarState();
}

class _NavigationBarState extends ConsumerState<Navigation_Bar> {


  @override
  Widget build(BuildContext context) {


    //for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isPhone = screenWidth < 480;
    final bool isTablet = screenWidth >= 480 && screenWidth < 1024;
    final bool isDesktop = screenWidth >= 1024;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            shippingLabel(screenWidth),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 1000,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (!isDesktop) buildCompactMenuIcons(isTablet),
                    buildLogo(screenWidth),
                    if (isDesktop) buildMenuItems(),
                    buildActionIcons(isDesktop, isTablet),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  //for menu iteam
  Widget _buildMenuItem(WidgetRef ref, HoverData hoverData, String item) {
    final isHovered = hoverData.isHovering && hoverData.menuItem == item;

    return MouseRegion(
      onEnter: (_) {
        ref.read(hoverProvider.notifier).state =
            ref.read(hoverProvider).copyWith(isHovering: true, menuItem: item);
      },
      onExit: (_) {
        // Optional: reset hover if needed
      },
      child: GestureDetector(
        onTap: () {
          if(hoverData.isHovering)
            ref.read(hoverProvider.notifier).state =
                ref.read(hoverProvider).copyWith(isHovering: false, menuItem: item);
            else
          ref.read(hoverProvider.notifier).state =
              ref.read(hoverProvider).copyWith(isHovering: true, menuItem: item);
        },
        child: Text(
          item,
          style: isHovered
              ? TextstylesDesktop.menulabelhoverstyle
              : TextstylesDesktop.menulabelstyle,
        ),
      ),
    );
  }


  /// Logo based on screen size
  Widget buildLogo(double screenWidth) {
    final isTabletOrMore = screenWidth >= 600;
    return Image.asset(
      isTabletOrMore ? "assets/logos/logodesktop.png" : "assets/logos/logomoblie.png",
      width: isTabletOrMore ? 182 : 130,
      height: isTabletOrMore ? 79 : 65,
    );
  }

  /// Menu items for desktop view
  Widget buildMenuItems() {
    final menuItems = [
      "Collections",
      "New In",
      "Velvetaweek",
      "Plus Size",
      "Sustainability",
    ];

    final hoverData=ref.watch(hoverProvider);
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: menuItems.map((item) => _buildMenuItem(ref, hoverData, item)).toList(),
      ),
    );
  }

  /// Action icons (search, profile, heart, cart)
  Widget buildActionIcons(bool isDesktop, bool isTablet) {
    final iconSize = isTablet ? 30.0 : 28.0;

    if (isDesktop) {
      return Row(
        children: const [
          Icon(Icons.search, size: 30),
          SizedBox(width: 10),
          Icon(CupertinoIcons.person, size: 30),
          SizedBox(width: 10),
          Icon(CupertinoIcons.heart, size: 30),
          SizedBox(width: 10),
          Icon(Icons.shopping_bag_outlined, size: 30),
        ],
      );
    } else {
      return Row(
        children: [
          Icon(CupertinoIcons.heart, size: iconSize),
          const SizedBox(width: 10),
          Icon(Icons.shopping_bag_outlined, size: iconSize),
        ],
      );
    }
  }

  /// Menu + Search for phone/tablet
  Widget buildCompactMenuIcons(bool isTablet) {
    final iconSize = isTablet ? 30.0 : 28.0;
    return Row(
      children: [
        Icon(Icons.menu, size: iconSize),
        const SizedBox(width: 10),
        Icon(Icons.search, size: iconSize),
      ],
    );
  }
}
/// Shipping label at the top
Widget shippingLabel(double screenWidth) {
  bool isDesktop = screenWidth >= 600;
  return Container(
    decoration: BoxDecoration(color: AppColors.mossStone),
    child: Center(
      child: Text(
        "Enjoy Free Shipping On All Orders",
        style: isDesktop ? TextstylesDesktop.labelstyle : TextstylesMobile.labelstyle,
      ),
    ),
  );
}