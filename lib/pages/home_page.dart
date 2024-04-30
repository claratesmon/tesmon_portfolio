import 'package:flutter/material.dart';

import 'package:tesmon_portfolio/widgets/buttons/buttons_main.dart';
import 'package:tesmon_portfolio/widgets/circles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;

  /*  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  } */

  /* void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 400),
      );
    }
  } */

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        _onScroll();
      });
    super.initState();
  }

  double _scrollOffset = 0.0;
  double _previousOffset = 0.0;

  void _onScroll() {
    setState(() {
      if (_scrollController.offset < _previousOffset) {
        // Scrolling up
        _scrollOffset =
            _scrollOffset + (_previousOffset - _scrollController.offset);
      } else if (_scrollController.offset > _previousOffset) {
        // Scrolling down
        _scrollOffset =
            _scrollOffset - (_scrollController.offset - _previousOffset);
      }
      _previousOffset = _scrollController.offset;
    });
  }

  double speedName = 0.3;
  double speedCircles = 0.36;
  double speedGreet = 0.3;
  double layerSpeed4 = 0.35;
  double layerSpeed5 = 0.31;
  double layerSpeed6 = 0.27;

  double sigmoid(double x) {
  return 1 / (1 + exp(x/1000));
}
double slowDecrease(double x) {
  return 1 - sigmoid(x / 1000); // Adjust the denominator to control the rate of decrease
}

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double layoutHeight = screenHeight * 3.5;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(15.0),
        /* decoration: BoxDecoration(), */
        child: Stack(
          children: [
            Positioned(
              top: 200 + (speedGreet * _scrollOffset),
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'HI',
                    style: TextStyle(
                      fontFamily: "Mono",
                      fontWeight: FontWeight.w700,
                      fontSize: 60.0,
                      height: 1.0,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'I',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.robotoMono(
                          fontWeight: FontWeight.w700,
                          fontSize: 60.0,
                          height: 1.0,
                        ),
                      ),
                      Text(
                        'M',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.robotoMono(
                          fontWeight: FontWeight.w700,
                          fontSize: 60.0,
                          height: 1.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 200 +( speedName * _scrollOffset),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'CLARA',
                    style: GoogleFonts.robotoMono(
                      fontWeight: FontWeight.w600,
                      fontSize: 60.0,
                      height: 1.0,
                    ),
                  ),
                  Text(
                    'TESMON',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.robotoMono(
                      fontWeight: FontWeight.w600,
                      fontSize: 60.0,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ),
            /* Positioned(
              top: screenHeight + (layerSpeed1 * _scrollOffset * -1),
              right: 0,
              left: 0,
              height: screenHeight,
              child: Container(
                color: const Color.fromARGB(255, 14, 153, 200),
              ),
            ), */

            Positioned.fill(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: SizedBox(height: layoutHeight),
              ),
            ),
            
            
            Positioned(
                height: 50,
                width: screenWidth -30 ,
                bottom: -370 - layerSpeed6 * _scrollOffset,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ContactButton(),
                )),
                Positioned(
                height: 50,
                width: screenWidth -30,
                bottom: -350 - layerSpeed5 * _scrollOffset,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ProjectsButton(),
                )),
                Positioned(
                height: 50,
                width: screenWidth -30,
                bottom: -330 - layerSpeed4 * _scrollOffset,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AboutButton(),
                )),
            Positioned(
              top: max(
                  speedCircles * _scrollOffset + (screenHeight / 2 - 260), 0),
              right: screenWidth / 2 - 200,
              /* bottom: layerSpeed2 * _scrollOffset, */
              child: Transform.scale(
                scale: 1 / (sigmoid(_scrollOffset)*2),
                child: const CirclesWidget()),
            ),
          ],
        ),
      ),
    );
  }
}
