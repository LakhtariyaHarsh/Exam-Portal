import 'package:exam_portal/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../details_page.dart';

class latestjobPage extends StatefulWidget {
  latestjobPage({super.key});

  @override
  State<latestjobPage> createState() => _latestjobPageState();
}

class _latestjobPageState extends State<latestjobPage> {
  final ApiService _apiService = ApiService();
  List<String> examList = []; // Stores fetched exams
  bool isLoading = true;
  bool isLoadingMore = false;
  int page = 1;  // Current page
  int limit = 1; // Exams per page
  int totalPages = 3; // Total pages from API
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    fetchExams();
    _scrollController.addListener(_scrollListener);
  }

  // Fetch Exams with Pagination
  Future<void> fetchExams({bool isLoadMore = false}) async {
    if (isLoadMore && (isLoadingMore || page > totalPages)) return;

    try {
      if (isLoadMore) {
        setState(() => isLoadingMore = true);
      } else {
        setState(() => isLoading = true);
      }

      Map<String, dynamic> data = await _apiService.getExams(page, limit);

      setState(() {
        examList.addAll(data["exams"]); // Append new exams
        totalPages = data["totalPages"]; // Total pages from API
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
    print('Inside the Scroll Listener');
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200 && !isLoadingMore) {
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
      body: Padding(
        padding: EdgeInsets.only(
            top: screenHeight * 0.02, bottom: screenHeight * 0.02),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 900,
                  color: const Color(0xffaa183d),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.02, bottom: screenHeight * 0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "SARKARI RESULT",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: FontSize * 2),
                        ),
                        Text("WWW.SARKARIRESULT.COM",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: FontSize))
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 900,
                  color: Colors.black,
                  child: const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NavButton(
                          label: "Home",
                          path: "/",
                        ),
                        NavButton(
                          label: "Latest Jobs",
                          path: "/latestjob",
                        ),
                        NavButton(label: "Results", path: "/result"),
                        NavButton(label: "Admit Card", path: "/admitcard"),
                        NavButton(label: "Answer Key", path: "/answerkey"),
                        NavButton(label: "Syllabus", path: "/syllabus"),
                        NavButton(label: "Search", path: "/search"),
                        NavButton(label: "Contact Us", path: "/contactus")
                      ],
                    ),
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
                                    "Latest Jobs 2024",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: FontSize * 1.5,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              isLoading
                                  ? Center(child: CircularProgressIndicator())
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: examList.length +
                                          1, // Add extra for loader
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        if (index == examList.length) {
                                          return isLoadingMore
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                      child:
                                                          CircularProgressIndicator()),
                                                )
                                              : SizedBox();
                                        }
                                        return Column(
                                          children: [
                                            InkWell(
                                              onTap: () => {
                                                    context.go('/details')
                                                  },
                                              child: ListTile(
                                                leading: Icon(Icons.circle,
                                                    size: FontSize * 0.6),
                                                title: Text(examList[index],
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 1.1)),
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    ),
                            ],
                          )),
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
