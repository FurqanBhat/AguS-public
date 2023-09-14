import 'dart:convert';

import 'package:agus/model/courses_model.dart';
import 'package:agus/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
class AnnouncementsModel{
  static String str="";
  static List<dynamic> announcements=[];
  static void getCodes(){  // it stores all codes in one string as per requirement, like this https://<canvas>/api/v1/announcements?context_codes[]=course_1&context_codes[]=course_2
    for(final course in CoursesModel.courses){
      str+="context_codes[]=course_${course['id']}&";
    }
  }
  static Future<void> fetchAnnouncements() async{
    getCodes();
    final response=await get(Uri.parse('https://canvas.agu.edu.tr/api/v1/announcements?per_page=50&${str}latest_only=true&access_token=${LoginModel.token}'));
    if(response.statusCode==200){
      try{
        announcements=jsonDecode(response.body);
      }catch(e){
        print(e.toString());
      }
    }else{
      print("error in announcements_model, error code : ${response.statusCode}");
    }
  }
}