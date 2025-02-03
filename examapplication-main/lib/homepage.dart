import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_service.dart';
import 'package:go_router/go_router.dart';

class MyPage extends StatefulWidget {
  MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  var resultData = [
    "Army School AWES TGT PGT PRT Result 2024",
    "IBPS SO 14th Pre Exam Result with Score Card 2024",
    "ONGC Apprentice Merit List 2024",
    "UPSC Civil Services IAS Main Result 2024",
    "CLAT 2025 Result with Score Card",
    "Bihar Board Class 10th, 12th Time Table 2025",
    "SSC Exam Calendar 2025-2026",
    "India Post GDS 5th Merit List / Result",
    "SSC CGL 2024 Tier I Result",
    "RSMSSB Hostel Superintendent Merit List 2024",
    "IB ACIO Technical 2023 Final Result",
    "CSIR CASE SO / ASO 2023 Result / Merit List",
    "MPESB Sub Engineer & Other Post Result 2024",
  ];

  var latestJobsData = [
    "UPSC CDS I 2025 Online Form",
    "UPSC NDA I 2025 Online Form",
    "Rajasthan REET 2024 Online Form",
    "KGMU Non Teaching Various Post Online Form 2024",
    "RPSC Senior Teacher Gr II TGT Online Form 2024",
    "NTA UGC NET December 2024 Online Form Extended",
    "RCFL Graduate, Technician, Trade Apprentice Online Form 2024",
    "Haryana HTET 2024 Fee Payment Date Extended",
    "NTA CSIR UGC NET December 2024 Online Form",
    "IIT Mandi Junior Assistant Online Form 2024",
    "SSC Junior Engineer JE Option Form 2024",
  ];

  var admitCardData = [
    "IRDAI Assistant Manager Phase II Admit Card 2024",
    "UPPSC Pre 2024 Admit Card",
    "Railway RRB CEN 02/2024 Technician Exam City Details",
    "IDBI Bank JAM, AAO Admit Card 2024",
    "Allahabad University MTS Re Exam Admit Card 2024",
    "Karnataka Bank Customer Service Associates CSA Admit Card 2024",
    "MPPSC SET Admit Card 2024",
    "Allahabad High Court Group C, Group D Various Post Exam Date 2024",
    "UPSSSC X Ray Technician 2023 Exam City Details",
    "IBPS SO 14th Phase II Admit Card 2024",
    "Railway RRB Junior Engineer JE Exam City Details 2024",
  ];

  var answerKeyData = [
    "RSMSSB CET Inter Level Answer Key 2024",
    "Railway RRB ALP Answer Key 2024",
    "MPESB Primary Teacher Eligibility Test TET Answer Key 2024",
    "SSC MTS 2024 Answer Key",
    "SSC CHSL 2024 Tier II Answer Key"
  ];

  var syllabusData = [
    "NTA JEEMAIN Syllabus 2025",
    "UPSSSC Homeopathic Pharmacist Syllabus 2024",
    "UPSSSC JE Civil Syllabus 2024",
    "UPSSSC Assistant Store Keeper Syllabus 2024",
    "UPSSSC BCG Technician Syllabus 2024",
  ];

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

  final ApiService _apiService = ApiService();
  List<String> examList = []; // Stores fetched exams
  bool isLoading = true;
  bool isLoadingMore = false;
  int page = 1;  // Current page
  int limit = 10; // Exams per page
  int totalPages = 1; // Total pages from API

  @override
  void initState() {
    super.initState();
    fetchExams();
  }

