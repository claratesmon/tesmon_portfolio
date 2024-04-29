import 'package:flutter/material.dart';
import 'package:tesmon_portfolio/model/projects_data.dart';
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
      backgroundColor: Colors.white,
      body: Column(
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
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 30.0,
                decoration: _isHovering
                    ? BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(158, 189, 189, 189),
                              offset: Offset(4, 4),
                              blurRadius: 10.0,
                              spreadRadius: 2.0),
                          BoxShadow(
                              color: Color.fromARGB(255, 247, 247, 247),
                              offset: Offset(-3, -3),
                              blurRadius: 10.0,
                              spreadRadius: 2.0),
                        ],
                      )
                    : BoxDecoration(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.circular(10),
                      ),
                child: Hero(
                  tag: "ProjectsPage",
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.transparent;
                          }
                          return const Color.fromARGB(0, 131, 92, 92);
                        },
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const HomePage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
                            const end = Offset.zero;
                            const curve = Curves.ease;
                            final tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            final offsetAnimation = animation.drive(tween);

                            return SlideTransition(
                              position: offsetAnimation,
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                        ),
                      );
                    },
                    child: MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          _isHovering = true;
                        });
                      },
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          const Icon(Icons.radio_button_unchecked,
                              color: Colors.blue, size: 14.0),
                          Text(
                            "HOME",
                            style: GoogleFonts.robotoMono(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: const Color.fromARGB(242, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Projects(),
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
                  right:0,
                  top: 0,
                  bottom:0,
                  child: SizedBox(
                    height: 400,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        "PROJECTS",
                        style: GoogleFonts.dmSans(
                          color: Colors.white,
                          fontSize: 160,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 25.0,
                          shadows: <Shadow>[
                            const BoxShadow(
                              color: Color.fromARGB(255, 198, 198, 198),
                              offset: Offset(1.0, 1.0),
                              blurRadius: 1.0,
                            ),
                            const BoxShadow(
                              color: Color.fromARGB(255, 215, 215, 215),
                              offset: Offset(-1.0, -1.0),
                              blurRadius: 1.0,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right:0,
                  top: 0,
                  bottom:0,
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: 700),
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
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
                              MaterialPageRoute(
                                builder: (context) => ProjectDetailsPage(
                                  project: projects[index],
                                ),
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
