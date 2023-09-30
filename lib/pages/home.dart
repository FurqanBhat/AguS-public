import 'package:agus/main.dart';
import 'package:agus/model/login_model.dart';
import 'package:agus/widgets/courses_widget.dart';
import 'package:flutter/material.dart';

import '../routes/routes.dart';
import '../widgets/latest_announcements.dart';
import '../widgets/latest_assignments.dart';

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          leading: ElevatedButton(
            onPressed: (){},
            child: Image.asset('assets/logo.png'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              backgroundColor: Colors.blueGrey[900],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: (){
                scaffoldKey.currentState?.openEndDrawer();
              },
            ),

          ],
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text('Active \nCourses', textAlign: TextAlign.center,),
              ),
              Tab(
                child: Text('Latest \nAnnouces.', textAlign: TextAlign.center,),
              ),
              Tab(
                child: Text('Upcoming \nAssignments', textAlign: TextAlign.center,),
              ),

            ],


          ),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.grey,
          ),
          foregroundColor: Colors.grey,
          title: Text("Agu-S"),
        ),
        endDrawer: Drawer(
          backgroundColor: secondaryColor,
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
                      scaffoldKey.currentState?.closeEndDrawer();
                      Navigator.of(context).pushNamed(RouteManager.conversations);
                    },
                    ),
                    DrawerTile(title: "Calendar Events", icon:Icon(Icons.calendar_month),
                      onTap: (){
                        scaffoldKey.currentState?.closeEndDrawer();
                        Navigator.of(context).pushNamed(RouteManager.calendar);
                      },
                    ),
                    DrawerTile(title: "LogOut", icon:Icon(Icons.logout),
                      onTap: (){
                        scaffoldKey.currentState?.closeEndDrawer();
                        LoginModel.logOut();
                        Navigator.of(context).pushNamed(RouteManager.login);
                      },
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CoursesWidget(),
            LatestAnnouncements(),
            LatestAssignments(),
          ],
        ),
      ),
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
      iconColor: Colors.grey,
      onTap: onTap,
    );
  }
}
