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
    return MouseRegion(
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
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const AboutPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, -1.0);
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "ABOUT",
                  style: TextStyle(
                      color: Color.fromARGB(255, 1, 1, 1),
                      fontFamily: "Mono",
                      fontWeight: FontWeight.w100),
                ),
                Icon(
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
    return MouseRegion(
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
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const HomePage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, -1.0);
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "HOME",
                  style: TextStyle(
                      color: Color.fromARGB(255, 1, 1, 1),
                      fontFamily: "Mono",
                      fontWeight: FontWeight.w100),
                ),
                Icon(
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
    return MouseRegion(
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
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const ProjectsPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, -1.0);
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "PROJECTS",
                  style: TextStyle(
                      color: Color.fromARGB(255, 1, 1, 1),
                      fontFamily: "Mono",
                      fontWeight: FontWeight.w100),
                ),
                Icon(
                  Icons.radio_button_unchecked,
                  color: Colors.blue,
                  size: 14.0,
                ),
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
    return MouseRegion(
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
                  return const Color.fromARGB(
                      0, 131, 92, 92); // Defer to the widget's default.
                },
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const ContactPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(0.0, -1.0);
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "CONTACT",
                  style: TextStyle(
                      color: Color.fromARGB(255, 1, 1, 1),
                      fontFamily: "Mono",
                      fontWeight: FontWeight.w100),
                ),
                Icon(
                  Icons.radio_button_unchecked,
                  color: Colors.yellow,
                  size: 14.0,
                ), 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
