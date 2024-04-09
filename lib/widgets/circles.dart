import 'package:flutter/material.dart';

class CirclesWidget extends StatefulWidget {
  const CirclesWidget({super.key});

  @override
  State<CirclesWidget> createState() => _CirclesWidgetState();
}

class _CirclesWidgetState extends State<CirclesWidget> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    double scale = MediaQuery.of(context).size.width < 600 ? 0.7 : 1.0;
    return Transform.scale(
      scale: scale,
      child: SizedBox(
        height: 400,
        child: Stack(
          children: [
            // Background container (white box)
            Container(
              alignment: Alignment.center,
              height: 100,
            ),
            // First circle (bottom)
            AnimatedAlign(
              alignment: const Alignment(-0.3, 0.7),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.yellow,
                      width: 1.0, // Adjust the width as desired
                    )),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTapped = !_isTapped;
                    });
                  },
                  child: CircleAvatar(
                    radius: 80.0,
                    backgroundColor: Colors.transparent,
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundColor: _isTapped
                          ? const Color.fromARGB(123, 255, 255, 0)
                          : Colors.transparent,
                      // Customize the word inside the circle
                      child: Align(
                        alignment: const Alignment(-0.5, 0.5),
                        child: Text(
                          'VISUAL\nDESIGN',
                          style: TextStyle(
                            color: _isTapped
                                ? Colors.black
                                : const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 12,
                            fontFamily: "Mono",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Third circle (top)
            Align(
              alignment: const Alignment(0.3, 0.7),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.redAccent,
                    width: 1.0, // Adjust the width as desired
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTapped = !_isTapped;
                    });
                  },
                  child: CircleAvatar(
                    radius: 80.0,
                    backgroundColor: _isTapped
                        ? const Color.fromARGB(128, 255, 82, 82)
                        : Colors.transparent,
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundColor: Colors.transparent,
                      // Customize the word inside the circle
                      child: Align(
                        alignment: const Alignment(0.6, 0.5),
                        child: Text(
                          'UX/UI',
                          style: TextStyle(
                            color: _isTapped
                                ? Colors.black
                                : const Color.fromARGB(255, 255, 255, 255),
                            fontSize: 12,
                            fontFamily: "Mono",
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Second circle (middle)
            Align(
              alignment: const Alignment(0, -0.4),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 1.0, // Adjust the width as desired
                  ),
                ),
                child: CircleAvatar(
                  radius: 130.0,
                  backgroundColor: Colors.transparent,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isTapped = !_isTapped;
                      });
                    },
                    child: CircleAvatar(
                      radius: 130.0,
                      backgroundColor: _isTapped
                          ? const Color.fromARGB(131, 68, 137, 255)
                          : Colors.transparent,
                      // Customize the word inside the circle
                      child: Align(
                        alignment: const Alignment(0, -0.3),
                        child: Text(
                          'FRONTEND DEVELOPMENT',
                          style: TextStyle(
                              color: _isTapped
                                  ? Colors.black
                                  : const Color.fromARGB(0, 255, 255, 255),
                              fontWeight: FontWeight.w300,
                              fontFamily: "Mono",
                              fontSize: 12),
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
