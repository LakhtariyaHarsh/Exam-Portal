import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
class jobDetails extends StatelessWidget {
  const jobDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
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
        padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02,),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 600,
                  color: const Color(0xffaa183d),
                  child: Padding(
                    padding:  EdgeInsets.only(top: screenHeight*0.02, left: screenHeight*0.02, bottom: screenHeight*0.02),
                    child: Row(
                      children: [
                        Image(width: FontSize*4,height: FontSize*4,image: const AssetImage("assets/logo_drawer.icon.png",)),
                        SizedBox(width: screenWidth*0.05,),
                        Column(
                          children: [
                            Text("SARKARI RESULT",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: FontSize*1.4),),
                            Text("WWW.SARKARIRESULT.COM",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,fontSize: FontSize))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 600,
                  color: Colors.black,
                  child:  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        NavButton(label: "Home", path: "/",),
                        NavButton(label: "Latest Jobs", path: "/latestjob",),
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
                  padding:  EdgeInsets.only(top: screenHeight*0.02),
                  child: Container(
                    width: 600,
                    child: Table(
                      columnWidths: const {
                        0: FlexColumnWidth(1),
                        1: FlexColumnWidth(4),
                      },
                      children: [
                        TableRow(
                          children: [
                            Text("Name of Post: ",style: TextStyle(fontSize: FontSize,color: Colors.red, fontWeight: FontWeight.bold)),
                            Text("Nainital Bank Customer Support Associate (Clerk) Recruitment 2024 Apply Online for 25 Post",
                            style: TextStyle(fontSize: FontSize),)
                          ]
                        ),
                        TableRow(
                          children: [
                            Text("Post Date /Update: ",style: TextStyle(fontSize: FontSize,color: Colors.red, fontWeight: FontWeight.bold)),
                            Text( "04 December 2024 | 01:06 PM", style: TextStyle(fontSize: FontSize ))
                          ]
                        ),
                        TableRow(
                          children: [
                            Text("Short Information: ",style: TextStyle(fontSize: FontSize,color: Colors.red, fontWeight: FontWeight.bold)),
                            Text("The Nainital Bank Limited Released Notification for Customer Support Associate (Clerk) Recruitment Exam 2024. Those candidates who are interested in this Nainital Bank Clerk Exam can Apply Online from 04 December 2024 to 22 December 2024. Read the Nainital Bank Customer Support Associate (Clerk) Post notification for recruitment eligibility, post information, selection procedure, age limit, pay scale and all other information.",
                                textAlign: TextAlign.justify,style: TextStyle(fontSize: FontSize))
                          ]
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight*0.05,),
                ConstrainedBox(constraints: const BoxConstraints(minWidth: 300),
                  child: Container(
                      width: 600,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(),
                          left: BorderSide(),
                          top: BorderSide()
                        )
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(top: screenHeight*0.01, bottom: screenHeight*0.01),
                        child: Column(
                          children: [
                            Text("The Nainital Bank Ltd",
                            style: TextStyle(
                              color:const Color(0xffff36ff),fontSize: FontSize*1.1,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            const SizedBox(height: 5,),
                            Center(
                              child: Text("Nainital Bank NBL Customer Support Associate (Clerk) Recruitment 2024",
                              style: TextStyle(fontSize: FontSize*1.2,color: Colors.green[800],fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                            const SizedBox(height: 5,),
                            Center(
                              child: Text("Nainital Bank Clerk Exam 2024 : Short Details of Notification",
                              style: TextStyle(fontSize: FontSize*1.1,color:const Color(0xffff36ff),fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            ),
                            const SizedBox(height: 5,),
                            Center(
                              child: Text("WWW.SARKARIRESULT.COM",
                              style: TextStyle(fontSize: FontSize*1.3,color: Colors.redAccent,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                            )
                          ],
                        ),
                      )
                    ),
                ),
                ConstrainedBox(constraints: const BoxConstraints(minWidth: 300),
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
                          border: Border(
                            right: BorderSide())),
                            child: Padding(
                              padding:  EdgeInsets.only(left: screenHeight*0.01,top: screenHeight*0.01, bottom: screenHeight*0.01),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text("Important Dates",
                                        style: TextStyle(fontSize: FontSize,color: Colors.green[800],fontWeight: FontWeight.bold)),
                                  ),
                                  const SizedBox(height: 5,),
                                  RichText(text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "• Application Begin :", style: TextStyle(fontSize: FontSize*0.85)),
                                      TextSpan(
                                        text: " 04/12/2024", style: TextStyle(fontSize: FontSize*0.85))
                                    ]
                                  )),
                                  RichText(text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "• Last Date for Apply Online  :", style: TextStyle(fontSize: FontSize*0.85)),
                                        TextSpan(
                                            text: " 22/12/2024", style: TextStyle(fontSize: FontSize*0.85))
                                      ]
                                  )),
                                  RichText(text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "• Pay Examination Fee Last Date :", style: TextStyle(fontSize: FontSize*0.85)),
                                        const TextSpan(
                                            text: " 22/12/2024", style: TextStyle(fontSize: 0.85))
                                      ]
                                  )),
                                  RichText(text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "• Exam Date :", style: TextStyle(fontSize: FontSize*0.85)),
                                        TextSpan(
                                            text: " January 2025", style: TextStyle(fontSize: FontSize*0.85))
                                      ]
                                  )),
                                  RichText(text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "• Admit Card Available :", style: TextStyle(fontSize: FontSize*0.85)),
                                        TextSpan(
                                            text: " Before Exam", style: TextStyle(fontSize: FontSize*0.85))
                                      ]
                                  ))
                                ],
                              ),
                            ),
                      )),
                      Expanded(
                          flex: 5,
                          child: Container(
                            child: Padding(
                              padding: EdgeInsets.only(left: screenHeight*0.01),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text("Application Fee",
                                        style: TextStyle(fontSize: FontSize,color: Colors.green[800],fontWeight: FontWeight.bold)),),
                                  const SizedBox(height: 5,),
                                  RichText(text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "• General / OBC / EWS :", style: TextStyle(fontSize:FontSize*0.85)),
                                        TextSpan(
                                            text: "  1000/-", style: TextStyle(fontSize: FontSize*0.85))
                                      ]
                                  )),
                                  RichText(text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "• SC / ST / PH :", style: TextStyle(fontSize: FontSize*0.85)),
                                        TextSpan(
                                            text: "  1000/-", style: TextStyle(fontSize: FontSize*0.85))
                                      ]
                                  )),
                                  Text("• Pay the Exam Fees Through Debit Card / Credit Card / Net Banking Mode.", style: TextStyle(fontSize: FontSize*0.85))
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                ),
                ConstrainedBox(constraints: const BoxConstraints(minWidth: 300),
                child: Container(
                  width: 600,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      left: BorderSide(),
                      top: BorderSide())),
                  child: Padding(
                    padding:  EdgeInsets.only(top: screenHeight*0.01,left: screenHeight*0.01, bottom: screenHeight*0.01),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: RichText(textAlign: TextAlign.center,
                              text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Nainital Bank Clerk Notification 2024 : ",
                                  style: TextStyle(fontSize: FontSize*1.1,
                                      color:const Color(0xffff36ff),fontWeight: FontWeight.bold),),
                              TextSpan(
                                text: "Age Limit as on 31/10/2024",
                                style: TextStyle(fontSize: FontSize*1.1,color: Colors.green[800],fontWeight: FontWeight.bold),
                              )
                            ]
                          )),
                        ),
                        const SizedBox(height: 5,),
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "• Minimum Age :", style: TextStyle(fontSize: FontSize*0.85)),
                              TextSpan(
                                  text: " 21 Years", style: TextStyle(fontSize: FontSize*0.85))
                            ]
                        )),
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "• Maximum Age :", style: TextStyle(fontSize: FontSize*0.85)),
                              TextSpan(
                                  text: " 32 Years", style: TextStyle(fontSize: FontSize*0.85))
                            ]
                        )),
                        Text("• Age Relaxation Extra as per Nainital Bank Clerk Recruitment Rules.", style: TextStyle(fontSize: FontSize*0.85))
                      ],
                    ),
                  ),
                ),
                ),
                ConstrainedBox(constraints: const BoxConstraints(minWidth: 300),
                child: Container(
                  width: 600,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      left: BorderSide(),
                      top: BorderSide())),
                  child: Padding(
                    padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                    child: Center(
                      child: RichText(textAlign: TextAlign.center,
                          text: TextSpan(
                        children: [TextSpan(
                          text: "Nainital Bank Clerk Recruitment 2024 : ",
                            style: TextStyle(fontSize:FontSize*1.1,color: Colors.green[800],fontWeight: FontWeight.bold)
                        ),
                        TextSpan(
                          text: "Vacancy Details Total 25 Post",
                            style: TextStyle(fontSize: FontSize*1.1,
                                color:const Color(0xffff36ff),fontWeight: FontWeight.bold)
                        )
                        ]
                      )),
                    ),
                  ),
                ),
                ),
                ConstrainedBox(constraints: const BoxConstraints(minWidth: 300),
                    child: Container(
                      width: 600,
                      child:  Table(
                        border: TableBorder.all(
                          color: Colors.black,
                          width: 1
                        ),
                        columnWidths: const {
                          0: FlexColumnWidth(3),
                          1: FlexColumnWidth(2),
                          2: FlexColumnWidth(7)
                        },
                        children: [
                          TableRow(
                              children: [
                                Center(child: Padding(
                                  padding:  EdgeInsets.only(top: screenHeight*0.01, bottom: screenHeight*0.01),
                                  child: Text("Post Name",textAlign: TextAlign.center,style: TextStyle(fontSize: FontSize*0.9,fontWeight: FontWeight.bold),),
                                )),
                                Center(child: Padding(
                                  padding:  EdgeInsets.only(top: screenHeight*0.01, bottom: screenHeight*0.01),
                                  child: Text("Total",textAlign: TextAlign.center,style: TextStyle(fontSize: FontSize*0.9,fontWeight: FontWeight.bold),),
                                )),
                                Center(child: Padding(
                                  padding:  EdgeInsets.only(top: screenHeight*0.01, bottom: screenHeight*0.01),
                                  child: Text("Nainital Bank Clerk Eligibility",textAlign: TextAlign.center,style: TextStyle(fontSize: FontSize*0.9,fontWeight: FontWeight.bold),),
                                )),
                              ]
                          ),
                          TableRow(
                              children: [
                                Center(child: Padding(
                                  padding:  EdgeInsets.only(top: screenHeight*0.01),
                                  child: Text("Clerk", style: TextStyle(fontSize: FontSize*0.85)),
                                )),
                                Center(child: Padding(
                                  padding:  EdgeInsets.only(top: screenHeight*0.01),
                                  child: Text("25", style: TextStyle(fontSize: FontSize*0.85)),
                                )),
                                Padding(
                                  padding:  EdgeInsets.only(left: screenHeight*0.01,top: screenHeight*0.01, bottom: screenHeight*0.01),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("• Bachelor / Master Degree in Any Subject / Stream in Any Recognized University in India with Minimum 50% Marks.", style: TextStyle(fontSize: FontSize*0.85)),
                                      Text("• Basic Knowledge of Computer Operation.", style: TextStyle(fontSize: FontSize*0.85)),
                                      Text("• For Management Trainee Post : Required 50% Marks.", style: TextStyle(fontSize: FontSize*0.85))
                                    ],
                                  ),
                                )
                              ]
                          )
                        ],
                      ),
                    )
                ),

                ConstrainedBox(constraints: const BoxConstraints(minWidth: 300),
                child: Container(
                  width: 600,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      left: BorderSide())),
                  child: Padding(
                    padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.01),
                    child: Column(
                      children: [
                        Center(
                          child: Text("Nainital Bank Clerk Exam City Details 2024"
                            ,style: TextStyle(color:const Color(0xffff36ff),fontSize: FontSize*1.1,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: FontSize*0.9),
                          child: Text("• Haldwani, Dehradun, Roorkee, Bareilly, Meerut, Moradabad, Lucknow, Jaipur, Delhi and Ambala",style: TextStyle(fontSize: screenHeight*0.022),),
                        )
                      ],
                    ),
                  ),
                ),
                ),
                ConstrainedBox(constraints: const BoxConstraints(minWidth: 300),
                  child: Container(
                    width: 600,
                    decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(),
                            right: BorderSide(),
                            left: BorderSide())),
                    child: Padding(
                      padding:  EdgeInsets.only(left: screenHeight*0.01, top: screenHeight*0.02, bottom: screenHeight*0.01),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text("How to Fill Nainital Bank Ltd Clerk Recruitment Form 2024",
                              style: TextStyle(fontSize: FontSize*1.1,color:Colors.green[800],fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                          ),
                          Text("• The Nainital Bank Ltd Clerks Recruitment 2024, Candidate Can Apply Between 04/12/2024 to 22/12/2024",style: TextStyle(fontSize: FontSize*0.85)),
                          Text("• Candidate Read the Notification Before Apply the Vacancies Application Form in Govt. Jobs of Bank Latest Govt. Recruitment Online 2024.",style: TextStyle(fontSize: FontSize*0.85)),
                          Text("• Kindly Check and Collect the All Document - Eligibility, ID Proof, Address Details, Basic Details.",style: TextStyle(fontSize: FontSize*0.85)),
                          Text("• Kindly Ready Scan Document Related to Recruitment Form - Photo, Sign, ID Proof, Etc.",style: TextStyle(fontSize: FontSize*0.85)),
                          Text("• Before Apply Online / Submit Application Form Must Check the Preview and All Column Carefully.",style: TextStyle(fontSize: FontSize*0.85)),
                          Text("• If Candidate Required to Paying the Application Fee Must Submit. If you have Not the Required Application Fees Your Form is Not Completed.",style: TextStyle(fontSize: FontSize*0.85)),
                          Text("• Take A Print Out of Final Submitted Form.",style: TextStyle(fontSize: FontSize*0.85))
                        ],
                      ),
                    ),
                  ),
                ),
                ConstrainedBox(constraints: const BoxConstraints(minWidth: 300),
                child: Container(
                  width: 600,
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(),
                      left: BorderSide(),
                      top: BorderSide())),
                  child: Padding(
                    padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                    child: Text("Interested Candidate Can Read the Full Notification Before Apply Online.",
                      style: TextStyle(fontSize: FontSize*1.1,color:const Color(0xffff36ff),fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  ),
                ),
                ),
                ConstrainedBox(constraints: const BoxConstraints(minWidth: 300),
                  child:Container(
                    width:600,
                    decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(),
                            left: BorderSide(),
                            top: BorderSide())),
                    child: Padding(
                      padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                      child: Text("Download Mobile Apps for the Latest Updates",textAlign:TextAlign.center,style: TextStyle(fontSize: FontSize*1.1,color: Colors.green[800],fontWeight: FontWeight.bold),),
                    ),
                  ) ,),
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
                              border: Border(
                                right: BorderSide())),
                            child: Center(child: Padding(
                              padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                              child: Text("Android Apps",textAlign: TextAlign.center,
                              style: TextStyle(fontSize: FontSize*1.1,color: const Color(0xff591f8d),fontWeight: FontWeight.bold),),
                            )),
                          )),
                      Expanded(
                          flex: 5,
                          child: Container(
                        child: Center(child: Text("Apple IOS Apps", textAlign: TextAlign.center,  style: TextStyle(fontSize:FontSize*1.1,color: const Color(0xff591f8d),fontWeight: FontWeight.bold)),),
                      ))
                    ],
                  ),
                ),
                ConstrainedBox(constraints: const BoxConstraints(minWidth: 300),
                  child:Container(
                    width:600,
                    decoration: const BoxDecoration(
                        border: Border(
                            right: BorderSide(),
                            left: BorderSide(),
                            top: BorderSide())),
                    child: Center(child: Padding(
                      padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                      child: Text("Some Useful Important Links",textAlign: TextAlign.center,style: TextStyle(fontSize: FontSize*1.1,color: Colors.green[800],fontWeight: FontWeight.bold),),
                    )),
                  ) ,),
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
                                border: Border(
                                    right: BorderSide())),
                            child: Center(child: Padding(
                              padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                              child: Text("Apply Online",textAlign: TextAlign.center,
                                style: TextStyle(fontSize: FontSize*1.1,color:const Color(0xffff36ff),fontWeight: FontWeight.bold),),
                            )),
                          )),
                      Expanded(
                          flex: 5,
                          child: Center(child: Padding(
                            padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                            child: TextButton(
                                onPressed: () {
                                  const link ="https://ibpsonline.ibps.in/nblcnov24/";
                                  launchUrl(
                                    Uri.parse(link),
                                    mode: LaunchMode.externalApplication
                                  );
                                },
                                child: Text("Click Here",
                                    style: TextStyle(fontSize: FontSize*1.1,color: const Color(0xff591f8d),fontWeight: FontWeight.bold)),
                            )
                          ),))
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
                                border: Border(
                                    right: BorderSide())),
                            child: Center(child: Padding(
                              padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                              child: Text("Download Notification",textAlign: TextAlign.center,
                                style: TextStyle(fontSize: FontSize*1.1,color:const Color(0xffff36ff),fontWeight: FontWeight.bold),),
                            )),
                          )),
                      Expanded(
                          flex: 5,
                          child: Center(child: Padding(
                            padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                            child: Text("Click Here",   style: TextStyle(fontSize: FontSize*1.1,color: const Color(0xff591f8d),fontWeight: FontWeight.bold)),
                          ),))
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
                                border: Border(
                                    right: BorderSide())),
                            child: Center(child: Padding(
                              padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                              child: Text("Join Sarkari Result Channel",textAlign: TextAlign.center,
                                style: TextStyle(fontSize: FontSize*1.1,color:const Color(0xffff36ff),fontWeight: FontWeight.bold),),
                            )),
                          )),
                      Expanded(
                          flex: 5,
                          child:Center(
                            child: Padding(
                              padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                              child: Wrap(
                                direction: Axis.horizontal,
                                alignment: WrapAlignment.center,
                                children: [
                                  Text("Telegram", style: TextStyle(fontSize: FontSize*1.1,color: const Color(0xff591f8d),fontWeight: FontWeight.bold)),
                                  Text(" | ",style: TextStyle(fontSize: FontSize*1.1,color: const Color(0xff591f8d),fontWeight: FontWeight.bold)),
                                  Text("WhatsApp", style: TextStyle(fontSize: FontSize*1.1,color: const Color(0xff591f8d),fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ),)
                    ],
                  ),
                ),
                Container(
                  width: 600,
                  child: Table(
                    border: TableBorder.all(
                      color: Colors.black
                    ),
                    columnWidths: const {
                    0: FlexColumnWidth(5),
                    1: FlexColumnWidth(5)
                  },children: [
                      TableRow(
                        children: [
                          Center(child: Padding(
                            padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                            child: Text("Official Website",textAlign: TextAlign.center,
                              style: TextStyle(fontSize: FontSize*1.1,color:const Color(0xffff36ff),fontWeight: FontWeight.bold),),
                          )),
                          Center(child: Padding(
                            padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                            child: Text("Nainital Bank Official Website", textAlign: TextAlign.center,  style: TextStyle(fontSize: FontSize*1.1,color: const Color(0xff591f8d),fontWeight: FontWeight.bold)),
                          )),
                        ]
                      )
                  ],
                  )
                ),

              ],
            ),
          ),
        ),
      ),
    );
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

    double fontSize = isMobile ? 12 : isTablet ? 14 : 16;

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