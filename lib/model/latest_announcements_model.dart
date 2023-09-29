import 'dart:convert';

import 'package:agus/model/courses_model.dart';
import 'package:agus/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class LatestAnnouncementsModel extends ChangeNotifier{
  bool finished=false;
  String str="";
  List<dynamic> latestAnnouncements=[];
  void getCodes(){  // it stores all codes in one string as per requirement, like this https://<canvas>/api/v1/announcements?context_codes[]=course_1&context_codes[]=course_2
    for(final course in CoursesModel.courses){
      str+="context_codes[]=course_${course['id']}&";
    }
  }
  LatestAnnouncementsModel(){
    getCodes();
    fetchLatestAnnouncements();
    notifyListeners();
  }
  Future<void> fetchLatestAnnouncements() async{
    getCodes();
    final response=await get(Uri.parse('https://canvas.agu.edu.tr/api/v1/announcements?per_page=50&${str}latest_only=true&access_token=${LoginModel.token}'));
    if(response.statusCode==200){
      try{
        latestAnnouncements=jsonDecode(response.body);
        finished=true;
        notifyListeners();
      }catch(e){
        print(e.toString());
      }
    }else{
      print("error in announcements_model, error code : ${response.statusCode}");
    }
  }
}