import 'package:exam_portal/pages/result.dart';
import 'package:exam_portal/view_models/exam_view_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class jobDetails extends StatefulWidget {
  final String examId;
  const jobDetails({super.key, required this.examId});

  @override
  State<jobDetails> createState() => _jobDetailsState();
}

class _jobDetailsState extends State<jobDetails> {
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
                if (screenWidth >= 720)
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
                SizedBox(
                  height: 20,
                ),
                // examViewModel.isLoading
                //     ? Center(child: CircularProgressIndicator())
                //     : examViewModel.selectedExam == null
                //         ? Center(child: Text("Exam not found"))
                //         : Padding(
                //             padding: const EdgeInsets.all(16.0),
                //             child: ListView(
                //               children: [
                //                 _buildDetailRow("Exam Name",
                //                     examViewModel.selectedExam!['name']),
                //                 _buildDetailRow(
                //                     "Last Date to Apply",
                //                     _formatDate(examViewModel
                //                         .selectedExam!['lastDateToApply'])),
                //                 _buildDetailRow(
                //                     "Admit Card Available",
                //                     _formatDate(examViewModel
                //                         .selectedExam!['admitCardAvailable'])),
                //                 _buildDetailRow(
                //                     "Answer Key Available",
                //                     _formatDate(examViewModel
                //                         .selectedExam!['answerKeyAvailable'])),
                //                 _buildDetailRow(
                //                     "Result Posting Date",
                //                     _formatDate(examViewModel
                //                         .selectedExam!['resultPostingDate'])),
                //                 _buildDetailRow(
                //                     "Syllabus Available Date",
                //                     _formatDate(examViewModel.selectedExam![
                //                         'syllabusAvailableDate'])),
                //                 _buildDetailRow(
                //                     "Is Admit Card Available?",
                //                     examViewModel.selectedExam![
                //                             'isadmitCardAvailable']
                //                         ? "Yes"
                //                         : "No"),
                //                 _buildDetailRow(
                //                     "Is Answer Key Available?",
                //                     examViewModel.selectedExam![
                //                             'isanswerKeyAvailable']
                //                         ? "Yes"
                //                         : "No"),
                //                 _buildDetailRow(
                //                     "Is Result Available?",
                //                     examViewModel
                //                             .selectedExam!['resultAvailable']
                //                         ? "Yes"
                //                         : "No"),
                //                 _buildDetailRow(
                //                     "Is Syllabus Available?",
                //                     examViewModel
                //                             .selectedExam!['syllabusAvailable']
                //                         ? "Yes"
                //                         : "No"),
                //               ],
                //             ),
                //           ),
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
                          Text("04 December 2024 | 01:06 PM",
                              style: TextStyle(fontSize: FontSize))
                        ]),
                        TableRow(children: [
                          Text("Short Information: ",
                              style: TextStyle(
                                  fontSize: FontSize,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold)),
                          Text(
                              "The Nainital Bank Limited Released Notification for Customer Support Associate (Clerk) Recruitment Exam 2024. Those candidates who are interested in this Nainital Bank Clerk Exam can Apply Online from 04 December 2024 to 22 December 2024. Read the Nainital Bank Customer Support Associate (Clerk) Post notification for recruitment eligibility, post information, selection procedure, age limit, pay scale and all other information.",
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
                            Text(
                              "The Nainital Bank Ltd",
                              style: TextStyle(
                                  color: const Color(0xffff36ff),
                                  fontSize: FontSize * 1.1,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                "Nainital Bank NBL Customer Support Associate (Clerk) Recruitment 2024",
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
                                "Nainital Bank Clerk Exam 2024 : Short Details of Notification",
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
                                  border: Border(right: BorderSide())),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: screenHeight * 0.01,
                                    top: screenHeight * 0.01,
                                    bottom: screenHeight * 0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text("Important Dates",
                                          style: TextStyle(
                                              fontSize: FontSize,
                                              color: Colors.green[800],
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "• Application Begin :",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85)),
                                      TextSpan(
                                          text: " 04/12/2024",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85))
                                    ])),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "• Last Date for Apply Online  :",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85)),
                                      TextSpan(
                                          text: " 22/12/2024",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85))
                                    ])),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text:
                                              "• Pay Examination Fee Last Date :",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85)),
                                      const TextSpan(
                                          text: " 22/12/2024",
                                          style: TextStyle(fontSize: 0.85))
                                    ])),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "• Exam Date :",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85)),
                                      TextSpan(
                                          text: " January 2025",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85))
                                    ])),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "• Admit Card Available :",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85)),
                                      TextSpan(
                                          text: " Before Exam",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85))
                                    ]))
                                  ],
                                ),
                              ),
                            )),
                        Expanded(
                            flex: 5,
                            child: Container(
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: screenHeight * 0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text("Application Fee",
                                          style: TextStyle(
                                              fontSize: FontSize,
                                              color: Colors.green[800],
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "• General / OBC / EWS :",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85)),
                                      TextSpan(
                                          text: "  1000/-",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85))
                                    ])),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "• SC / ST / PH :",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85)),
                                      TextSpan(
                                          text: "  1000/-",
                                          style: TextStyle(
                                              fontSize: FontSize * 0.85))
                                    ])),
                                    Text(
                                        "• Pay the Exam Fees Through Debit Card / Credit Card / Net Banking Mode.",
                                        style: TextStyle(
                                            fontSize: FontSize * 0.85))
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
                                        "Nainital Bank Clerk Notification 2024 : ",
                                    style: TextStyle(
                                        fontSize: FontSize * 1.1,
                                        color: const Color(0xffff36ff),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "Age Limit as on 31/10/2024",
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
                                text: "• Minimum Age :",
                                style: TextStyle(fontSize: FontSize * 0.85)),
                            TextSpan(
                                text: " 21 Years",
                                style: TextStyle(fontSize: FontSize * 0.85))
                          ])),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "• Maximum Age :",
                                style: TextStyle(fontSize: FontSize * 0.85)),
                            TextSpan(
                                text: " 32 Years",
                                style: TextStyle(fontSize: FontSize * 0.85))
                          ])),
                          Text(
                              "• Age Relaxation Extra as per Nainital Bank Clerk Recruitment Rules.",
                              style: TextStyle(fontSize: FontSize * 0.85))
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
                                  text:
                                      "Nainital Bank Clerk Recruitment 2024 : ",
                                  style: TextStyle(
                                      fontSize: FontSize * 1.1,
                                      color: Colors.green[800],
                                      fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "Vacancy Details Total 25 Post",
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
                        border: TableBorder.all(color: Colors.black, width: 1),
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
                                "Nainital Bank Clerk Eligibility",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: FontSize * 0.9,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                          ]),
                          TableRow(children: [
                            Center(
                                child: Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.01),
                              child: Text("Clerk",
                                  style: TextStyle(fontSize: FontSize * 0.85)),
                            )),
                            Center(
                                child: Padding(
                              padding:
                                  EdgeInsets.only(top: screenHeight * 0.01),
                              child: Text("25",
                                  style: TextStyle(fontSize: FontSize * 0.85)),
                            )),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: screenHeight * 0.01,
                                  top: screenHeight * 0.01,
                                  bottom: screenHeight * 0.01),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "• Bachelor / Master Degree in Any Subject / Stream in Any Recognized University in India with Minimum 50% Marks.",
                                      style:
                                          TextStyle(fontSize: FontSize * 0.85)),
                                  Text(
                                      "• Basic Knowledge of Computer Operation.",
                                      style:
                                          TextStyle(fontSize: FontSize * 0.85)),
                                  Text(
                                      "• For Management Trainee Post : Required 50% Marks.",
                                      style:
                                          TextStyle(fontSize: FontSize * 0.85))
                                ],
                              ),
                            )
                          ])
                        ],
                      ),
                    )),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 300),
                  child: Container(
                    width: 600,
                    decoration: const BoxDecoration(
                        border:
                            Border(right: BorderSide(), left: BorderSide())),
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 0.02,
                          bottom: screenHeight * 0.01),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "Nainital Bank Clerk Exam City Details 2024",
                              style: TextStyle(
                                  color: const Color(0xffff36ff),
                                  fontSize: FontSize * 1.1,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: FontSize * 0.9),
                            child: Text(
                              "• Haldwani, Dehradun, Roorkee, Bareilly, Meerut, Moradabad, Lucknow, Jaipur, Delhi and Ambala",
                              style: TextStyle(fontSize: screenHeight * 0.022),
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
                              "How to Fill Nainital Bank Ltd Clerk Recruitment Form 2024",
                              style: TextStyle(
                                  fontSize: FontSize * 1.1,
                                  color: Colors.green[800],
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                              "• The Nainital Bank Ltd Clerks Recruitment 2024, Candidate Can Apply Between 04/12/2024 to 22/12/2024",
                              style: TextStyle(fontSize: FontSize * 0.85)),
                          Text(
                              "• Candidate Read the Notification Before Apply the Vacancies Application Form in Govt. Jobs of Bank Latest Govt. Recruitment Online 2024.",
                              style: TextStyle(fontSize: FontSize * 0.85)),
                          Text(
                              "• Kindly Check and Collect the All Document - Eligibility, ID Proof, Address Details, Basic Details.",
                              style: TextStyle(fontSize: FontSize * 0.85)),
                          Text(
                              "• Kindly Ready Scan Document Related to Recruitment Form - Photo, Sign, ID Proof, Etc.",
                              style: TextStyle(fontSize: FontSize * 0.85)),
                          Text(
                              "• Before Apply Online / Submit Application Form Must Check the Preview and All Column Carefully.",
                              style: TextStyle(fontSize: FontSize * 0.85)),
                          Text(
                              "• If Candidate Required to Paying the Application Fee Must Submit. If you have Not the Required Application Fees Your Form is Not Completed.",
                              style: TextStyle(fontSize: FontSize * 0.85)),
                          Text("• Take A Print Out of Final Submitted Form.",
                              style: TextStyle(fontSize: FontSize * 0.85))
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
                                        mode: LaunchMode.externalApplication);
                                  },
                                  child: Text("Click Here",
                                      style: TextStyle(
                                          fontSize: FontSize * 1.1,
                                          color: const Color(0xff591f8d),
                                          fontWeight: FontWeight.bold)),
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
                                        color: const Color(0xff591f8d),
                                        fontWeight: FontWeight.bold)),
                                Text(" | ",
                                    style: TextStyle(
                                        fontSize: FontSize * 1.1,
                                        color: const Color(0xff591f8d),
                                        fontWeight: FontWeight.bold)),
                                Text("WhatsApp",
                                    style: TextStyle(
                                        fontSize: FontSize * 1.1,
                                        color: const Color(0xff591f8d),
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
                            child: Text("Nainital Bank Official Website",
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
      return date.toString().split("T")[0]; // Extracting only YYYY-MM-DD
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
