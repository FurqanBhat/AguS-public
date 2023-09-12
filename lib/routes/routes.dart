import 'package:agus/widgets/conversations.dart';
import 'package:agus/widgets/courses_info.dart';
import 'package:agus/widgets/files_page.dart';
import 'package:agus/widgets/final_exams.dart';
import 'package:agus/widgets/pdf_viewer.dart';
import 'package:flutter/material.dart';
import '../pages/home.dart';
import '../pages/login.dart';
class RouteManager{
  static const String home='/';
  static const String login="login";
  static const String coursesInfo="/coursesInfo";
  static const String filesPage="/coursesInfo/filesPage";
  static const String pdfViewer="/coursesInfo/filesPage/pdfViewer";
  static const String conversations="/drawer/conversations";

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch(settings.name){
      case home:
        return MaterialPageRoute(builder: (context)=>Home());
      case login:
        return MaterialPageRoute(builder: (context)=>Login());
      case coursesInfo:
        return MaterialPageRoute(builder: (context)=>CoursesInfo());
      case filesPage:
        return MaterialPageRoute(builder: (context)=>FilesPage());
      case pdfViewer:
        return MaterialPageRoute(builder: (context)=>PdfViewer());
      case conversations:
        return MaterialPageRoute(builder: (context)=>Conversations());
      default:
        throw FormatException();

    }
  }
}