import 'package:agus/model/course_into_model.dart';
import 'package:agus/model/files_model.dart';
import 'package:flutter/material.dart';

import '../routes/routes.dart';
class FilesPage extends StatelessWidget {
  const FilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.cyan,
        title: Text("Course Files"),
      ),
      body: ListView.builder(
        itemCount: FilesModel.files.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(FilesModel.files[index]['display_name']),
            leading: Icon(Icons.file_copy, color: Colors.blue,),
            onTap: (){
              CoursesInfoModel.fileId=FilesModel.files[index]['id'];
              CoursesInfoModel.fileVerifier=FilesModel.files[index]['uuid'];
              CoursesInfoModel.fileName=FilesModel.files[index]['display_name'];
              Navigator.of(context).pushNamed(RouteManager.pdfViewer);
            },
          );
        },
      ),
    );
  }
}
