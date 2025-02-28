import 'package:exam_portal/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:exam_portal/pages/result.dart';
import '../details_page.dart';

class SyllabusPage extends StatefulWidget {
  SyllabusPage({super.key});

  @override
  State<SyllabusPage> createState() => _SyllabusPageState();
}

class _SyllabusPageState extends State<SyllabusPage> {
  final ApiService _apiService = ApiService();
  List<Map<String, String>> examList = []; // Stores fetched exams
  bool isLoading = true;
  bool isLoadingMore = false;
  int page = 1; // Current page
  int limit = 25; // Exams per page
  int totalPages = 1; // Total pages from API
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchExams();
    _scrollController.addListener(_scrollListener);
  }

  // Fetch Exams with Pagination (Store ID & Name)
  Future<void> fetchExams({bool isLoadMore = false}) async {
    if (isLoadMore && (isLoadingMore || page > totalPages)) return;

    try {
      if (isLoadMore) {
        setState(() => isLoadingMore = true);
      } else {
        setState(() => isLoading = true);
      }

      Map<String, dynamic> data =
          await _apiService.getExamsBySyllabus(page, limit);

      setState(() {
        // Store exams as a list of maps (id & name)
        examList.addAll(data["exams"]
            .where((exam) => exam["_id"] != null && exam["name"] != null)
            .map<Map<String, String>>((exam) {
          return {
            "id": exam["_id"].toString(),
            "name": exam["name"].toString(),
          };
        }).toList());

        totalPages = data["totalPages"]; // Update total pages
        isLoading = false;
        isLoadingMore = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
        isLoadingMore = false;
      });
      print("Error fetching exams: $e");
    }
  }

  // Scroll Listener to Detect When User Reaches Bottom
  void _scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        !isLoadingMore) {
      if (page < totalPages) {
        page++; // Increment page
        fetchExams(isLoadMore: true);
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth < 720;
    bool isTablet = screenWidth >= 720 && screenWidth < 1024;
    bool isDesktop = screenWidth >= 1024;

    double fontSize;
    if (isMobile) {
      fontSize = 14;
    } else if (isTablet) {
      fontSize = 16;
    } else {
      fontSize = 18;
    }

    return Scaffold(
      appBar: screenWidth < 720
          ? AppBar(
              backgroundColor: const Color(0xffaa183d),
              title: Text(
                "EXAM PORTAL",
                style: TextStyle(fontSize: fontSize * 1.1, color: Colors.white),
              ),
              iconTheme: const IconThemeData(color: Colors.white),
            )
          : null,
      drawer: screenWidth < 720
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
      body: Padding(
        padding: EdgeInsets.only(
            top: screenHeight * 0.02, bottom: screenHeight * 0.02),
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: Center(
                child: Column(
                  children: [
                    if (screenWidth >= 720)
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
                                    width: fontSize * 6,
                                    height: fontSize * 6,
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
                                        fontSize: fontSize * 2.3,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("WWW.SARKARIRESULT.COM",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: fontSize * 1.1,
                                          fontWeight: FontWeight.bold))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    if (screenWidth >= 720)
                      Container(
                        width: screenWidth * 0.8,
                        height: screenWidth * 0.035,
                        color: Colors.black,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NavButton(
                              label: "Home",
                              path: "/",
                            ),
                            customDivider(),
                            NavButton(
                              label: "Latest Jobs",
                              path: "/latestjob",
                            ),
                            customDivider(),
                            NavButton(label: "Results", path: "/result"),
                            customDivider(),
                            NavButton(label: "Admit Card", path: "/admitcard"),
                            customDivider(),
                            NavButton(label: "Answer Key", path: "/answerkey"),
                            customDivider(),
                            NavButton(label: "Syllabus", path: "/syllabus"),
                            customDivider(),
                            NavButton(label: "Search", path: "/search"),
                            customDivider(),
                            NavButton(label: "Contact Us", path: "/contactus")
                          ],
                        ),
                      ),
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.05),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(minWidth: 300),
                        child: Container(
                          width: 600,
                          decoration: const BoxDecoration(
                              border: Border(
                                  right: BorderSide(),
                                  left: BorderSide(),
                                  top: BorderSide(),
                                  bottom: BorderSide())),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: screenHeight * 0.02,
                                left: screenHeight * 0.01,
                                right: screenHeight * 0.01),
                            child: Column(
                              children: [
                                Container(
                                  height: screenHeight * 0.06,
                                  color: const Color(0xffaa183d),
                                  child: Center(
                                    child: Text(
                                      "Syllabus 2024",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: fontSize * 1.5,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                isLoading
                                    ? Center(
                                        child: SpinKitFadingCircle(
                                          color: Colors
                                              .blue, // Change color as needed
                                          size: 50.0,
                                        ),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: examList.length +
                                            1, // Extra for loader
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          if (index == examList.length) {
                                            return isLoadingMore
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Center(
                                                      child:
                                                          SpinKitFadingCircle(
                                                        color: Colors
                                                            .blue, // Change color as needed
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox();
                                          }

                                          String examId = examList[index]
                                              ["id"]!; // Extract ID
                                          String examName = examList[index]
                                              ["name"]!; // Extract Name

                                          return Column(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  context.go(
                                                      '/syllabus/examname/${Uri.encodeComponent(examName)}',
                                                      extra: examId);
                                                },
                                                child: ListTile(
                                                  leading: Icon(Icons.circle,
                                                      size: fontSize * 0.6),
                                                  title: Text(examName,
                                                      style: TextStyle(
                                                          fontSize:
                                                              fontSize * 1.1)),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
