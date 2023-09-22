import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class FinalExam extends StatefulWidget {
  const FinalExam({super.key});

  @override
  State<FinalExam> createState() => _FinalExamState();
}

class _FinalExamState extends State<FinalExam> {
  late final controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller=WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse("https://uis.agu.edu.tr/buis/general/coursefinalprogram.aspx"));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Final EXAM")),
      body: WebViewWidget(controller: controller,),
    );
  }
}
