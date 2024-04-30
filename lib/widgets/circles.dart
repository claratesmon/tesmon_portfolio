import 'package:flutter/material.dart';

class CirclesWidget extends StatefulWidget {
  const CirclesWidget({super.key});

  @override
  State<CirclesWidget> createState() => _CirclesWidgetState();
}

class _CirclesWidgetState extends State<CirclesWidget> {
  bool _isTappedYellow = false;
  bool _isTappedRed = false;
  bool _isTappedBlue = false;

  @override
  Widget build(BuildContext context) {
    double scale = MediaQuery.of(context).size.width < 700 ? 0.7 : 1.0;
    double maxWidth = MediaQuery.of(context).size.width ;
    return Transform.scale(
      scale: scale,
      child: SizedBox(
        height: 400,
        width: 400,
        child: Stack(
          children: [
            // Background container (white box)
            /* Container(
                alignment: Alignment.center,
                height: 100,
              ), */
            // First circle (left)
            AnimatedAlign(
              alignment: maxWidth > 500
                  ? const Alignment(-0.5, 0.7)
                  : const Alignment(-0.4, 0.7),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Color.fromARGB(255, 255, 235, 59),
                      width: 1.0,
                    )),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTappedYellow = !_isTappedYellow;
                    });
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundColor: _isTappedYellow
                          ? Color.fromARGB(255, 255, 255, 154)
                          : Colors.transparent,
                      // Customize the word inside the circle
                      child: Align(
                        alignment: const Alignment(-0.5, 0.5),
                        child: Text(
                          'VISUAL\nDESIGN',
                          style: TextStyle(
                            color: _isTappedYellow
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

            // Third circle (right)
            AnimatedAlign(
              alignment: maxWidth > 500
                  ? const Alignment(0.5, 0.7)
                  : const Alignment(0.4, 0.7),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
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
                      _isTappedRed = !_isTappedRed;
                    });
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: CircleAvatar(
                      radius: 80.0,
                      backgroundColor: _isTappedRed
                          ? const Color.fromARGB(128, 255, 82, 82)
                          : Colors.transparent,
                      child: Align(
                        alignment: const Alignment(0.6, 0.5),
                        child: Text(
                          'UX/UI',
                          style: TextStyle(
                            color: _isTappedRed
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
              alignment: const Alignment(0, 0),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 1.0, // Adjust the width as desired
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _isTappedBlue = !_isTappedBlue;
                    });
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: CircleAvatar(
                      radius: 130.0,
                      backgroundColor: _isTappedBlue
                          ? const Color.fromARGB(131, 68, 137, 255)
                          : Colors.transparent,
                      // Customize the word inside the circle
                      child: Align(
                        alignment: const Alignment(0, -0.3),
                        child: Text(
                          'FRONTEND DEVELOPMENT',
                          style: TextStyle(
                              color: _isTappedBlue
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
