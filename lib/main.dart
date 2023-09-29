import 'package:agus/model/courses_model.dart';
import 'package:agus/model/latest_announcements_model.dart';
import 'package:agus/model/latest_assignments_model.dart';
import 'package:agus/model/loading_model.dart';
import 'package:agus/model/login_model.dart';
import 'package:agus/pages/home.dart';
import 'dart:io';
import 'package:agus/pages/loading.dart';
import 'package:agus/pages/login.dart';
import 'package:agus/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoadingModel(),
        ),
        ChangeNotifierProvider(
          create: (context)=>LatestAnnouncementsModel(),
        ),
        ChangeNotifierProvider(
          create: (context)=> LatestAssignmentsModel(),
        )
      ],
      builder: (context, widget) {
        return context.watch<LoadingModel>().doneLoading ?  MaterialApp(
          initialRoute: LoginModel.loginSuccessful ? RouteManager.home : RouteManager.login,
          onGenerateRoute: RouteManager.generateRoute,
          theme: ThemeData.dark().copyWith(
            appBarTheme: AppBarTheme(
              backgroundColor: secondaryColor
            ),
            scaffoldBackgroundColor: primaryColor,

          ),
        ) : LoadingPage(context: context);
      },
    );
  }
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}



// Define the color scheme
final Color secondaryColor = Color(0xFF182223); // WhatsApp green
final Color primaryColor = Color(0xFF0E1214); // WhatsApp teal
final Color backgroundColor = Color(0xFF060606); // WhatsApp dark background
final Color chatBackgroundColor = Color(0xFF19191A); // WhatsApp chat background
final Color accentColor = Color(0xFF25D366); // WhatsApp accent color for buttons
final Color textColor = Colors.white; // Text color for light-colored text

