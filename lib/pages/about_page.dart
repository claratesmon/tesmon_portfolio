import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesmon_portfolio/pages/home_page.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
      body: Column(
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
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 40.0,
                decoration: _isHovering
                    ? BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(158, 189, 189, 189),
                              offset: Offset(4, 4),
                              blurRadius: 10.0,
                              spreadRadius: 2.0),
                          BoxShadow(
                              color: Color.fromARGB(255, 247, 247, 247),
                              offset: Offset(-3, -3),
                              blurRadius: 10.0,
                              spreadRadius: 2.0),
                        ],
                      )
                    : BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                      ),
                child: Hero(
                  tag: "AboutPage",
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.transparent;
                          }
                          return const Color.fromARGB(0, 131, 92, 92);
                        },
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const HomePage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.easeInOut;
                            final tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            final offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        MouseRegion(
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
                          child: const Icon(Icons.radio_button_unchecked,
                              color: Colors.red, size: 12.0),
                        ),
                        Text(
                          "HOME",
                          style: GoogleFonts.robotoMono(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: const Color.fromARGB(242, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
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
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      text: '\nsmooth ',
                      style: GoogleFonts.outfit(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic),
                    ),
                    TextSpan(
                      text: ' visuals',
                      style: GoogleFonts.robotoMono(
                        fontSize: 26,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(delay: 400.ms, duration: 500.ms)
                  .then()
                  .shimmer(
                      delay: 400.ms,
                      duration: 800.ms,
                      curve: Curves.easeInCubic),
              const SizedBox(height: 30.0),
              Text(
                'Creating engaging digital experiences.',
                style: GoogleFonts.robotoMono(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ).animate().fadeIn(delay: 1000.ms, duration: 500.ms),
              const SizedBox(height: 15.0),
              Text(
                "Aligning every App's purpose with user needs.",
                style: GoogleFonts.robotoMono(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.right,
              ).animate().fadeIn(delay: 1000.ms, duration: 500.ms),
              const SizedBox(height: 35.0),
              Transform.translate(
                offset: const Offset(-1, -1),
                child: Text(
                  'I am Junior Frontend Developer, drawn to visuals and impactful designs as a result of clean, scalable code.\nTwo sources of creation, that now form a synergy from where I can sculpt interfaces ensuring a seamless union between form and function.',
                  style: GoogleFonts.robotoMono(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: const Color.fromARGB(255, 0, 0, 0),
                  ),
                ).animate().fadeIn(delay: 3000.ms, duration: 500.ms),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
