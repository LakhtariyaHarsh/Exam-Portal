import 'package:exam_portal/pages/result.dart';
import 'package:exam_portal/view_models/exam_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class jobDetails extends StatefulWidget {
  final String examId;
  const jobDetails({super.key, required this.examId, required String examName});

  @override
  State<jobDetails> createState() => _jobDetailsState();
}

class _jobDetailsState extends State<jobDetails> {
  @override
  void initState() {
    super.initState();
    // Fetch exam details when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ExamViewModel>(context, listen: false)
          .fetchExamById(widget.examId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final examViewModel = Provider.of<ExamViewModel>(context);
    Size s = MediaQuery.of(context).size;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth < 720;
    bool isTablet = screenWidth >= 720 && screenWidth < 1024;
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
      appBar: screenWidth < 720
          ? AppBar(
              backgroundColor: const Color(0xffaa183d),
              title: Text(
                "EXAM PORTAL",
                style: TextStyle(fontSize: FontSize * 1.1, color: Colors.white),
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
        child: SingleChildScrollView(
          // controller: _scrollController,
          child: Center(
            child: examViewModel.selectedExam == null
                ? SpinKitFadingCircle(
                    color: Colors.blue, // Change color as needed
                    size: 50.0,
                  )
                : examViewModel.selectedExam!.isEmpty
                    ? const Text("No Data Available",
                        style: TextStyle(fontSize: 16)) // Handle empty data
                    : Column(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                          if (screenWidth >= 720)
                            Container(
                              width: screenWidth * 0.8,
                              height: screenWidth * 0.035,
                              color: Colors.black,
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                  NavButton(
                                      label: "Admit Card", path: "/admitcard"),
                                  customDivider(),
                                  NavButton(
                                      label: "Answer Key", path: "/answerkey"),
                                  customDivider(),
                                  NavButton(
                                      label: "Syllabus", path: "/syllabus"),
                                  customDivider(),
                                  NavButton(label: "Search", path: "/search"),
                                  customDivider(),
                                  NavButton(
                                      label: "Contact Us", path: "/contactus")
                                ],
                              ),
                            ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: screenHeight * 0.02),
                            child: Container(
                              width: 600,
                              child: Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(1),
                                  1: FlexColumnWidth(4),
                                },
                                children: [
                                  TableRow(children: [
                                    Text("Name of Post: ",
                                        style: TextStyle(
                                            fontSize: FontSize,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      examViewModel.selectedExam!['name'],
                                      style: TextStyle(fontSize: FontSize),
                                    )
                                  ]),
                                  TableRow(children: [
                                    Text("Post Date /Update: ",
                                        style: TextStyle(
                                            fontSize: FontSize,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        _formatDate(examViewModel
                                            .selectedExam!['applicationBegin']),
                                        style: TextStyle(fontSize: FontSize))
                                  ]),
                                  TableRow(children: [
                                    Text("Short Information: ",
                                        style: TextStyle(
                                            fontSize: FontSize,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                        "The ${examViewModel.selectedExam!['name']} Released Notification for Recruitment Exam 2025. Those candidates who are interested in this Exam can Apply Online from ${_formatDate(examViewModel.selectedExam!['applicationBegin'])} to ${_formatDate(examViewModel.selectedExam!['lastDateToApply'])}. Read The ${examViewModel.selectedExam!['name']} Post notification for recruitment eligibility, post information, selection procedure, age limit, pay scale and all other information.",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(fontSize: FontSize))
                                  ])
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * 0.05,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(minWidth: 300),
                            child: Container(
                                width: 600,
                                decoration: const BoxDecoration(
                                    border: Border(
                                        right: BorderSide(),
                                        left: BorderSide(),
                                        top: BorderSide())),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: screenHeight * 0.01,
                                      bottom: screenHeight * 0.01),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          examViewModel.selectedExam!['name'],
                                          style: TextStyle(
                                              fontSize: FontSize * 1.2,
                                              color: Colors.green[800],
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text(
                                          "${examViewModel.selectedExam!['name']} : Short Details of Notification",
                                          style: TextStyle(
                                              fontSize: FontSize * 1.1,
                                              color: const Color(0xffff36ff),
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Center(
                                        child: Text(
                                          "WWW.SARKARIRESULT.COM",
                                          style: TextStyle(
                                              fontSize: FontSize * 1.3,
                                              color: Colors.redAccent,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(minWidth: 300),
                            child: Container(
                              width: 600,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(),
                                      left: BorderSide(),
                                      top: BorderSide())),
                              child: Row(
                                children: [
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            border:
                                                Border(right: BorderSide())),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: screenHeight * 0.01,
                                              top: screenHeight * 0.01,
                                              bottom: screenHeight * 0.01),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Text("Important Dates",
                                                    style: TextStyle(
                                                        fontSize: FontSize,
                                                        color:
                                                            Colors.green[800],
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        "• Application Begin : ",
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85)),
                                                TextSpan(
                                                    text: _formatDate(
                                                        examViewModel
                                                                .selectedExam![
                                                            'applicationBegin']),
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85))
                                              ])),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        "• Last Date for Apply Online  : ",
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85)),
                                                TextSpan(
                                                    text: _formatDate(
                                                        examViewModel
                                                                .selectedExam![
                                                            'lastDateToApply']),
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85))
                                              ])),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        "• Pay Examination Fee Last Date : ${_formatDate(examViewModel.selectedExam!['lastDateToPayExamFee'])}",
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85)),
                                              ])),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: "• Exam Date : ",
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85)),
                                                TextSpan(
                                                    text: _formatDate(
                                                        examViewModel
                                                                .selectedExam![
                                                            'examDate']),
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85))
                                              ])),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        "• Admit Card Available : ",
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85)),
                                                TextSpan(
                                                    text: _formatDate(examViewModel
                                                            .selectedExam![
                                                        'admitCardAvailable']),
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85))
                                              ]))
                                            ],
                                          ),
                                        ),
                                      )),
                                  Expanded(
                                      flex: 5,
                                      child: Container(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: screenHeight * 0.01),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Text("Application Fee",
                                                    style: TextStyle(
                                                        fontSize: FontSize,
                                                        color:
                                                            Colors.green[800],
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text:
                                                        "• General / OBC / EWS : ",
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85)),
                                                TextSpan(
                                                    text:
                                                        "  ${examViewModel.selectedExam!['generalCategoryFee'].toString()}/-",
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85))
                                              ])),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    text: "• SC / ST / PH :",
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85)),
                                                TextSpan(
                                                    text:
                                                        "  ${examViewModel.selectedExam!['scstCategoryFee'].toString()}/-",
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85))
                                              ])),
                                              Text(
                                                  "• Pay the Exam Fees Through Debit Card / Credit Card / Net Banking Mode.",
                                                  style: TextStyle(
                                                      fontSize:
                                                          FontSize * 0.85))
                                            ],
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(minWidth: 300),
                            child: Container(
                              width: 600,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(),
                                      left: BorderSide(),
                                      top: BorderSide())),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight * 0.01,
                                    left: screenHeight * 0.01,
                                    bottom: screenHeight * 0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.center,
                                      child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                              text:
                                                  "${examViewModel.selectedExam!['name']} Notification : ",
                                              style: TextStyle(
                                                  fontSize: FontSize * 1.1,
                                                  color:
                                                      const Color(0xffff36ff),
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            TextSpan(
                                              text:
                                                  "Age Limit as on ${_formatDate(examViewModel.selectedExam!['ageFrom'])}",
                                              style: TextStyle(
                                                  fontSize: FontSize * 1.1,
                                                  color: Colors.green[800],
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ])),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "• Minimum Age : ",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85)),
                                      TextSpan(
                                          text:
                                              "${examViewModel.selectedExam!['minAge'].toString()} Years",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85))
                                    ])),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "• Maximum Age : ",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85)),
                                      TextSpan(
                                          text:
                                              "${examViewModel.selectedExam!['maxAge'].toString()} Years",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85))
                                    ])),
                                    Text(
                                        "• Age Relaxation Extra as per ${examViewModel.selectedExam!['name']} Recruitment Rules.",
                                        style: TextStyle(
                                            fontSize: FontSize * 0.85))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(minWidth: 300),
                            child: Container(
                              width: 600,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(),
                                      left: BorderSide(),
                                      top: BorderSide())),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight * 0.02,
                                    bottom: screenHeight * 0.02),
                                child: Center(
                                  child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: examViewModel
                                                .selectedExam!['name'],
                                            style: TextStyle(
                                                fontSize: FontSize * 1.1,
                                                color: Colors.green[800],
                                                fontWeight: FontWeight.bold)),
                                        TextSpan(
                                            text:
                                                " Vacancy Details Total 25 Post",
                                            style: TextStyle(
                                                fontSize: FontSize * 1.1,
                                                color: const Color(0xffff36ff),
                                                fontWeight: FontWeight.bold))
                                      ])),
                                ),
                              ),
                            ),
                          ),
                          ConstrainedBox(
                              constraints: const BoxConstraints(minWidth: 300),
                              child: Container(
                                width: 600,
                                child: Table(
                                  border: TableBorder.all(
                                      color: Colors.black, width: 1),
                                  columnWidths: const {
                                    0: FlexColumnWidth(3),
                                    1: FlexColumnWidth(2),
                                    2: FlexColumnWidth(7)
                                  },
                                  children: [
                                    TableRow(children: [
                                      Center(
                                          child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.01,
                                            bottom: screenHeight * 0.01),
                                        child: Text(
                                          "Post Name",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: FontSize * 0.9,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                      Center(
                                          child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.01,
                                            bottom: screenHeight * 0.01),
                                        child: Text(
                                          "Total",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: FontSize * 0.9,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                      Center(
                                          child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.01,
                                            bottom: screenHeight * 0.01),
                                        child: Text(
                                          "${examViewModel.selectedExam!['name']} Eligibility",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: FontSize * 0.9,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                    ]),
                                    TableRow(
                                      children: examViewModel.selectedExam !=
                                                  null &&
                                              examViewModel.selectedExam![
                                                      'postDetails'] !=
                                                  null &&
                                              examViewModel
                                                  .selectedExam!['postDetails']
                                                  .isNotEmpty
                                          ? [
                                              Center(
                                                  child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenHeight * 0.01),
                                                child: Text(
                                                    examViewModel.selectedExam![
                                                                'postDetails']
                                                            [0]['postName'] ??
                                                        "N/A",
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85)),
                                              )),
                                              Center(
                                                  child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenHeight * 0.01),
                                                child: Text(
                                                    examViewModel.selectedExam![
                                                                'postDetails']
                                                                [0]['totalPost']
                                                            ?.toString() ??
                                                        "N/A",
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85)),
                                              )),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: screenHeight * 0.01,
                                                    top: screenHeight * 0.01,
                                                    bottom:
                                                        screenHeight * 0.01),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        "• ${examViewModel.selectedExam!['postDetails'][0]['eligiblityDetails'] ?? "Eligibility details not available"}",
                                                        style: TextStyle(
                                                            fontSize: FontSize *
                                                                0.85)),
                                                    Text(
                                                        "• Basic Knowledge of Computer Operation.",
                                                        style: TextStyle(
                                                            fontSize: FontSize *
                                                                0.85)),
                                                    Text(
                                                        "• For Management Trainee Post : Required 50% Marks.",
                                                        style: TextStyle(
                                                            fontSize: FontSize *
                                                                0.85))
                                                  ],
                                                ),
                                              )
                                            ]
                                          : [
                                              /// Fallback when `postDetails` is empty
                                              Center(
                                                  child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenHeight * 0.01),
                                                child: Text("N/A",
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85)),
                                              )),
                                              Center(
                                                  child: Padding(
                                                padding: EdgeInsets.only(
                                                    top: screenHeight * 0.01),
                                                child: Text("N/A",
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85)),
                                              )),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: screenHeight * 0.01,
                                                    top: screenHeight * 0.01,
                                                    bottom:
                                                        screenHeight * 0.01),
                                                child: Text(
                                                    "No post details available",
                                                    style: TextStyle(
                                                        fontSize:
                                                            FontSize * 0.85)),
                                              )
                                            ],
                                    ),
                                  ],
                                ),
                              )),
                          ConstrainedBox(
                            constraints: const BoxConstraints(minWidth: 300),
                            child: Container(
                              width: 600,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(), left: BorderSide())),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight * 0.02,
                                    bottom: screenHeight * 0.01),
                                child: Column(
                                  children: [
                                    Center(
                                      child: Text(
                                        "${examViewModel.selectedExam!['name']} City Details 2024",
                                        style: TextStyle(
                                            color: const Color(0xffff36ff),
                                            fontSize: FontSize * 1.1,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: FontSize * 0.9),
                                      child: Text(
                                        "• Haldwani, Dehradun, Roorkee, Bareilly, Meerut, Moradabad, Lucknow, Jaipur, Delhi and Ambala",
                                        style: TextStyle(
                                            fontSize: screenHeight * 0.022),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(minWidth: 300),
                            child: Container(
                              width: 600,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      top: BorderSide(),
                                      right: BorderSide(),
                                      left: BorderSide())),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: screenHeight * 0.01,
                                    top: screenHeight * 0.02,
                                    bottom: screenHeight * 0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                        "How to Fill ${examViewModel.selectedExam!['name']}",
                                        style: TextStyle(
                                            fontSize: FontSize * 1.1,
                                            color: Colors.green[800],
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                        "• The ${examViewModel.selectedExam!['name']}, Candidate Can Apply Between ${_formatDate(examViewModel.selectedExam!['applicationBegin'])} to ${_formatDate(examViewModel.selectedExam!['lastDateToApply'])}",
                                        style: TextStyle(
                                            fontSize: FontSize * 0.85)),
                                    Text(
                                        "• Candidate Read the Notification Before Apply the Vacancies Application Form in Govt. Jobs of Bank Latest Govt. Recruitment Online 2025.",
                                        style: TextStyle(
                                            fontSize: FontSize * 0.85)),
                                    Text(
                                        "• Kindly Check and Collect the All Document - Eligibility, ID Proof, Address Details, Basic Details.",
                                        style: TextStyle(
                                            fontSize: FontSize * 0.85)),
                                    Text(
                                        "• Kindly Ready Scan Document Related to Recruitment Form - Photo, Sign, ID Proof, Etc.",
                                        style: TextStyle(
                                            fontSize: FontSize * 0.85)),
                                    Text(
                                        "• Before Apply Online / Submit Application Form Must Check the Preview and All Column Carefully.",
                                        style: TextStyle(
                                            fontSize: FontSize * 0.85)),
                                    Text(
                                        "• If Candidate Required to Paying the Application Fee Must Submit. If you have Not the Required Application Fees Your Form is Not Completed.",
                                        style: TextStyle(
                                            fontSize: FontSize * 0.85)),
                                    Text(
                                        "• Take A Print Out of Final Submitted Form.",
                                        style: TextStyle(
                                            fontSize: FontSize * 0.85))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(minWidth: 300),
                            child: Container(
                              width: 600,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(),
                                      left: BorderSide(),
                                      top: BorderSide())),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight * 0.02,
                                    bottom: screenHeight * 0.02),
                                child: Text(
                                  "Interested Candidate Can Read the Full Notification Before Apply Online.",
                                  style: TextStyle(
                                      fontSize: FontSize * 1.1,
                                      color: const Color(0xffff36ff),
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(minWidth: 300),
                            child: Container(
                              width: 600,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(),
                                      left: BorderSide(),
                                      top: BorderSide())),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight * 0.02,
                                    bottom: screenHeight * 0.02),
                                child: Text(
                                  "Download Mobile Apps for the Latest Updates",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: FontSize * 1.1,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 600,
                            decoration: const BoxDecoration(
                                border: Border(
                                    right: BorderSide(),
                                    left: BorderSide(),
                                    top: BorderSide())),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(right: BorderSide())),
                                      child: Center(
                                          child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.02,
                                            bottom: screenHeight * 0.02),
                                        child: Text(
                                          "Android Apps",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: FontSize * 1.1,
                                              color: const Color(0xff591f8d),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      child: Center(
                                        child: Text("Apple IOS Apps",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: FontSize * 1.1,
                                                color: const Color(0xff591f8d),
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints(minWidth: 300),
                            child: Container(
                              width: 600,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      right: BorderSide(),
                                      left: BorderSide(),
                                      top: BorderSide())),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight * 0.02,
                                    bottom: screenHeight * 0.02),
                                child: Text(
                                  "Some Useful Important Links",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: FontSize * 1.1,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                            ),
                          ),
                          Container(
                            width: 600,
                            decoration: const BoxDecoration(
                                border: Border(
                                    right: BorderSide(),
                                    left: BorderSide(),
                                    top: BorderSide())),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(right: BorderSide())),
                                      child: Center(
                                          child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.02,
                                            bottom: screenHeight * 0.02),
                                        child: Text(
                                          "Apply Online",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: FontSize * 1.1,
                                              color: const Color(0xffff36ff),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Center(
                                      child: Padding(
                                          padding: EdgeInsets.only(
                                              top: screenHeight * 0.02,
                                              bottom: screenHeight * 0.02),
                                          child: TextButton(
                                            onPressed: () {
                                              const link =
                                                  "https://ibpsonline.ibps.in/nblcnov24/";
                                              launchUrl(Uri.parse(link),
                                                  mode: LaunchMode
                                                      .externalApplication);
                                            },
                                            child: Text("Click Here",
                                                style: TextStyle(
                                                    fontSize: FontSize * 1.1,
                                                    color:
                                                        const Color(0xff591f8d),
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )),
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            width: 600,
                            decoration: const BoxDecoration(
                                border: Border(
                                    right: BorderSide(),
                                    left: BorderSide(),
                                    top: BorderSide())),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(right: BorderSide())),
                                      child: Center(
                                          child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.02,
                                            bottom: screenHeight * 0.02),
                                        child: Text(
                                          "Download Notification",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: FontSize * 1.1,
                                              color: const Color(0xffff36ff),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                    )),
                                Expanded(
                                    flex: 5,
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.02,
                                            bottom: screenHeight * 0.02),
                                        child: Text("Click Here",
                                            style: TextStyle(
                                                fontSize: FontSize * 1.1,
                                                color: const Color(0xff591f8d),
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            width: 600,
                            decoration: const BoxDecoration(
                                border: Border(
                                    right: BorderSide(),
                                    left: BorderSide(),
                                    top: BorderSide())),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                          border: Border(right: BorderSide())),
                                      child: Center(
                                          child: Padding(
                                        padding: EdgeInsets.only(
                                            top: screenHeight * 0.02,
                                            bottom: screenHeight * 0.02),
                                        child: Text(
                                          "Join Sarkari Result Channel",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: FontSize * 1.1,
                                              color: const Color(0xffff36ff),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                    )),
                                Expanded(
                                  flex: 5,
                                  child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.02,
                                          bottom: screenHeight * 0.02),
                                      child: Wrap(
                                        direction: Axis.horizontal,
                                        alignment: WrapAlignment.center,
                                        children: [
                                          Text("Telegram",
                                              style: TextStyle(
                                                  fontSize: FontSize * 1.1,
                                                  color:
                                                      const Color(0xff591f8d),
                                                  fontWeight: FontWeight.bold)),
                                          Text(" | ",
                                              style: TextStyle(
                                                  fontSize: FontSize * 1.1,
                                                  color:
                                                      const Color(0xff591f8d),
                                                  fontWeight: FontWeight.bold)),
                                          Text("WhatsApp",
                                              style: TextStyle(
                                                  fontSize: FontSize * 1.1,
                                                  color:
                                                      const Color(0xff591f8d),
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                              width: 600,
                              child: Table(
                                border: TableBorder.all(color: Colors.black),
                                columnWidths: const {
                                  0: FlexColumnWidth(5),
                                  1: FlexColumnWidth(5)
                                },
                                children: [
                                  TableRow(children: [
                                    Center(
                                        child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.02,
                                          bottom: screenHeight * 0.02),
                                      child: Text(
                                        "Official Website",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: FontSize * 1.1,
                                            color: const Color(0xffff36ff),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                    Center(
                                        child: Padding(
                                      padding: EdgeInsets.only(
                                          top: screenHeight * 0.02,
                                          bottom: screenHeight * 0.02),
                                      child: Text(
                                          "Nainital Bank Official Website",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: FontSize * 1.1,
                                              color: const Color(0xff591f8d),
                                              fontWeight: FontWeight.bold)),
                                    )),
                                  ])
                                ],
                              )),
                        ],
                      ),
          ),
        ),
      ),
    );
  }

  /// Helper function to format date strings
  String _formatDate(dynamic date) {
    if (date != null && date.toString().isNotEmpty) {
      DateTime parsedDate = DateTime.parse(date.toString());
      return "${parsedDate.day.toString().padLeft(2, '0')}/${parsedDate.month.toString().padLeft(2, '0')}/${parsedDate.year}";
    }
    return "N/A";
  }
}

class NavButton extends StatefulWidget {
  final String label;
  final String path;

  const NavButton({super.key, required this.label, required this.path});

  @override
  _NavButtonState createState() => _NavButtonState();
}

class _NavButtonState extends State<NavButton> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;

    double fontSize = isMobile
        ? 12
        : isTablet
            ? 14
            : 16;

    return TextButton(
      onPressed: () {
        context.go(widget.path);
      },
      child: Text(
        widget.label,
        style: TextStyle(
          fontSize: fontSize * 0.75,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
