import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velveta/componets/bottom_bar.dart';
import 'package:velveta/componets/navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:velveta/state/providers.dart';
import 'dart:ui';

void main() {
  runApp(ProviderScope(child: Myapp()));
}

class Myapp extends ConsumerWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final hoverData=ref.watch(hoverProvider);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(height: 100,),
                // Dropdown
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Just a Column with many Containers instead of ListView
                        ...List.generate(
                          100,
                              (index) => Container(
                            padding: EdgeInsets.all(16),
                            child: Text("hello $index"),
                          ),
                        ),
                        Bottom_Bar(), // Don't wrap in Flexible here
                      ],
                    ),
                  ),
                ),
              ],
            ),

            if (hoverData.isHovering)
              Positioned(
                top: 60, // Start below navbar
                left: 0,
                right: 0,
                bottom: 0,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Navigation_Bar(),
            ),

            if (hoverData.isHovering) ...[
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: MouseRegion(
                  onEnter: (_) =>  ref.read(hoverProvider.notifier).state=ref.read(hoverProvider).copyWith(isHovering: true),
                  onExit: (_) => ref.read(hoverProvider.notifier).state=ref.read(hoverProvider).copyWith(isHovering: false),
                  child: Text("${hoverData.menuItem}"),
                ),
              )
            ],
          ],
        ),
      )
      ),
    );
  }
  
}

