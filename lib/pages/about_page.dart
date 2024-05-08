import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:tesmon_portfolio/widgets/drawer_menu.dart';
import 'package:tesmon_portfolio/widgets/shapes.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool _isHovering = false;
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.grey[300],
        surfaceTintColor: Colors.grey[300],

        title: Builder(
            builder: (context) => Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 35),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(3, 3),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                        const BoxShadow(
                            color: Color.fromARGB(255, 255, 255, 255),
                            offset: Offset(-2, -2),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.grey[300],
                          surfaceTintColor: Colors.grey[300],
                          shadowColor: const Color.fromARGB(0, 44, 44, 44),
                          elevation:
                              0 /* MediaQuery.of(context).size.width < 600 ? 1.8 : 1 */,
                          ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(
                        Icons.menu_sharp,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                  ),
                )),
      ),
      drawer: const DrawerMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onHover: (event) {
                setState(() {
                  _isHovering = true;
                });
              },
              onExit: (event) {
                setState(() {
                  _isHovering = false;
                });
              },
              child:  const Hero(
                tag: "AboutPage",
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 30),
                   Icon(
                      Icons.radio_button_unchecked,
                      color: Colors.red,
                      size: 12.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "ABOUT",
                        style: TextStyle(
                        fontFamily: 'Mono',
                        letterSpacing: 2,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(242, 0, 0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const AboutInfo(), // This is where we add the AboutInfo widget
        ],
      ),
    );
  }
}

class AboutInfo extends StatefulWidget {
  const AboutInfo({super.key});

  @override
  State<AboutInfo> createState() => _AboutInfoState();
}

class _AboutInfoState extends State<AboutInfo> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BackgroundShapes(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        /* decoration: const BoxDecoration(
                gradient: RadialGradient(
                ),
              ), */
        body: Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 30.0),
                  const Text.rich(
                    TextSpan(
                      text: 'Where ',
                      style: TextStyle(
                        fontFamily: 'RobotoMono',
                        fontSize: 26,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                       
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'functionality ',
                          style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                        backgroundColor: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: 'meets',
                          style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 26,
                            fontWeight: FontWeight.w300,
                            color: Colors.black,
                        backgroundColor: Colors.white,
                          ),
                        ),
                        TextSpan(
                            text: ' smooth ',
                            style: TextStyle(
                                fontFamily: 'RobotoMono',
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                fontStyle: FontStyle.italic)),
                        TextSpan(
                          text: 'visuals',
                          style: TextStyle(
                            fontFamily: 'RobotoMono',
                            fontSize: 26,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  )
                      .animate()
                      .fadeIn(delay: 300.ms, duration: 500.ms)
                      .then()
                      .shimmer(
                          delay: 400.ms, duration: 800.ms, curve: Curves.ease),
                  const SizedBox(height: 40.0),
                  const ChangingText()
                      .animate()
                      .fadeIn(delay: 2000.ms, duration: 500.ms),
                  const SizedBox(height: 60.0),
                  Text(
                    'I am Frontend Developer, drawn to visuals and impactful designs as a result of clean, scalable code.',
                    style: GoogleFonts.robotoMono(
                      fontSize:
                          MediaQuery.of(context).size.width > 700 ? 14 : 10,
                      fontWeight: FontWeight.w300,
                      color:Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(delay: 5000.ms, duration: 500.ms),
                  const SizedBox(height: 35.0),
                  Text(
                    'Two sources of creation, that now form a synergy from where I can sculpt interfaces, ensuring a seamless union between form and function.',
                    style: GoogleFonts.robotoMono(
                      fontSize:
                          MediaQuery.of(context).size.width > 700 ? 14 : 10,
                      fontWeight: FontWeight.w300,
                       color:Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(delay: 8000.ms, duration: 500.ms),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ChangingText extends StatefulWidget {
  const ChangingText({super.key});

  @override
  ChangingTextState createState() => ChangingTextState();
}

class ChangingTextState extends State<ChangingText> {
  List<String> texts = [
    'Creating engaging digital experiences.',
    "Aligning every App's purpose with user needs."
  ];
  int index = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 10), (Timer t) {
      setState(() {
        index = (index + 1) % texts.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Text(texts[index],
          key: ValueKey<String>(texts[index]),
          style: GoogleFonts.robotoMono(
            fontSize: MediaQuery.of(context).size.width > 700 ? 20 : 16,
            fontWeight: FontWeight.w300,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          textAlign: TextAlign.center),
    );
  }
}
