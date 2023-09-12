import 'dart:convert';

import 'package:agus/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../routes/routes.dart';
class CoursesModel with ChangeNotifier{
  static bool requestSuccess=false;
  CoursesModel(){
    fetchCourses();
  }
  List<dynamic> courses=[];
  Future<void> fetchCourses() async{
    final response= await get(Uri.parse("https://canvas.agu.edu.tr/api/v1/courses?per_page=50&access_token=${LoginModel.token}"));
    if(response.statusCode==200){
      requestSuccess=true;
      try{
        courses=jsonDecode(response.body);
        setCourses();
        print(courses.length);
      }
      catch(e){
        print(e.toString() +"my error");
      }

      notifyListeners();
    }else{
      print(response.statusCode);
    }

  }

  void setCourses() {
    DateTime now=DateTime.now();
    print(now);
    int currMonth=now.month;
    int currYear=now.year;
    List temp=[];
    temp.addAll(courses);
    for(final course in courses){
      String date_created=course["start_at"];
      int yearCreated=int.parse(date_created.substring(0,4));
      int monthCreated=int.parse(date_created.substring(5,7));
      if(currYear==yearCreated && (currMonth-monthCreated)>8){
        temp.remove(course);
      }else if((currYear-yearCreated)==1 &&  (monthCreated-currMonth)<7){
        temp.remove(course);
      }else if((currYear-yearCreated)>1){
        temp.remove(course);
      }
    }
    courses=temp;
  }
}