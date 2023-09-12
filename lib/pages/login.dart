import 'package:agus/model/courses_model.dart';
import 'package:agus/model/loading_model.dart';
import 'package:agus/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/login_model.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          child: Column(
            children: [
              SizedBox(height: 100,),
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
                  await CoursesModel();
                  if(CoursesModel.requestSuccess){
                    LoginModel.setLoginSuccessful();
                    Navigator.of(context).pushReplacementNamed(RouteManager.home);
                  }else{
                    showBottomSheet(
                        context: context,
                        builder: (context)=>Text("Wrong token"),
                    );
                  }

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
                onPressed: (){},
                child: Text(
                  "Continue without login",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
