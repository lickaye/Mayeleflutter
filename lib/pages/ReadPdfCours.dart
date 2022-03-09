import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ReadPdfCours extends StatefulWidget {
  const ReadPdfCours({Key? key}) : super(key: key);

  @override
  _ReadPdfCoursState createState() => _ReadPdfCoursState();
}

class _ReadPdfCoursState extends State<ReadPdfCours> {
  var data;
  var name_pdf;
  var titre;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        data = ModalRoute.of(context)!.settings.arguments;

        name_pdf = data['pdf'];
        titre = data['titre'];
      });
    });
  }


  @override
  Widget build(BuildContext context) {

  String pdf ="http://app.mobile.cg-mayele.com/uploads/file/cours/30-meplanning-french-final-6146c62510a50611872325.pdf";

    return Scaffold(
      appBar: AppBar(
        title: Text(titre,style: TextStyle(fontFamily: 'Raleway'),),
        elevation: 4,
        shadowColor:const Color(0xFFA2C7F1).withOpacity(0.5),
        backgroundColor: Colors.black,
      ),
        backgroundColor: Colors.black,
        body: Container(
            child: SfPdfViewer.network(
                pdf)));
  }

}
