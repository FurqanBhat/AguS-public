import 'package:agus/main.dart';
import 'package:agus/model/assignments_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
class Assignments extends StatelessWidget {
  const Assignments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assignments"),
      ),
      body: ListView.builder(
        itemCount: AssignmentsModel.assignments.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              title: Text(AssignmentsModel.assignments[index]["name"],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              )
              ),
              subtitle: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Html(
                  data: AssignmentsModel.assignments[index]["description"],
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}
