import 'package:flutter/material.dart';

import 'package:tesmon_portfolio/pages/about_page.dart';
import 'package:tesmon_portfolio/pages/contact_page.dart';
import 'package:tesmon_portfolio/pages/home_page.dart';
import 'package:tesmon_portfolio/pages/projects_page.dart';

class AboutButton extends StatefulWidget {
  const AboutButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AboutButtonState createState() => _AboutButtonState();
}

class _AboutButtonState extends State<AboutButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      duration: const Duration(milliseconds: 200),
      height: 40.0,
      /* width: MediaQuery.of(context).size.width * 0.3, */
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
      child: Hero(
        tag: "AboutPage",
        child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors
                      .transparent; // Use transparent color when button is hovered over
                }
                return const Color.fromARGB(
                    0, 131, 92, 92); // Defer to the widget's default.
              },
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds:500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const AboutPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 0.5);
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "ABOUT",
                  style: TextStyle(
                        fontFamily: 'Mono',
                        letterSpacing: 1,
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(242, 0, 0, 0),
                        ),
                ),
                _isHovering
                    ? const Icon(
                        Icons.radio_button_checked,
                        color: Colors.red,
                        size: 14.0,
                        // Choose the icon you want
                      )
                    : const Icon(
                        Icons.radio_button_unchecked,
                        color: Colors.red,
                        size: 14.0,
                        // Choose the icon you want
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeButton extends StatefulWidget {
  const HomeButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeButtonState createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      duration: const Duration(milliseconds: 200),
      height: 40.0,
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
      child: Hero(
        tag: "HomePage",
        child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors
                      .transparent; // Use transparent color when button is hovered over
                }
                return const Color.fromARGB(
                    0, 131, 92, 92); // Defer to the widget's default.
              },
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds:500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const HomePage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                 const begin = Offset(0.0, -0.5);
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "HOME",
                  style: TextStyle(
                        fontFamily: 'Mono',
                        letterSpacing: 1,
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(242, 0, 0, 0),
                        ),
                ),
                _isHovering
                    ? const Icon(
                        Icons.radio_button_checked,
                        color: Colors.green,
                        size: 14.0,
                        // Choose the icon you want
                      )
                    : const Icon(
                        Icons.radio_button_unchecked,
                        color: Colors.green,
                        size: 14.0,
                        // Choose the icon you want
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectsButton extends StatefulWidget {
  const ProjectsButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProjectsButtonState createState() => _ProjectsButtonState();
}

class _ProjectsButtonState extends State<ProjectsButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      duration: const Duration(milliseconds: 200),
      height: 40.0,
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
      child: Hero(
        tag: "ProjectsPage",
        child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors
                      .transparent; // Use transparent color when button is hovered over
                }
                return const Color.fromARGB(
                    0, 131, 92, 92); // Defer to the widget's default.
              },
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const ProjectsPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 0.5);
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                        "PROJECTS",
                        style: TextStyle(
                        fontFamily: 'Mono',
                        letterSpacing: 1,
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(242, 0, 0, 0),
                        ),
                      ),
                _isHovering
                    ? const Icon(
                        Icons.radio_button_checked,
                        color: Colors.blue,
                        size: 14.0,
                        // Choose the icon you want
                      )
                    : const Icon(
                        Icons.radio_button_unchecked,
                        color: Colors.blue,
                        size: 14.0,
                        // Choose the icon you want
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactButton extends StatefulWidget {
  const ContactButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ContactButtonState createState() => _ContactButtonState();
}

class _ContactButtonState extends State<ContactButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      duration: const Duration(milliseconds: 200),
      height: 40.0,
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
      child: Hero(
        tag: "ContactPage",
        child: TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.transparent;
                }
                return const Color.fromARGB(
                    0, 131, 92, 92); // Defer to the widget's default.
              },
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                 transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const ContactPage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 0.5);
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  "CONTACT",
                  style: TextStyle(
                        fontFamily: 'Mono',
                        letterSpacing: 1,
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(242, 0, 0, 0),
                        ),
                ),
                _isHovering
                    ? const Icon(
                        Icons.radio_button_checked,
                        color: Colors.yellow,
                        size: 14.0,
                        // Choose the icon you want
                      )
                    : const Icon(
                        Icons.radio_button_unchecked,
                        color: Colors.yellow,
                        size: 14.0,
                        // Choose the icon you want
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
