import 'package:flutter/material.dart';
import 'package:tesmon_portfolio/widgets/buttons/buttons_main.dart';
import 'package:tesmon_portfolio/widgets/circles.dart';
import 'package:google_fonts/google_fonts.dart';

/* import 'package:material_design_icons_flutter/material_design_icons_flutter.dart'; */

class HomePageMobile extends StatefulWidget {
  const HomePageMobile({super.key});

  @override
  State<HomePageMobile> createState() => _HomePageMobileState();
}

class _HomePageMobileState extends State<HomePageMobile> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 400),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: screenHeight,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
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
                          IconButton(
                            icon: const Icon(Icons.arrow_downward_sharp),
                            onPressed: _scrollToBottom,
                            style: ButtonStyle(
                              alignment: Alignment.topCenter,
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return const Color.fromARGB(
                                        0, 75, 198, 255);
                                  }
                                  return null;
                                  // Use the component's default.
                                },
                              ),
                              foregroundColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered)) {
                                    return Colors
                                        .blue; // Change the overlay color when hovered
                                  }
                                  return null; // Use the component's default.
                                },
                              ),
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
                  const CirclesWidget(),
                  const SizedBox(height: 40.0, width: 50.0),
                   Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Column(
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
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: VerticalDivider(
              width: 2.0,
            ),
          ),
          Container(
            width: double.infinity,
            height: screenHeight,
            color: const Color.fromARGB(255, 255, 255, 255),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_upward_sharp),
                    onPressed: _scrollToTop,
                    style: ButtonStyle(
                      alignment: Alignment.topCenter,
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return const Color.fromARGB(0, 75, 198, 255);
                          }
                          return null;
                          // Use the component's default.
                        },
                      ),
                      foregroundColor:
                          MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Colors
                                .blue; // Change the overlay color when hovered
                          }
                          return null; // Use the component's default.
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 600,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AboutButton(),
                        ProjectsButton(),
                        ContactButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}    
    /*     child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          //MAIN
          Container(
              height: 400, width: double.maxFinite, color: Colors.blueGrey
              ),
          //PROJECTS
          Container(
              height: 400, width: double.maxFinite
              ),
          //CONTACT
          Container(
              height: 400, width: double.maxFinite, color: Colors.blueGrey
              ),
          //FOOTER
          Container(
              height: 400, width: double.maxFinite
              ),
        ],
      ),
    ); */

