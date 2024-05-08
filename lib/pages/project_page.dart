import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tesmon_portfolio/model/projects_data.dart';
import 'package:tesmon_portfolio/widgets/drawer_menu.dart';
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
bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    url = Uri.parse(widget.project.siteUrl);
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.grey[300],
        surfaceTintColor: Colors.grey[300],
        centerTitle: true,
        leading: const BackButton(
          color: Colors.grey,
        ),
        title: Builder(
            builder: (context) => Container(
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
                    visualDensity: VisualDensity.standard),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Icon(
                  Icons.menu_sharp,
                  color: Colors.white,
                  size: 16.0,
                ),
              ),
            )),
      ),
      drawer: const DrawerMenu(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: widget.project.name.toUpperCase(),
                child: Image.asset(widget.project.imageUrl),
              ),
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
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Text(
                        widget.project.description,
                        style: GoogleFonts.dmSans(fontSize: 14),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            height: 150,
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
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Text(widget.project.role,
                                style: GoogleFonts.dmSans(fontSize: 14),
                                textAlign: TextAlign.justify),
                          ),
                        ),
                        const SizedBox(height: 10, width: 20),
                        Expanded(
                          child: Container(
                            height: 150,
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
                            margin: const EdgeInsets.only(bottom: 10.0),
                            child: Text(widget.project.tools,
                                style: GoogleFonts.dmSans(fontSize: 14,
                                ),
                                textAlign: TextAlign.justify),
                          ),
                        ),
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
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      width: 200,
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
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
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
          ).animate().fadeIn( duration: 500.ms),
        ),
      ),
    );
  }
}
