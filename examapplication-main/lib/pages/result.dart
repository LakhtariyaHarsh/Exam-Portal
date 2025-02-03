import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class resultpage extends StatelessWidget {
   resultpage({super.key});

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
        padding:  EdgeInsets.only(top: screenHeight*0.02,bottom: screenHeight*0.02),
        child: SingleChildScrollView(
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
                            child: Center(child: Text("Latest Result 2024",textAlign: TextAlign.center,
                            style: TextStyle(fontSize: FontSize*1.5,color: Colors.white),
                            )),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6,),
                              title: Text("Army School AWES TGT PGT PRT Result 2024",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6,),
                              title: Text("ONGC Apprentice Merit List 2024",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6,),
                              title: Text("UPSC Civil Services IAS Main Result 2024",
                                  style: TextStyle(fontSize:FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size:FontSize*0.6,),
                              title: Text("CLAT 2025 Result with Score Card",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("Bihar Board Class 10th, 12th Time Table 2025",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("SSC Exam Calendar 2025-2026",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("India Post GDS 5th Merit List / Result",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("SSC CGL 2024 Tier I Result",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("RSMSSB Hostel Superintendent Merit List 2024",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("IB ACIO Technical 2023 Final Result",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("CSIR CASE SO / ASO 2023 Result / Merit List",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("MPESB Sub Engineer & Other Post Result 2024",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("IBPS SO 14th Pre Exam Result 2024",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("NTA NTET 2024 Result / Score Card",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("UPPSC Assistant Town Planner 2023 Final Result",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("Nabard Assistant Manager Phase II Mains Result 2024",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("IOCL Non Executives Result 2024",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("Bihar BPSC 32 Civil Judge Final Result 2024",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("RSMSSB Agriculture Supervisor 2023 Final Result",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size:FontSize*0.6,),
                              title: Text("UPSC Engineering Services 2024 Marks",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("IBPS PO 14th Pre Exam Score Card / Marks",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size: FontSize*0.6),
                              title: Text("IRDAI Assistant Manager Phase I Result 2024",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size:FontSize*0.6),
                              title: Text("CISCE Class 10th, 12th Time Table 2025",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size:FontSize*0.6),
                              title: Text("SSB Constable Tradesman / HC Electrician Result 2024",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
                            child: ListTile(
                              leading: Icon(Icons.circle,size:FontSize*0.6),
                              title: Text("UPSSSC Mukhya Sevika 2022 Mains Exam Result",
                                  style: TextStyle(fontSize: FontSize*1.1)),
                            ),
                          ),
                          InkWell(
                            onTap: () =>  context.go('/result/details'),
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
          fontSize: fontSize * 0.8,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}