import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
/* import 'package:tesmon_portfolio/pages/home_page.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tesmon_portfolio/widgets/shapes.dart'; */
import 'package:tesmon_portfolio/model/projects_data.dart';
import 'package:tesmon_portfolio/widgets/buttons/buttons_main.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDetailsPage extends StatefulWidget {
  const ProjectDetailsPage({super.key, required this.project});
  final Project project;

  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  bool _isHovering1 = false;

  late Uri url;

  @override
  void didUpdateWidget(covariant ProjectDetailsPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.project != widget.project) {
      url = Uri.parse(widget.project.siteUrl);
    }
  }

  @override
  void initState() {
    super.initState();
    url = Uri.parse(widget.project.siteUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Builder(
            builder: (context) => ElevatedButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset("images/4_hands_card_t.png", height: 30),
                )),
      ),
      drawer: const Drawer(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              
                    AboutButton(),
                    ProjectsButton(),
                    ContactButton(),
                  ]),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Hero(
          tag: widget.project.name.toUpperCase(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(widget.project.imageUrl),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors
                                .black, // Change this to your desired color
                            width: 2.0, // Change this to your desired width
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        "OVERVIEW",
                        style: GoogleFonts.dmSans(fontSize: 20),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors
                                .black, // Change this to your desired color
                            width: 2.0, // Change this to your desired width
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        widget.project.description,
                        style: GoogleFonts.dmSans(fontSize: 14),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 100,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors
                                      .black, // Change this to your desired color
                                  width:
                                      2.0, // Change this to your desired width
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              widget.project.role,
                              style: GoogleFonts.dmSans(fontSize: 14),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10, width: 20),
                        Expanded(
                            child: Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors
                                    .black, // Change this to your desired color
                                width: 2.0, // Change this to your desired width
                              ),
                            ),
                          ),
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(widget.project.tools,
                              style: GoogleFonts.dmSans(fontSize: 14),
                              textAlign: TextAlign.start),
                        )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                onHover: (event) {
                  setState(() {
                    _isHovering1 = true;
                  });
                },
                onExit: (event) {
                  setState(() {
                    _isHovering1 = false;
                  });
                },
                child: GestureDetector(
                  onTap: () async {
                    if (await launchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 50.0,
                    decoration: _isHovering1
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
                    child: Container(
                      height: 40,
                      width: 300,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(20)),
                      child: MouseRegion(
                        onHover: (event) {
                          setState(() {
                            _isHovering1 = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            _isHovering1 = false;
                          });
                        },
                        child: Center(
                          child: Text(
                            "Visit site",
                            style: GoogleFonts.robotoMono(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: _isHovering1
                                  ? const Color.fromARGB(255, 28, 134, 221)
                                  : const Color.fromARGB(255, 0, 0, 0),
                            ),
                            textAlign: TextAlign.center,
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
      ),
    );
  }
}
