import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class FinalExam extends StatelessWidget {
  const FinalExam({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=WebViewController()
    ..setJavaScriptMode(JavaScriptMode.disabled)
    ..loadRequest(Uri.parse("https://uis.agu.edu.tr/buis/general/coursefinalprogram.aspx"));
    return Scaffold(
      appBar: AppBar(title: Text("Final EXAM")),
      body: WebViewWidget(controller: controller,),
    );
  }
}
