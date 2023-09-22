import 'dart:convert';

import 'package:agus/model/course_info_model.dart';
import 'package:agus/model/login_model.dart';
import 'package:http/http.dart';

class DiscussionModel{
  static List<dynamic> discussions=[];
  static Future<void> getDiscussions() async{
    final response=await get(Uri.parse('https://canvas.agu.edu.tr/api/v1/courses/${CoursesInfoModel.courseCode}/discussion_topics?per_page=50&access_token=${LoginModel.token}'));
    if(response.statusCode==200){
      try{
        discussions=jsonDecode(response.body);
      }catch(e){
        print(e.toString());
      }
    }else{
      print("error in results_model, error code: ${response.statusCode}");
    }
  }
}