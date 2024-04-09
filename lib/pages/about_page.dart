import 'package:flutter/material.dart';
import 'package:tesmon_portfolio/pages/home_page.dart';

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
                height: 30.0,
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
                            const curve = Curves.ease;
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
                          child: const Icon(
                            Icons.radio_button_unchecked,
                            color: Colors.red,
                            size: 12.0
                          ), /* Text(
                            "BACK",
                            style: TextStyle(
                              color: _isHovering
                                  ? const Color.fromARGB(255, 1, 1, 1)
                                  :Colors.white ,
                              fontFamily: "Mono",
                              fontWeight: FontWeight.w100,
                            ),
                          ), */
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.black,
                          size: 10.0,
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

class AboutInfo extends StatelessWidget {
  const AboutInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30.0),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'ABOUT',
            style: TextStyle(
              fontSize: 40.0,
              fontFamily: "Mono",
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'I smell like beef I smell like beef I smell like beef I smell like beef I smell like beef I smell like beef I smell like beef I smell like beef I smell like beef I smell like beef .',
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'More random text goes here.',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
