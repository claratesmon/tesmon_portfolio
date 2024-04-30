import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tesmon_portfolio/widgets/buttons/buttons_main.dart';
import 'package:tesmon_portfolio/widgets/shapes.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Builder(
            builder: (context) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      surfaceTintColor: Colors.white,
                      shadowColor: const Color.fromARGB(119, 0, 0, 0),
                      elevation:
                          MediaQuery.of(context).size.width < 600 ? 1.8 : 1,
                      visualDensity: VisualDensity.standard),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset("images/4_hands_card_t.png", height: 30),
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
              child: Hero(
                tag: "AboutPage",
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    const Icon(
                      Icons.radio_button_unchecked,
                      color: Colors.red,
                      size: 12.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "ABOUT",
                        style: GoogleFonts.robotoMono(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: const Color.fromARGB(242, 0, 0, 0),
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

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
        child: Padding(
      padding: EdgeInsets.all(8.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        HomeButton(),
        AboutButton(),
        ProjectsButton(),
        ContactButton(),
      ]),
    ));
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30.0),
                Text.rich(
                  TextSpan(
                    text: 'Where ',
                    style: GoogleFonts.robotoMono(
                      fontSize: 26,
                      fontWeight: FontWeight.w300,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'functionality ',
                        style: GoogleFonts.robotoMono(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: 'meets',
                        style: GoogleFonts.robotoMono(
                          fontSize: 26,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                          text: ' smooth ',
                          style: GoogleFonts.outfit(
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic)),
                      TextSpan(
                        text: 'visuals',
                        style: GoogleFonts.robotoMono(
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
                        delay: 400.ms,
                        duration: 800.ms,
                        curve: Curves.easeInCubic),
                const SizedBox(height: 40.0),
                const ChangingText()
                    .animate()
                    .fadeIn(delay: 2000.ms, duration: 500.ms),
                const SizedBox(height: 60.0),
                Transform.translate(
                  offset: const Offset(-1, -1),
                  child: Text(
                    'I am Frontend Developer, drawn to visuals and impactful designs as a result of clean, scalable code.',
                    style: GoogleFonts.robotoMono(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(delay: 5000.ms, duration: 500.ms),
                ),
                const SizedBox(height: 35.0),
                Transform.translate(
                  offset: const Offset(-1, -1),
                  child: Text(
                    'Two sources of creation, that now form a synergy from where I can sculpt interfaces, ensuring a seamless union between form and function.',
                    style: GoogleFonts.robotoMono(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    textAlign: TextAlign.center,
                  ).animate().fadeIn(delay: 8000.ms, duration: 500.ms),
                ),
              ],
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
    Timer.periodic(Duration(seconds: 10), (Timer t) {
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
            fontSize: 20,
            fontWeight: FontWeight.w300,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
          textAlign: TextAlign.center),
    );
  }
}
