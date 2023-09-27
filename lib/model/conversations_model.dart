import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'login_model.dart';
class ConversationsModel{
  static List<dynamic> conversations=[];
  static Future<void> getConversations() async{
    final response=await get(Uri.parse("https://canvas.agu.edu.tr/api/v1/conversations?access_token=${LoginModel.token}"));
    if(response.statusCode==200){
      try{
        conversations=jsonDecode(response.body);
      }
      catch(e){
        print(e.toString());
      }
    }else{
      print("Error in conversations.dart : error code: "+response.statusCode.toString());
    }
  }
  static late final fullMessage;
  static Future<void> getFullMessage(int id) async{
    final response=await get(Uri.parse("https://canvas.agu.edu.tr/api/v1/conversations/$id?access_token=${LoginModel.token}"));
    if(response.statusCode==200){
      try{
        fullMessage=jsonDecode(response.body);
      }
      catch(e){
        print(e.toString());
      }
    }else{
      print("Error in conversations.dart : error code: "+response.statusCode.toString());
    }


  }
}