import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tesmon_portfolio/widgets/buttons/buttons_main.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      backgroundColor: Colors.grey[300],
      child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HomeButton(),
            AboutButton(),
            ProjectsButton(),
            ContactButton(),
          ]),
    ).animate().fadeIn(curve: Curves.easeIn);
  }
}
