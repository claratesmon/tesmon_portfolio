import 'package:flutter/material.dart';
import 'package:tesmon_portfolio/widgets/buttons/buttons_main.dart';
import 'package:tesmon_portfolio/widgets/circles.dart';


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
                    child: const Padding(
                      padding:  EdgeInsets.all(5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
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
                          CirclesWidget(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'CLARA',
                                style: TextStyle(
                                  fontFamily: "Mono",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 50.0,
                                  height: 1.0,
                                ),
                              ),
                              Text(
                                'TESMON',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontFamily: "Mono",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 50.0,
                                  height: 1.0,
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
            // Display one over another for smaller screens
            return Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                color: const Color.fromARGB(255, 255, 255, 255),
                    height: double.infinity,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'HI',
                              style: TextStyle(
                                fontFamily: "Mono",
                                fontWeight: FontWeight.w700,
                                fontSize: 60.0,
                                height: 1.0,
                              ),
                            ),
                            Text(
                              'IM',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: "Mono",
                                fontWeight: FontWeight.w700,
                                fontSize: 60.0,
                                height: 1.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40.0, width: 50.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'CLARA',
                              style: TextStyle(
                                fontFamily: "Mono",
                                fontWeight: FontWeight.w600,
                                fontSize: 60.0,
                                height: 1.0,
                              ),
                            ),
                            Text(
                              'TESMON',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: "Mono",
                                fontWeight: FontWeight.w600,
                                fontSize: 60.0,
                                height: 1.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              // Add your decoration properties here
                              ),
                          child: TextButton(
                            child: const Text("VISUAL DESIGN"),
                            onPressed: () {
                              // Handle button press
                            },
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              // Add your decoration properties here
                              ),
                          child: TextButton(
                            child: const Text("FRONTEND DEVELOPMENT"),
                            onPressed: () {
                              // Handle button press
                            },
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              // Add your decoration properties here
                              ),
                          child: TextButton(
                            child: const Text("UX/UI"),
                            onPressed: () {
                              // Handle button press
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
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
