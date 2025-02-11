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
            path: '/details/:examId',
            pageBuilder: (context, state){
              final examId = Uri.decodeComponent(state.pathParameters['examId']!);
              return MaterialPage(child: jobDetails(examId: examId));
            }
        ),
        GoRoute(
            name: 'resultdetails',
            path: '/result/details/:examId',
            pageBuilder: (context, state){
              final examId = Uri.decodeComponent(state.pathParameters['examId']!);
              return MaterialPage(child: jobDetails(examId: examId));
            }
        ),
        GoRoute(
            name: 'latestjobdetails',
            path: '/latestjob/examname/:examId',
            pageBuilder: (context, state){
              final examId = Uri.decodeComponent(state.pathParameters['examId']!);
              return MaterialPage(child: jobDetails(examId: examId));
            }
        ),
        GoRoute(
            name: 'admitcarddetails',
            path: '/admitcard/examname/:examId',
            pageBuilder: (context, state){
              final examId = Uri.decodeComponent(state.pathParameters['examId']!);
              return MaterialPage(child: jobDetails(examId: examId));
            }
        ),
        GoRoute(
            name: 'answerkeydetails',
            path: '/answerkey/examname/:examId',
            pageBuilder: (context, state){
              final examId = Uri.decodeComponent(state.pathParameters['examId']!);
              return MaterialPage(child: jobDetails(examId: examId));
            }
        ),
        GoRoute(
            name: 'syllabusdetails',
            path: '/syllabus/examname/:examId',
            pageBuilder: (context, state){
              final examId = Uri.decodeComponent(state.pathParameters['examId']!);
              return MaterialPage(child: jobDetails(examId: examId));
            }
        ),
        GoRoute(
            name: 'admissiondetails',
            path: '/admission/examname/:examId',
            pageBuilder: (context, state){
              final examId = Uri.decodeComponent(state.pathParameters['examId']!);
              return MaterialPage(child: jobDetails(examId: examId));
            }
        ),
        GoRoute(
            name: 'latestjob',
            path: '/latestjob',
            pageBuilder: (context, state){
              return MaterialPage(child: LatestJobPage());
            }
        ),
        GoRoute(
            name: 'admitcard',
            path: '/admitcard',
            pageBuilder: (context, state){
              return MaterialPage(child: AdmitPage());
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
              return MaterialPage(child: AnswerKeyPage());
            }
        ),
        GoRoute(
            name: 'syllabus',
            path: '/syllabus',
            pageBuilder: (context, state){
              return MaterialPage(child: SyllabusPage());
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
