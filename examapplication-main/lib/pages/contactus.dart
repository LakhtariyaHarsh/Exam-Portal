import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../details_page.dart';

class contactUsPage extends StatelessWidget {
  contactUsPage({super.key});

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
                  padding:  EdgeInsets.only(top: screenHeight*0.05),
                  child: ConstrainedBox(constraints: const BoxConstraints(minWidth: 300),
                    child: Container(
                      child: Text("Contact Us Page", style: TextStyle(fontSize: FontSize, color: Colors.redAccent),),
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
