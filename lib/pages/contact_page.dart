import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesmon_portfolio/pages/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
                  tag: "ContactPage",
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
                          child: Icon(Icons.radio_button_unchecked,
                              color: Colors.yellow[300], size: 12.0),
                        ),
                        Text(
                          _isHovering ? "HOME  " :"CONTACT",
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
          const ContactInfo(), // This is where we add the AboutInfo widget
        ],
      ),
    );
  }
}

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo>
    with TickerProviderStateMixin {
  bool _isHovering1 = false;
  bool _isHovering2 = false;
  final Uri url =
      Uri.parse('https://www.linkedin.com/in/clara-tesmon-56a31087/');

  _launchMailto(String email) async {
    final url = Uri.parse('mailto:$email');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 60.0),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onHover: (event) {
                setState(() {
                  _isHovering1 = true;
                });
              },
              onExit: (event) {
                setState(() {
                  _isHovering1 = false;
                });
              },
              child: GestureDetector(
                onTap: () async {
                  if (await launchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: GestureDetector(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 50.0,
                    decoration: _isHovering1
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
                    child: Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20)),
                      child: MouseRegion(
                        onHover: (event) {
                          setState(() {
                            _isHovering1 = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            _isHovering1 = false;
                          });
                        },
                        child: Center(
                          child: Text(
                            "LinkedIn",
                            style: GoogleFonts.robotoMono(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: _isHovering1
                                  ? const Color.fromARGB(255, 28, 134, 221)
                                  : const Color.fromARGB(255, 0, 0, 0),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onHover: (event) {
                setState(() {
                  _isHovering2 = true;
                });
              },
              onExit: (event) {
                setState(() {
                  _isHovering2 = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 50.0,
                decoration: _isHovering2
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
                child: GestureDetector(
                  onTap: () => _launchMailto('claratesmon@gmail.com'),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                    height: 40,
                    width: 300,
                    child: MouseRegion(
                      onHover: (event) {
                        setState(() {
                          _isHovering2 = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          _isHovering2 = false;
                        });
                      },
                      child: Center(
                        child: Text(
                          "claratesmon@gmail.com",
                          style: GoogleFonts.robotoMono(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _isHovering2
                                ? const Color.fromARGB(255, 202, 51, 41)
                                : const Color.fromARGB(255, 0, 0, 0),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
