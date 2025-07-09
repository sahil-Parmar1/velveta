import 'package:flutter/material.dart';
import 'package:velveta/componets/navigation_bar.dart';
import 'package:flutter/services.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();

  // Hide status bar and navigation bar (makes app full screen)
  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Navigation_Bar(),

          ],
        ),
      )
      ),
    );
  }
}

