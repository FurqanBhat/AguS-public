
import 'dart:io';
import 'package:agus/model/course_into_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'package:path_provider/path_provider.dart';

class PdfViewer extends StatefulWidget {
  const PdfViewer({super.key});
  @override
  State<PdfViewer> createState() => _MyAppState();
}

class _MyAppState extends State<PdfViewer> {
  @override
  void initState() {
    super.initState();
    loadPdf();
  }
  @override
  void dispose(){
    try{
      File(pdfFlePath!).delete();
    }
    catch(e){
      print(e.toString());
    }

    super.dispose();

  }
  final sampleUrl = "https://canvas.agu.edu.tr/files/${CoursesInfoModel
      .fileId}/download?download_frd=1&verifier=${CoursesInfoModel
      .fileVerifier}";

  String? pdfFlePath;

  Future<String?> downloadAndSavePDF() async {
    final url = sampleUrl; // Replace with your PDF download URL
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory
          .path}/${CoursesInfoModel.fileName}'; // Adjust the file name as needed
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      return filePath;
    } else {
      throw Exception('Failed to download PDF');
    }
  }

  void loadPdf() async {
    pdfFlePath = (await downloadAndSavePDF())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: (pdfFlePath != null) ?
        Container(
          child: FileViewer(filePath: pdfFlePath!,),
        ) :
        Center(child: CircularProgressIndicator()),
      ),
    );
  }

}
class FileViewer extends StatelessWidget {
  final String filePath;

  FileViewer({required this.filePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Viewer'),
      ),
      body: Center(
        child: _buildFileViewer(filePath),
      ),
    );
  }

  Widget _buildFileViewer(String filePath) {
    if (filePath.endsWith('.pdf')) {
      return PdfView(
        path: filePath,
      );
    }else if(filePath.endsWith('.jpg') || filePath.endsWith('.jpeg') || filePath.endsWith('.png')){
      return Image.file(File(filePath));
    }
    else {
      return Text('Unsupported file type, only pdf/jpg/jpeg/png formats are supported');
    }
  }
}
