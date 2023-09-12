import 'package:agus/model/courses_model.dart';
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
      ],
      builder: (context, widget) {
        return context.watch<LoadingModel>().doneLoading ?  MaterialApp(
          initialRoute: LoginModel.loginSuccessful ? RouteManager.home : RouteManager.login,
          onGenerateRoute: RouteManager.generateRoute,
          theme: ThemeData.dark()
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