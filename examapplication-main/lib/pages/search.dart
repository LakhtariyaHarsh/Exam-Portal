import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../details_page.dart';

class searchPage extends StatelessWidget {
  searchPage({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: screenHeight*0.02,bottom: screenHeight*0.02),
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 900,
                  color: const Color(0xffaa183d),
                  child: Padding(
                    padding:  EdgeInsets.only(top: screenHeight*0.02, bottom: screenHeight*0.02),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("SARKARI RESULT",style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: FontSize*2),),
                        Text("WWW.SARKARIRESULT.COM",style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,fontSize: FontSize))
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 900,
                  color: Colors.black,
                  child:   const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
