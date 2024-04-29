import 'package:flutter/material.dart';
import 'package:tesmon_portfolio/pages/home_page_mobile.dart';
import 'package:tesmon_portfolio/widgets/buttons/buttons_main.dart';
import 'package:tesmon_portfolio/widgets/circles.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 750) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    height: double.maxFinite,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'HI',
                                style: TextStyle(
                                  fontFamily: "Mono",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 50.0,
                                  height: 1.0,
                                ),
                              ),
                              Text(
                                'IM',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: "Mono",
                                  fontWeight: FontWeight.w700,
                                  fontSize: 50.0,
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                          /* SizedBox(height: 40.0, width: 50.0), */
                          const CirclesWidget(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'CLARA',
                                textAlign: TextAlign.left,
                                style: GoogleFonts.robotoMono(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                'TESMON',
                                textAlign: TextAlign.right,
                                style: GoogleFonts.robotoMono(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(
                  width: 1.0,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AboutButton(),
                          ProjectsButton(),
                          ContactButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const HomePageMobile();
          }
        },
      ),
    );
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
  }
}
