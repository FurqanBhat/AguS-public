import 'package:agus/model/courses_model.dart';
import 'package:agus/model/loading_model.dart';
import 'package:agus/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agus/model/latest_announcements_model.dart';
import 'package:agus/model/latest_assignments_model.dart';
import '../model/conversations_model.dart';
import '../model/login_model.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool progressBar=false;
  TextEditingController loginController=TextEditingController();
  @override
  void initState() {
    super.initState();
    loginController.text="";
  }
  @override
  void dispose() {
    loginController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children:[
              progressBar ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.red,
                ),
              ): Container(),
              Column(
              children: [
                SizedBox(height: 80,),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/loginIcon.png"),
                  radius: 80,
                ),
                SizedBox(height: 10,),
                Text(
                  "Canvas Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                  ),

                  ),
                  SizedBox(height: 20,),
                  TextField(
                    controller: loginController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        )
                      ),
                      icon: Icon(Icons.token),
                      labelText: "Enter Canvas Token",

                    ),

                  ),
                  SizedBox(height: 30,),

                  ElevatedButton(
                    onPressed: () async{
                      LoginModel.setData(loginController.text);
                      setState(() {
                        progressBar=true;
                      });
                      FocusScope.of(context).unfocus();
                      await CoursesModel.fetchCourses();
                      if(CoursesModel.requestSuccess){
                        LoginModel.setLoginSuccessful();
                        await LoginModel.loginstart();
                        await ConversationsModel.getConversations();
                        await LatestAnnouncementsModel.fetchLatestAnnouncements();
                        await LatestAssignmentsModel.fetchLatestAssignments();
                        Navigator.of(context).pushReplacementNamed(RouteManager.home);
                      }else{
                        showBottomSheet(
                            context: context,
                            builder: (context)=>Text("Wrong token"),
                        );
                      }
                      setState(() {
                        progressBar=false;
                      });


                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),

                      )
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.grey[900],
                        fontWeight: FontWeight.w400,
                      ),

                    ),
                  ),
                  SizedBox(height: 70,),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      surfaceTintColor: Colors.white,
                    ),
                    onPressed: (){
                      print("help");
                      Navigator.of(context).pushNamed(RouteManager.help);
                    },
                    child: Text(
                      "Help",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
        ]
          ),
          ),
        ),
    );
  }
}
