import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesmon_portfolio/widgets/drawer_menu.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          
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
                child:  const Hero(
                  tag: "ContactPage",
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 30),
                     Icon(
                        Icons.radio_button_unchecked,
                        color: Colors.yellow,
                        size: 12.0,
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "CONTACT",
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
        
            const ContactInfo(), // This is where we add the AboutInfo widget
          ],
        ),
      ),
    );
  }
}

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo>
    with TickerProviderStateMixin {
  bool _isHovering1 = false;
  bool _isHovering2 = false;
  final Uri url =
      Uri.parse('https://www.linkedin.com/in/clara-tesmon-56a31087/');

  _launchMailto(String email) async {
    final url = Uri.parse('mailto:$email');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                child: GestureDetector(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    height: 50.0,
                    child: Container(
                      height: 40,
                      width: 300,
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
                            "LinkedIn",
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
            ),
            const SizedBox(height: 50.0),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              onHover: (event) {
                setState(() {
                  _isHovering2 = true;
                });
              },
              onExit: (event) {
                setState(() {
                  _isHovering2 = false;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 50.0,
                child: GestureDetector(
                  onTap: () => _launchMailto('claratesmon@gmail.com'),
                  child: Container(
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
                    height: 40,
                    width: 300,
                    child: MouseRegion(
                      onHover: (event) {
                        setState(() {
                          _isHovering2 = true;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          _isHovering2 = false;
                        });
                      },
                      child: Center(
                        child: Text(
                          "claratesmon@gmail.com",
                          style: GoogleFonts.robotoMono(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: _isHovering2
                                ? const Color.fromARGB(255, 202, 51, 41)
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
    );
  }
}
