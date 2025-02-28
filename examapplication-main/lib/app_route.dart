import 'package:exam_portal/pages/CertificateVerification.dart';
import 'package:exam_portal/pages/contactus.dart';
import 'package:exam_portal/pages/important.dart';
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

GoRouter router = GoRouter(routes: [
  GoRoute(
      name: 'home',
      path: '/',
      pageBuilder: (context, state) {
        return MaterialPage(child: MyPage());
      }),
  GoRoute(
      name: 'result',
      path: '/result',
      pageBuilder: (context, state) {
        return MaterialPage(child: resultpage());
      }),
  GoRoute(
      name: 'details',
      path: '/details/:examName',
      builder: (context, state) {
        final examName = Uri.decodeComponent(state.pathParameters['examName']!);
        // Retrieve examId from the extra property instead of the URL
        final examId = state.extra as String;
        return jobDetails(
          examId: examId,
          examName: examName,
        );
      }),
  GoRoute(
      name: 'resultdetails',
      path: '/result/details/:examName',
      builder: (context, state) {
        final examName = Uri.decodeComponent(state.pathParameters['examName']!);
        // Retrieve examId from the extra property instead of the URL
        final examId = state.extra as String;
        return jobDetails(
          examId: examId,
          examName: examName,
        );
      }),
  GoRoute(
      name: 'latestjobdetails',
      path: '/latestjob/examname/:examName',
      builder: (context, state) {
        final examName = Uri.decodeComponent(state.pathParameters['examName']!);
        // Retrieve examId from the extra property instead of the URL
        final examId = state.extra as String;
        return jobDetails(
          examId: examId,
          examName: examName,
        );
      }),
  GoRoute(
      name: 'admitcarddetails',
      path: '/admitcard/examname/:examName',
      builder: (context, state) {
        final examName = Uri.decodeComponent(state.pathParameters['examName']!);
        // Retrieve examId from the extra property instead of the URL
        final examId = state.extra as String;
        return jobDetails(
          examId: examId,
          examName: examName,
        );
      }),
  GoRoute(
      name: 'answerkeydetails',
      path: '/answerkey/examname/:examName',
      builder: (context, state) {
        final examName = Uri.decodeComponent(state.pathParameters['examName']!);
        // Retrieve examId from the extra property instead of the URL
        final examId = state.extra as String;
        return jobDetails(
          examId: examId,
          examName: examName,
        );
      }),
  GoRoute(
      name: 'syllabusdetails',
      path: '/syllabus/examname/:examName',
      builder: (context, state) {
        final examName = Uri.decodeComponent(state.pathParameters['examName']!);
        // Retrieve examId from the extra property instead of the URL
        final examId = state.extra as String;
        return jobDetails(
          examId: examId,
          examName: examName,
        );
      }),
  GoRoute(
      name: 'CertificateVerificationexam',
      path: '/certificateverificationexam/examname/:examName',
      builder: (context, state) {
        final examName = Uri.decodeComponent(state.pathParameters['examName']!);
        // Retrieve examId from the extra property instead of the URL
        final examId = state.extra as String;
        return jobDetails(
          examId: examId,
          examName: examName,
        );
      }),
  GoRoute(
      name: 'Importantexam',
      path: '/importantexam/examname/:examName',
      builder: (context, state) {
        final examName = Uri.decodeComponent(state.pathParameters['examName']!);
        // Retrieve examId from the extra property instead of the URL
        final examId = state.extra as String;
        return jobDetails(
          examId: examId,
          examName: examName,
        );
      }),
  GoRoute(
      name: 'admissiondetails',
      path: '/admission/examname/:examName',
      builder: (context, state) {
        final examName = Uri.decodeComponent(state.pathParameters['examName']!);
        // Retrieve examId from the extra property instead of the URL
        final examId = state.extra as String;
        return jobDetails(
          examId: examId,
          examName: examName,
        );
      }),
  GoRoute(
      name: 'latestjob',
      path: '/latestjob',
      pageBuilder: (context, state) {
        return MaterialPage(child: LatestJobPage());
      }),
  GoRoute(
      name: 'admitcard',
      path: '/admitcard',
      pageBuilder: (context, state) {
        return MaterialPage(child: AdmitPage());
      }),
  GoRoute(
      name: 'admission',
      path: '/admission',
      pageBuilder: (context, state) {
        return MaterialPage(child: admissionPage());
      }),
  GoRoute(
      name: 'search',
      path: '/search',
      pageBuilder: (context, state) {
        return MaterialPage(child: searchPage());
      }),
  GoRoute(
      name: 'answerkey',
      path: '/answerkey',
      pageBuilder: (context, state) {
        return MaterialPage(child: AnswerKeyPage());
      }),
  GoRoute(
      name: 'syllabus',
      path: '/syllabus',
      pageBuilder: (context, state) {
        return MaterialPage(child: SyllabusPage());
      }),
  GoRoute(
      name: 'CertificateVerification',
      path: '/certificateverification',
      pageBuilder: (context, state) {
        return MaterialPage(child: CertificateVerificationPage());
      }),
  GoRoute(
      name: 'Important',
      path: '/important',
      pageBuilder: (context, state) {
        return MaterialPage(child: ImportantExamPage());
      }),
  GoRoute(
      name: 'contactus',
      path: '/contactus',
      pageBuilder: (context, state) {
        return MaterialPage(child: contactUsPage());
      }),
]);
