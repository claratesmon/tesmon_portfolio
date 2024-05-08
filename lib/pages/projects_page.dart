import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesmon_portfolio/model/projects_data.dart';
import 'package:tesmon_portfolio/pages/project_page.dart';
import 'package:tesmon_portfolio/widgets/drawer_menu.dart';
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
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.grey[300],
        surfaceTintColor: Colors.grey[300],

        title: Builder(
            builder: (context) => Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 35),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(3, 3),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                        const BoxShadow(
                            color: Color.fromARGB(255, 255, 255, 255),
                            offset: Offset(-2, -2),
                            blurRadius: 15.0,
                            spreadRadius: 1.0),
                      ],
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          foregroundColor: Colors.grey[300],
                          surfaceTintColor: Colors.grey[300],
                          shadowColor: const Color.fromARGB(0, 44, 44, 44),
                          elevation:
                              0 /* MediaQuery.of(context).size.width < 600 ? 1.8 : 1 */,
                          ),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: const Icon(
                        Icons.menu_sharp,
                        color: Colors.white,
                        size: 16.0,
                      ),
                    ),
                  ),
                )),
      ),
      drawer: const DrawerMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
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
              child:   Hero(
                tag: "ProjectsPage",
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 30),
                  const Icon(
                      Icons.radio_button_unchecked,
                      color: Colors.blue,
                      size: 12.0,
                    ),
                    Container(
                       decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        
                        BoxShadow(
                            color: Color.fromARGB(102, 255, 255, 255),
                            offset: Offset(0, 3),
                            blurRadius: 30.0,
                            spreadRadius: 2.0),
                      ],
                    ),
                      padding:const EdgeInsets.all(8.0),
                      child:  const Text(
                        "PROJECTS",
                        style: TextStyle(
                        fontFamily: 'Mono',
                        letterSpacing: 2,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(242, 0, 0, 0),
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

    return Expanded (
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 50,
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 800),
                    color: Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: VerticalCardPager(
                            titles: titles,
                            images: projects
                                .map((e) => Hero(
                                  
                                      tag: e.name.toUpperCase(),
                                      child: ClipRRect(
                                        clipBehavior: Clip.antiAlias,
                                        borderRadius: BorderRadius.circular(100.0),
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
                                    const begin = Offset(0.0, -0.5);
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
                                      milliseconds: 500), // Adjust this value to slow down or speed up the animation
                                ),
                              );
                            },
                            initialPage: 0,
                            align: ALIGN.CENTER,
                            physics: const ClampingScrollPhysics()),
                      ),
                    ),
                  ),
                ),
               const Positioned(
                bottom:0,
                child: SizedBox(height:30))
              ],
            ).animate().fadeIn(duration: 300.ms, delay: 500.ms),
          ),
        ),
      ),
    );
  }
}
