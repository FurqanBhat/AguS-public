import 'package:agus/model/courses_model.dart';
import 'package:agus/widgets/courses_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes/routes.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> scaffoldKey=GlobalKey();
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
          color: Colors.cyan,
        ),
        foregroundColor: Colors.cyan,
        title: Text("AguS"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Image(
                image: AssetImage("assets/logo.png"),
                height: 120,
                width: 100,
              )
            ),
            Expanded(
              child: Column(
                children: [
                  DrawerTile(title: "Messages", icon:Icon(Icons.message),
                    onTap: (){
                    scaffoldKey.currentState?.closeDrawer();
                    Navigator.of(context).pushNamed(RouteManager.conversations);
                  },
                  ),
                  DrawerTile(title: "Final Exams", icon: Icon(Icons.schedule),
                  onTap: (){
                    scaffoldKey.currentState?.closeDrawer();
                    Navigator.of(context).pushNamed(RouteManager.finalExams);
                  },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: CoursesWidget(),
    );
  }
}

class DrawerTile extends StatelessWidget {
  DrawerTile({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });
  String title;
  Icon icon;
  final onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      titleTextStyle: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600
      ),
      leading: icon,
      iconColor: Colors.red,
      onTap: onTap,
    );
  }
}
