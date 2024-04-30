import 'package:flutter/material.dart';
import 'package:tesmon_portfolio/model/projects_data.dart';
import 'package:tesmon_portfolio/pages/about_page.dart';
import 'package:tesmon_portfolio/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesmon_portfolio/pages/project_page.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Builder(
            builder: (context) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white,
                      surfaceTintColor: Colors.white,
                      shadowColor: const Color.fromARGB(119, 0, 0, 0),
                      elevation:
                          MediaQuery.of(context).size.width < 600 ? 1.8 : 1,
                      visualDensity: VisualDensity.standard),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset("images/4_hands_card_t.png", height: 30),
                )),
      ),
      drawer: const DrawerMenu(),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: MouseRegion(
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
              child: Hero(
                tag: "ProjectsPage",
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 10),
                    const Icon(
                      Icons.radio_button_unchecked,
                      color: Colors.blue,
                      size: 12.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "PROJECTS",
                        style: GoogleFonts.robotoMono(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: const Color.fromARGB(242, 0, 0, 0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const Projects(), // This is where we add the AboutInfo widget
        ],
      ),
    );
  }
}

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "",
      "",
      "",
    ];

    final projects = project.values.toList();

    bool isHovering2 = false;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: <Widget>[
                
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 150,
                  
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 800),
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: VerticalCardPager(
                          titles: titles,
                          images: projects
                              .map((e) => Hero(
                                    tag: e.name.toUpperCase(),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.asset(
                                        e.imageUrl,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          textStyle: GoogleFonts.robotoMono(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            shadows: <Shadow>[
                              const Shadow(
                                offset: Offset(2.0, 2.0),
                                blurRadius: 2.0,
                                color: Color.fromARGB(255, 158, 158, 158),
                              ),
                              const Shadow(
                                offset: Offset(-1.0, -1.0),
                                blurRadius: 0.0,
                                color: Color.fromARGB(107, 184, 184, 184),
                              ),
                            ],
                          ),
                          onPageChanged: (page) {},
                          onSelectedItem: (index) {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        ProjectDetailsPage(
                                  project: projects[index],
                                ),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                   const begin = Offset(0.0, 1.0);
                                  const end = Offset.zero;
                                  const curve = Curves.ease;

                                  final tween = Tween(begin: begin, end: end)
                                      .chain(CurveTween(curve: curve));

                                  return SlideTransition(
                                    position: animation.drive(tween),
                                    child: child,
                                  );
                                },
                                transitionDuration: const Duration(
                                    seconds:
                                        1), // Adjust this value to slow down or speed up the animation
                              ),
                            );
                          },
                          initialPage: 1,
                          align: ALIGN.CENTER,
                          physics: const ClampingScrollPhysics()),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