  // Fetch Exams with Pagination
  Future<void> fetchExams() async {
    try {
      setState(() => isLoading = true);
      Map<String, dynamic> data = await _apiService.getExams(page, limit);

      setState(() {
        examList.addAll(data["exams"]); // Append new exams
        totalPages = data["totalPages"]; // Total pages from API
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      print("Error fetching exams: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

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
                "SARKARI RESULT",
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
                        child: Container(
                          child: const Column(children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage:
                                  AssetImage("assets/logo_drawer.icon.png"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text("SARKARI RESULT")],
                            )
                          ]),
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
                  Container(
                    width: screenWidth * 0.8,
                    child: Padding(
                      padding: EdgeInsets.only(top: screenWidth * 0.02),
                      child: Center(
                        child: Wrap(
                          spacing: 5,
                          runSpacing: 10,
                          children: [
                            Container(
                              width: screenWidth * 0.25,
                              height: 80,
                              color: Colors.lightGreen,
                              child: Center(
                                  child: TextButton(
                                      onPressed: () {
                                        context.go('/details');
                                      },
                                      child: Text(
                                        "SSC MTS 2024 Answer Key",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: FontSize * 1.2,
                                            fontWeight: FontWeight.bold),
                                      ))),
                            ),
                            Container(
                              width: screenWidth * 0.25,
                              height: 80,
                              color: Colors.indigo,
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    context.go('/details');
                                  },
                                  child: Text(
                                    "Railway ALP Answer Key",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: FontSize * 1.2,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: screenWidth * 0.25,
                              height: 80,
                              color: Colors.orange[800],
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    context.go('/details');
                                  },
                                  child: Text(
                                    "UP Aganwadi 2024 Apply",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: FontSize * 1.2,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: screenWidth * 0.25,
                              height: 80,
                              color: const Color(0xffaa183d),
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    context.go('/details');
                                  },
                                  child: Text(
                                    "UP Scholarship Apply",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: FontSize * 1.2,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: screenWidth * 0.25,
                              height: 80,
                              color: Colors.deepOrange,
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    context.go('/details');
                                  },
                                  child: Text(
                                    "CTET Dec 2024 Admit Card",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: FontSize * 1.2,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: screenWidth * 0.25,
                              height: 80,
                              color: Colors.green[700],
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    context.go('/details');
                                  },
                                  child: Text(
                                    "RRB Technician Exam ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: FontSize * 1.2,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: screenWidth * 0.25,
                              height: 80,
                              color: const Color(0xffff36ff),
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    context.go('/details');
                                  },
                                  child: Text(
                                    "UPPSC Pre 2024 Admit Card",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: FontSize * 1.2,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: screenWidth * 0.25,
                              height: 80,
                              color: Colors.blue,
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    context.go('/details');
                                  },
                                  child: Text(
                                    "RPF Sub Inspector Admit Card",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: FontSize * 1.2,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
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
                            Container(
                              width: 300,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(),
                                      left: BorderSide(),
                                      top: BorderSide(),
                                      bottom: BorderSide())),
                              child: Column(
                                children: [
                                  Container(
                                    height: screenHeight * 0.06,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffaa183d),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Result",
                                      style: TextStyle(
                                          fontSize: FontSize * 1.2,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                                  ),
                                  ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: resultData.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            ListTile(
                                              leading: Icon(
                                                Icons.circle,
                                                size: FontSize * 0.6,
                                              ),
                                              title: Text(
                                                resultData[index],
                                                style: TextStyle(
                                                    fontSize: FontSize * 0.9),
                                              ),
                                            )
                                          ],
                                        );
                                      }),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                        onPressed: () {
                                          context.go('/result');
                                          // GoRouter.of(context).pushNamed(AppRouteConstant.resultRouteName);
                                        },
                                        child: Text(
                                          "View More",
                                          style: TextStyle(
                                              fontSize: FontSize,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(),
                                      left: BorderSide(),
                                      top: BorderSide(),
                                      bottom: BorderSide())),
                              child: Column(
                                children: [
                                  Container(
                                    height: screenHeight * 0.06,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffaa183d),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Admit Card",
                                      style: TextStyle(
                                          fontSize: FontSize * 1.2,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                                  ),
                                  ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: admitCardData.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            ListTile(
                                              leading: Icon(
                                                Icons.circle,
                                                size: FontSize * 0.6,
                                              ),
                                              title: Text(
                                                admitCardData[index],
                                                style: TextStyle(
                                                    fontSize: FontSize * 0.9),
                                              ),
                                            )
                                          ],
                                        );
                                      }),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                        onPressed: () {
                                          context.go('/admitcard');
                                        },
                                        child: Text(
                                          "View More",
                                          style: TextStyle(
                                              fontSize: FontSize,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(),
                                      left: BorderSide(),
                                      top: BorderSide(),
                                      bottom: BorderSide())),
                              child: Column(
                                children: [
                                  Container(
                                    height: screenHeight * 0.06,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffaa183d),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Latest Jobs",
                                      style: TextStyle(
                                          fontSize: FontSize * 1.2,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                                  ),
                                  isLoading
                                      ? Center(
                                          child:
                                              CircularProgressIndicator()) // Show loader while fetching
                                      : ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: examList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return Column(
                                              children: [
                                                ListTile(
                                                  leading: Icon(Icons.circle,
                                                      size: FontSize * 0.6),
                                                  title: Text(examList[index],
                                                      style: TextStyle(
                                                          fontSize:
                                                              FontSize * 0.9)),
                                                )
                                              ],
                                            );
                                          },
                                        ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                        onPressed: () {
                                          context.go('/latestjob');
                                        },
                                        child: Text(
                                          "View More",
                                          style: TextStyle(
                                              fontSize: FontSize,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(),
                                      left: BorderSide(),
                                      top: BorderSide(),
                                      bottom: BorderSide())),
                              child: Column(
                                children: [
                                  Container(
                                    height: screenHeight * 0.06,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffaa183d),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Answer Key",
                                      style: TextStyle(
                                          fontSize: FontSize * 1.2,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                                  ),
                                  ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: answerKeyData.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            ListTile(
                                              leading: Icon(
                                                Icons.circle,
                                                size: FontSize * 0.6,
                                              ),
                                              title: Text(
                                                answerKeyData[index],
                                                style: TextStyle(
                                                    fontSize: FontSize * 0.9),
                                              ),
                                            )
                                          ],
                                        );
                                      }),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                        onPressed: () {
                                          context.go('/answerkey');
                                        },
                                        child: Text(
                                          "View More",
                                          style: TextStyle(
                                              fontSize: FontSize,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(),
                                      left: BorderSide(),
                                      top: BorderSide(),
                                      bottom: BorderSide())),
                              child: Column(
                                children: [
                                  Container(
                                    height: screenHeight * 0.06,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffaa183d),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Syllabus",
                                      style: TextStyle(
                                          fontSize: FontSize * 1.2,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                                  ),
                                  ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: syllabusData.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            ListTile(
                                              leading: Icon(
                                                Icons.circle,
                                                size: FontSize * 0.6,
                                              ),
                                              title: Text(
                                                syllabusData[index],
                                                style: TextStyle(
                                                    fontSize: FontSize * 0.9),
                                              ),
                                            )
                                          ],
                                        );
                                      }),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                        onPressed: () {
                                          context.go('/syllabus');
                                        },
                                        child: Text(
                                          "View More",
                                          style: TextStyle(
                                              fontSize: FontSize,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 300,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(),
                                      left: BorderSide(),
                                      top: BorderSide(),
                                      bottom: BorderSide())),
                              child: Column(
                                children: [
                                  Container(
                                    height: screenHeight * 0.06,
                                    decoration: const BoxDecoration(
                                      color: Color(0xffaa183d),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "Admission",
                                      style: TextStyle(
                                          fontSize: FontSize * 1.2,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                                  ),
                                  ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: admissionData.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Column(
                                          children: [
                                            ListTile(
                                              leading: Icon(
                                                Icons.circle,
                                                size: FontSize * 0.6,
                                              ),
                                              title: Text(
                                                admissionData[index],
                                                style: TextStyle(
                                                    fontSize: FontSize * 0.9),
                                              ),
                                            )
                                          ],
                                        );
                                      }),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                        onPressed: () {
                                          context.go('/admission');
                                        },
                                        child: Text(
                                          "View More",
                                          style: TextStyle(
                                              fontSize: FontSize,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  )
                                ],
                              ),
                            ),
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
