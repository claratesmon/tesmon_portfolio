import 'package:flutter/material.dart';

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
      child: Container(
        height: 30.0,
        decoration: _isHovering
            ? BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(220, 167, 167, 167),
                      offset: Offset(4, 4),
                      blurRadius: 10.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color: Color.fromARGB(255, 247, 247, 247),
                      offset: Offset(-3, -3),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                ],
              )
            : null,
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
            // Other styles...
          ),
          onPressed: () {
            // Handle button press
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
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
                size: 10.0,
              ), // Choose the icon you want
            ],
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
      child: Container(
        height: 30.0,
        decoration: _isHovering
            ? BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(220, 167, 167, 167),
                      offset: Offset(4, 4),
                      blurRadius: 10.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color: Color.fromARGB(255, 247, 247, 247),
                      offset: Offset(-3, -3),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                ],
              )
            : null,
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
            // Other styles...
          ),
          onPressed: () {
            // Handle button press
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
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
                size: 10.0,
              ), // Choose the icon you want
            ],
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
      child: Container(
        height: 30.0,
        decoration: _isHovering
            ? BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(220, 167, 167, 167),
                      offset: Offset(4, 4),
                      blurRadius: 10.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color: Color.fromARGB(255, 247, 247, 247),
                      offset: Offset(-3, -3),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                ],
              )
            : null,
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
            // Other styles...
          ),
          onPressed: () {
            // Handle button press
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
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
                size: 10.0,
              ), // Choose the icon you want
            ],
          ),
        ),
      ),
    );
  }
}

