import 'package:exam_portal/pages/result.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../details_page.dart';

class admissionPage extends StatelessWidget {
  admissionPage({super.key});

  @override
  Widget build(BuildContext context) {

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
      body:  Padding(
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
                Padding(
                  padding:  EdgeInsets.only(top: screenHeight*0.05),
                  child: ConstrainedBox(constraints: const BoxConstraints(minWidth: 300),
                    child: Container(
                      width: 600,
                      decoration: const BoxDecoration(
                          border: Border(
                              right: BorderSide(),
                              left: BorderSide(),
                              top: BorderSide(),
                              bottom: BorderSide())),
                      child: Padding(
                        padding:  EdgeInsets.only(top: screenHeight*0.02,left: screenHeight*0.01, right: screenHeight*0.01),
                        child: Column(
                          children: [
                            Container(
                              height: screenHeight*0.06,
                              color: const Color(0xffaa183d),
                              child: Center(child: Text("Amdmission",textAlign: TextAlign.center,
                                style: TextStyle(fontSize: FontSize*1.5,color: Colors.white),
                              )),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6,),
                                title: Text("Army School AWES TGT PGT PRT Result 2024",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6,),
                                title: Text("ONGC Apprentice Merit List 2024",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6,),
                                title: Text("UPSC Civil Services IAS Main Result 2024",
                                    style: TextStyle(fontSize:FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size:FontSize*0.6,),
                                title: Text("CLAT 2025 Result with Score Card",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("Bihar Board Class 10th, 12th Time Table 2025",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("SSC Exam Calendar 2025-2026",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("India Post GDS 5th Merit List / Result",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("SSC CGL 2024 Tier I Result",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("RSMSSB Hostel Superintendent Merit List 2024",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("IB ACIO Technical 2023 Final Result",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("CSIR CASE SO / ASO 2023 Result / Merit List",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("MPESB Sub Engineer & Other Post Result 2024",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("IBPS SO 14th Pre Exam Result 2024",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("NTA NTET 2024 Result / Score Card",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("UPPSC Assistant Town Planner 2023 Final Result",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("Nabard Assistant Manager Phase II Mains Result 2024",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("IOCL Non Executives Result 2024",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("Bihar BPSC 32 Civil Judge Final Result 2024",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("RSMSSB Agriculture Supervisor 2023 Final Result",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size:FontSize*0.6,),
                                title: Text("UPSC Engineering Services 2024 Marks",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("IBPS PO 14th Pre Exam Score Card / Marks",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("IRDAI Assistant Manager Phase I Result 2024",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size:FontSize*0.6),
                                title: Text("CISCE Class 10th, 12th Time Table 2025",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size:FontSize*0.6),
                                title: Text("SSB Constable Tradesman / HC Electrician Result 2024",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size:FontSize*0.6),
                                title: Text("UPSSSC Mukhya Sevika 2022 Mains Exam Result",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
                            ),
                            InkWell(
                              onTap: () =>  context.go('/admission/examname'),
                              child: ListTile(
                                leading: Icon(Icons.circle,size: FontSize*0.6),
                                title: Text("Indian Bank Apprentice Result 2024",
                                    style: TextStyle(fontSize: FontSize*1.1)),
                              ),
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
      ),
    );
  }
}
