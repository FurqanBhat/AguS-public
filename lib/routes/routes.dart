import 'package:agus/pages/help.dart';
import 'package:agus/widgets/announcements.dart';
import 'package:agus/widgets/assignments.dart';
import 'package:agus/widgets/conversations.dart';
import 'package:agus/widgets/courses_info.dart';
import 'package:agus/widgets/discussions.dart';
import 'package:agus/widgets/files_page.dart';
import 'package:agus/widgets/final_exam.dart';
import 'package:agus/widgets/pdf_viewer.dart';
import 'package:agus/widgets/results.dart';
import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/login.dart';
class RouteManager{
  static const String home='/';
  static const String login="login";
  static const String help="help";
  static const String coursesInfo="/coursesInfo";
  static const String filesPage="/coursesInfo/filesPage";
  static const String pdfViewer="/coursesInfo/filesPage/pdfViewer";
  static const String conversations="/drawer/conversations";
  static const String finalExams="/drawer/finalExams";
  static const String assignments="/coursesInfo/assignments";
  static const String results="/coursesInfo/results";
  static const String discussions="/coursesInfo/discussions";
  static const String announcements="/coursesInfo/announcements";



  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case home:
        return MaterialPageRoute(builder: (context)=>Home());
      case login:
        return MaterialPageRoute(builder: (context)=>Login());
      case help:
        return MaterialPageRoute(builder: (context)=>Help());
      case coursesInfo:
        return MaterialPageRoute(builder: (context)=>CoursesInfo());
      case filesPage:
        return MaterialPageRoute(builder: (context)=>FilesPage());
      case assignments:
        return MaterialPageRoute(builder: (context)=>Assignments());
      case results:
        return MaterialPageRoute(builder: (context)=>Results());
      case discussions:
        return MaterialPageRoute(builder: (context)=>Discussions());
      case announcements:
        return MaterialPageRoute(builder: (context)=>Announcements());
      case pdfViewer:
        return MaterialPageRoute(builder: (context)=>PdfViewer());
      case conversations:
        return MaterialPageRoute(builder: (context)=>Conversations());
      case finalExams:
        return MaterialPageRoute(builder: (context)=>FinalExam());
      default:
        throw FormatException();

    }
  }
}