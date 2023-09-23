import 'dart:math';

import 'package:agus/model/announcements_model.dart';
import 'package:agus/model/conversations_model.dart';
import 'package:agus/model/latest_announcements_model.dart';
import 'package:agus/model/latest_assignments_model.dart';
import 'package:agus/model/login_model.dart';
import 'package:agus/pages/login.dart';
import 'package:agus/widgets/latest_assignments.dart';
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
    await LatestAnnouncementsModel.fetchLatestAnnouncements();
    await LatestAssignmentsModel.fetchLatestAssignments();
    context.read<LoadingModel>().doneLoading=true;
  }

  @override
  Widget build(BuildContext context) {
    Random random=Random();
    int index=random.nextInt(16);
    List<String> quotes=[
      "Per aspera ad astra.",
      "The purpose of life is finding the largest burden that you can bear and bearing it",
      "The poet only asks to get his head into the heavens. It is the logician who seeks to get the heavens into his head. And it is his head that splits.",
      "I never saw anyone get away with anything, the chickens always came home to roost.",
      "It's only after we've lost everything that we're free to do anything.",
      "It’s a luxury to pursue what makes you happy; it’s a moral obligation to pursue what you find meaningful.",
      "The things we own end up owning us.",
      "Worthlessness is the default condition.",
      "When you have something to say, silence is a lie – and tyranny feeds on lies.",
      "You have some vital role to play in the unfolding destiny of the world. You are, therefore, morally obliged to take care of yourself",
      "I let go. Lost in oblivion. Dark and silent and complete. I found freedom. Losing all hope was freedom.",
      "May I never be complete. May I never be content. May I never be perfect.",
      "Advertising has us chasing cars and clothes, working jobs we hate so we can buy things we don't need.",
      "When you look at the dark side, careful you must be. For the dark side looks back.",
      "If no mistake you have made, losing you are. A different game you should play.",
      "The Universe is under no obligation to make sense to you.",
    ];
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
                  quotes[index],
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
