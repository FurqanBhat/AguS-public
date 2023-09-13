import 'package:agus/model/conversations_model.dart';
import 'package:agus/model/login_model.dart';
import 'package:agus/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/courses_model.dart';
import '../model/loading_model.dart';

class LoadingPage extends StatefulWidget {
  LoadingPage({super.key, required this.context});
  BuildContext context;

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    getToken();
  }
  void getToken() async{
    await LoginModel.loginstart();
    await CoursesModel.fetchCourses();
    await ConversationsModel.getConversations();
    await Future.delayed(Duration(seconds: 1));
    context.read<LoadingModel>().doneLoading=true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logo.png"),
                SizedBox(height: 20,),
                Text(
                  "The Universe is under no obligation to make sense to you.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
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
