import 'package:agus/model/results_model.dart';
import 'package:flutter/material.dart';
class Results extends StatelessWidget {
  const Results({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Results"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: ResultsModel.results.length,
          itemBuilder: (context, index){
            return ListTile(
              leading: Icon(Icons.grade_rounded, color: Colors.blueGrey[400],),
              title: Text(ResultsModel.results[index]["assignment"]["name"]),
              trailing: Text("${ResultsModel.results[index]["score"]}/${ResultsModel.results[index]["assignment"]["points_possible"]}"),
              leadingAndTrailingTextStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16
              ),
            );
          },

        ),
      ),
    );
  }
}
