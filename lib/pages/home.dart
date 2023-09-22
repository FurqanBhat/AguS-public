import 'package:agus/main.dart';
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
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              backgroundColor: secondaryColor,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: (){
                scaffoldKey.currentState?.openEndDrawer();
              },
            )
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Latest Announcements',
              ),
              Tab(
                text: 'Upcoming Assignments',
              ),
              Tab(
                text: 'Courses',
              ),

            ],


          ),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.grey,
          ),
          foregroundColor: Colors.grey,
          title: Text("AguS"),
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
                    DrawerTile(title: "Final Exams", icon: Icon(Icons.schedule),
                    onTap: (){
                      scaffoldKey.currentState?.closeEndDrawer();
                      Navigator.of(context).pushNamed(RouteManager.finalExams);
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
            LatestAnnouncements(),
            LatestAssignments(),
            CoursesWidget(),
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
