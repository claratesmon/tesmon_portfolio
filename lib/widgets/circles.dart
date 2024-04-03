import 'package:flutter/material.dart';

class CirclesWidget extends StatelessWidget {
  const CirclesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Stack(
        children: [
          // Background container (white box)
          Container(
            alignment: Alignment.center,
            height: 100,
            /* decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: Colors.black, // Border color
                width: 2.0, // Border thickness
              ),
            ), */
          ),
          // First circle (bottom)
          Align(
            alignment: const Alignment(-0.3, 0.5),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.yellowAccent,
                  width: 1.0, // Adjust the width as desired
                ),
              ),
              child: const CircleAvatar(
                radius: 90.0,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.white,
                  // Customize the word inside the circle
                  child: Align(
                    
                    alignment: Alignment(0,0),
                    child: Text(
                      'VISUALDESIGN',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Second circle (middle)
          Align(
            alignment: const Alignment(0, -0.3),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blueAccent,
                  width: 1.0, // Adjust the width as desired
                ),
              ),
              child: const CircleAvatar(
                radius: 130.0,
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.transparent,
                  // Customize the word inside the circle
                  child: Align(
                    alignment: Alignment(0, 0),
                    child: Text(
                      'FRONTENDDEVELOPMENT',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Third circle (top)
          Align(
            alignment: const Alignment(0.3, 0.5),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.redAccent,
                  width: 1.0, // Adjust the width as desired
                ),
              ),
              child: const CircleAvatar(
                radius: 90.0,
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundColor: Colors.transparent,
                  // Customize the word inside the circle
                  child: Align(
                    alignment: Alignment(0,0),
                    child: Text(
                      'UX/UI',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
