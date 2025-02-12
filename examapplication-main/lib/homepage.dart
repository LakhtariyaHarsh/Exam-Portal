import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../view_models/exam_view_model.dart';

class MyPage extends StatefulWidget {
  MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  var admissionData = [
    "UP CT Nursery, NTT, DPEd Admission Online Form 2024",
    "NTA JEEMAIN Session I Correction / Edit Form 2025",
    "NTA NIFT Admissions Online Form 2025",
    "NTA CMAT 2025 Online Form",
    "NVS Class 9th Admissions Online Form 2025",
    "NTA SWAYAM Online Form 2024",
    "GATE 2025 Online Form",
    "Bihar 4 Year BEd Admissions Online Form 2024",
    "IIT JAM 2025 Online Form",
  ];

  final List<Color> buttonColors = [
    Colors.lightGreen,
    Colors.indigo,
    Colors.orange[800]!,
    Color(0xffaa183d),
    Colors.deepOrange,
    Colors.green[700]!,
    Color(0xffff36ff),
    Colors.blue,
    Colors.redAccent,
  ];


  @override
  Widget build(BuildContext context) {
    final examViewModel = Provider.of<ExamViewModel>(context);
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    double buttonWidth = screenWidth * 0.25;
    double buttonHeight = 80;

    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    bool isDesktop = screenWidth >= 1024;

    double FontSize;
    if (isMobile) {
      FontSize = 14;
    } else if (isTablet) {
      FontSize = 16;
    } else {
      FontSize = 18;
    }

    return Scaffold(
      appBar: screenWidth < 600
          ? AppBar(
              backgroundColor: const Color(0xffaa183d),
              title: Text(
                "EXAM PORTAL",
                style: TextStyle(fontSize: FontSize * 1.1, color: Colors.white),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: screenWidth < 600
          ? Drawer(
              child: Container(
                color: const Color(0xffe3e4e6),
                child: ListView(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.25,
                      child: DrawerHeader(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 244, 245, 246),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  AssetImage("assets/logo_drawer.icon.png"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("SARKARI RESULT"),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text("Home"),
                      onTap: () {
                        context.go('/');
                      },
                    ),
                    ListTile(
                      onTap: () {
                        context.go('/latestjob');
                      },
                      title: Text("Latest Jobs"),
                    ),
                    ListTile(
                      title: Text("Results"),
                      onTap: () {
                        context.go('/result');
                      },
                    ),
                    ListTile(
                      onTap: () {
                        context.go('/admitcard');
                      },
                      title: Text("Admit Card"),
                    ),
                    ListTile(
                      onTap: () {
                        context.go('/answerkey');
                      },
                      title: Text("Answer Key"),
                    ),
                    ListTile(
                      onTap: () {
                        context.go('/syllabus');
                      },
                      title: Text("Syllabus"),
                    ),
                    ListTile(
                      onTap: () {
                        context.go('/search');
                      },
                      title: Text("Search"),
                    ),
                    ListTile(
                      onTap: () {
                        context.go('/contactus');
                      },
                      title: Text("Contact Us"),
                    ),
                  ],
                ),
              ),
            )
          : null,
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.02, bottom: screenHeight * 0.04),
            child: Center(
              child: Column(
                children: [
                  if (screenWidth >= 600)
                    Container(
                      width: screenWidth * 0.8,
                      height: screenWidth * 0.15,
                      color: const Color(0xffaa183d),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.02,
                            bottom: screenHeight * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Image(
                                  width: FontSize * 6,
                                  height: FontSize * 6,
                                  image: const AssetImage(
                                    "assets/logo_drawer.icon.png",
                                  )),
                            ),
                            SizedBox(
                              width: screenWidth * 0.05,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "SARKARI RESULT",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: FontSize * 2.3,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text("WWW.SARKARIRESULT.COM",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: FontSize * 1.1,
                                        fontWeight: FontWeight.bold))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  if (screenWidth >= 600)
                    Container(
                      width: screenWidth * 0.8,
                      height: screenWidth * 0.035,
                      color: Colors.black,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          NavButton(
                            label: "Home",
                            path: "/",
                          ),
                          Divider(),
                          NavButton(
                            label: "Latest Jobs",
                            path: "/latestjob",
                          ),
                          Divider(),
                          NavButton(label: "Results", path: "/result"),
                          Divider(),
                          NavButton(label: "Admit Card", path: "/admitcard"),
                          Divider(),
                          NavButton(label: "Answer Key", path: "/answerkey"),
                          Divider(),
                          NavButton(label: "Syllabus", path: "/syllabus"),
                          Divider(),
                          NavButton(label: "Search", path: "/search"),
                          Divider(),
                          NavButton(label: "Contact Us", path: "/contactus")
                        ],
                      ),
                    ),
                  SizedBox(
                    height: 30,
                  ),
                  examViewModel.isLoading
                      ? Center(child: CircularProgressIndicator())
                      : Container(
                          width: screenWidth * 0.8,
                          child: Center(
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: List.generate(
                                  examViewModel.buttonData.length, (index) {
                                return Container(
                                  width: buttonWidth,
                                  height: buttonHeight,
                                  decoration: BoxDecoration(
                                    color: buttonColors[
                                        index % buttonColors.length],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: TextButton(
                                      onPressed: () {
                                        context.go('/details/${Uri.encodeComponent(examViewModel.buttonData[index]['id']!)}');
                                      },
                                      child: Text(
                                        examViewModel.buttonData[index]['name']!,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                  Container(
                    width: screenWidth * 0.8,
                    child: Padding(
                      padding: EdgeInsets.only(top: screenWidth * 0.02),
                      child: Center(
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 10,
                          children: [
                            ExamSection(
                                title: "Result",
                                exams: examViewModel.resultExamList,
                                path: '/result'),
                            ExamSection(
                                title: "Admit Card",
                                exams: examViewModel.admitCardExamList,
                                path: '/admitcard'),
                            ExamSection(
                                title: "Latest Jobs",
                                exams: examViewModel.examList,
                                path: '/latestjob'),
                            ExamSection(
                                title: "Answer Key",
                                exams: examViewModel.answerKeyExamList,
                                path: '/answerkey'),
                            ExamSection(
                                title: "Syllabus",
                                exams: examViewModel.syllabusExamList,
                                path: '/syllabus'),
                            ExamSection(
                                title: "Admission",
                                exams: admissionData.map((name) => {"name": name, "id": ""}).toList(),
                                path: '/admission'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

class ExamSection extends StatelessWidget {
  final String title;
  final List<Map<String, String>> exams;
  final String path;

  ExamSection({required this.title, required this.exams, required this.path});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: 300,
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        children: [
          Container(
            height: screenHeight * 0.06,
            color: Color(0xffaa183d),
            child: Center(
              child: Text(title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: exams.length,
            itemBuilder: (context, index) {
              String examId = exams[index]["id"] ?? "";
              return ListTile(
                leading: Icon(Icons.circle, size: 10),
                title: Text(exams[index]["name"]!, style: TextStyle(fontSize: 14)),
                onTap: () {
                  if (examId.isNotEmpty) {
                    context.go('/details/${Uri.encodeComponent(examId)}');
                  } else {
                    print("Invalid exam ID");
                  }
                },
              );
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {
                context.go(path);
              },
              child: Text("View More",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}

class NavButton extends StatefulWidget {
  final String label;
  final String path;

  const NavButton({super.key, required this.label, required this.path});

  @override
  State<NavButton> createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    bool isDesktop = screenWidth >= 1024;

    double FontSize;
    if (isMobile) {
      FontSize = 12;
    } else if (isTablet) {
      FontSize = 14;
    } else {
      FontSize = 16;
    }
    return TextButton(
      onPressed: () {
        context.go(widget.path);
      },
      child: Text(
        widget.label,
        style: TextStyle(
            fontSize: FontSize * 0.75,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Divider extends StatelessWidget {
  const Divider({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: 1,
      height: screenWidth * 0.035,
      color: Colors.white,
    );
  }
}
