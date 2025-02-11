import 'package:flutter/material.dart';
import 'package:exam_portal/pages/result.dart';
import 'package:go_router/go_router.dart';
import '../details_page.dart';

class searchPage extends StatelessWidget {
  searchPage({super.key});

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
                  padding:  EdgeInsets.only(top: screenHeight*0.05, bottom: screenHeight*0.02),
                  child: ConstrainedBox(constraints: const BoxConstraints(minWidth: 300),
                    child: Container(
                      child: Text("SARKARI RESULT Search",textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: FontSize*1.6, color:  Color(0xffaa183d)),),
                    ),
                  ),
                ),
                ConstrainedBox(constraints: BoxConstraints(minWidth: 300),
                  child: Container(
                    width: screenWidth*0.5,
                    height: 30,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 7,
                            child: Container(
                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: "job title, Keyword",
                                  border: OutlineInputBorder()
                                ),
                              ),
                            ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          flex: 4,
                          child: Container(
                            color: Colors.indigo,
                            child: TextButton(
                                onPressed: (){},
                                child: Text("Search Jobs", style: TextStyle(color: Colors.white),)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: screenHeight*0.05),
                  child: Container(
                    width: 900,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color:Color(0xffaa183d) ),
                        left: BorderSide(color:Color(0xffaa183d) ),
                        top: BorderSide(color:Color(0xffaa183d) ),
                        bottom: BorderSide(color:Color(0xffaa183d) ),)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(top: screenHeight*0.02),
                          child: Container(
                            width: 900,
                            color: const Color(0xffaa183d),
                            child: Center(
                              child: Text("How to Search at Sarkari Result and Find Your Vacancy Details, Syllabus, Admit Card, Result, Etc",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white, fontSize: FontSize*1.2, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight*0.05,),
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "• Question :", style: TextStyle(fontSize: FontSize, fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "  What if you want to find a job?", style: TextStyle(fontSize: FontSize))
                            ]
                        )),
                        RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "• Answer :", style: TextStyle(fontSize: FontSize, fontWeight: FontWeight.bold)),
                              TextSpan(
                                  text: "  You will have to write the keyword of the job you want to know or you can search it by writing the name of the organization.", style: TextStyle(fontSize: FontSize))
                            ]
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
