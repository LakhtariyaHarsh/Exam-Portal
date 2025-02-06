import 'package:exam_portal/pages/contactus.dart';
import 'package:exam_portal/pages/result.dart';
import 'package:exam_portal/pages/search.dart';
import 'package:exam_portal/pages/syllabus.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'pages/admission.dart';
import 'pages/admit.dart';
import 'pages/answerkey.dart';
import 'details_page.dart';
import 'homepage.dart';
import 'pages/latestjob.dart';

  GoRouter router = GoRouter(
      routes: [
        GoRoute(
            name: 'home',
            path: '/',
            pageBuilder: (context, state){
              return MaterialPage(child: MyPage());
            }
        ),
        GoRoute(
            name: 'result',
            path: '/result',
            pageBuilder: (context, state){
              return MaterialPage(child: resultpage());
            }
        ),
        GoRoute(
            name: 'details',
            path: '/details',
            pageBuilder: (context, state){
              return MaterialPage(child: jobDetails());
            }
        ),
        GoRoute(
            name: 'resultdetails',
            path: '/result/details',
            pageBuilder: (context, state){
              return MaterialPage(child: jobDetails());
            }
        ),
        GoRoute(
            name: 'latestjobdetails',
            path: '/latestjob/examname',
            pageBuilder: (context, state){
              return MaterialPage(child: jobDetails());
            }
        ),
        GoRoute(
            name: 'admitcarddetails',
            path: '/admitcard/examname',
            pageBuilder: (context, state){
              return MaterialPage(child: jobDetails());
            }
        ),
        GoRoute(
            name: 'answerkeydetails',
            path: '/answerkey/examname',
            pageBuilder: (context, state){
              return MaterialPage(child: jobDetails());
            }
        ),
        GoRoute(
            name: 'syllabusdetails',
            path: '/syllabus/examname',
            pageBuilder: (context, state){
              return MaterialPage(child: jobDetails());
            }
        ),
        GoRoute(
            name: 'admissiondetails',
            path: '/admission/examname',
            pageBuilder: (context, state){
              return MaterialPage(child: jobDetails());
            }
        ),
        GoRoute(
            name: 'latestjob',
            path: '/latestjob',
            pageBuilder: (context, state){
              return MaterialPage(child: latestjobPage());
            }
        ),
        GoRoute(
            name: 'admitcard',
            path: '/admitcard',
            pageBuilder: (context, state){
              return MaterialPage(child: admitCardPage());
            }
        ),
        GoRoute(
            name: 'admission',
            path: '/admission',
            pageBuilder: (context, state){
              return MaterialPage(child: admissionPage());
            }
        ),
        GoRoute(
            name: 'search',
            path: '/search',
            pageBuilder: (context, state){
              return MaterialPage(child: searchPage());
            }
        ),
        GoRoute(
            name: 'answerkey',
            path: '/answerkey',
            pageBuilder: (context, state){
              return MaterialPage(child: answerKeyPage());
            }
        ),
        GoRoute(
            name: 'syllabus',
            path: '/syllabus',
            pageBuilder: (context, state){
              return MaterialPage(child: syllabusPage());
            }
        ),
        GoRoute(
            name: 'contactus',
            path: '/contactus',
            pageBuilder: (context, state){
              return MaterialPage(child: contactUsPage());
            }
        ),

      ]

  );
