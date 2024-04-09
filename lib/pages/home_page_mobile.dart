import 'package:flutter/material.dart';
import 'package:tesmon_portfolio/widgets/buttons/buttons_main.dart';
import 'package:tesmon_portfolio/widgets/circles.dart';

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

    _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      curve: Curves.easeOut,
      duration: const Duration(milliseconds: 300),
    );
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
                      const Text(
                        'IM',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontFamily: "Mono",
                          fontWeight: FontWeight.w700,
                          fontSize: 60.0,
                          height: 1.0,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _scrollToBottom(),
                        child: const Text('Go to Bottom'),
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
                          const Text(
                            'CLARA',
                            style: TextStyle(
                              fontFamily: "Mono",
                              fontWeight: FontWeight.w600,
                              fontSize: 60.0,
                              height: 1.0,
                            ),
                          ),
                          const Text(
                            'TESMON',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontFamily: "Mono",
                              fontWeight: FontWeight.w600,
                              fontSize: 60.0,
                              height: 1.0,
                            ),
                          ),
                          ElevatedButton(
                        onPressed: _scrollToTop,
                        child: const Text('Go to Top'),
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
            child: const Padding(
              padding: EdgeInsets.all(15.0),
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

