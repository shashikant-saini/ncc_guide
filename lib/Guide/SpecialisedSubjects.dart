import 'package:flutter/material.dart';
import 'pdfClass.dart';
import 'package:nccguide/constants.dart';


class sSubjects extends StatefulWidget {
  @override
  _sSubjectsState createState() => _sSubjectsState();
}

String _documentPath = '';

class _sSubjectsState extends State<sSubjects> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Document",
          style: kappBarTS,
        ),
      ),
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "Specialised Subjects",
                style: kheaderTS,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10),
            child: Text(
              '''Specialised Subjects are exclusive to each wing of NCC. It Documents about training given to Army, Navy and AirForce Cadets''',
              style: ksimpleTS,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 20.0,top: 30.0),
                child: Text(
                  "Army",
                  style: kappBarTS,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Color(0xFFEF1C25),
                  onPressed: () {
                    setState(() {
                      _documentPath = "pdf/Army.pdf";
                    });
                    prepareTestPdf(context,_documentPath).then((path) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FullPdfViewerScreen(path, "Army")));
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 20.0),
                child: Text(
                  "Navy",
                  style: kappBarTS,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Color(0xFF2D3092),
                  onPressed: () {
                    setState(() {
                      _documentPath = "pdf/RB.pdf";
                    });
                    prepareTestPdf(context,_documentPath).then((path) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FullPdfViewerScreen(path, "Navy")));
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30.0, bottom: 20.0),
                child: Text(
                  "Air Force",
                  style: kappBarTS,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  color: Color(0xFF00AEEF),
                  onPressed: () {
                    setState(() {
                      _documentPath = "pdf/AirForce.pdf";
                    });
                    prepareTestPdf(context,_documentPath).then((path) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FullPdfViewerScreen(path, "Air Force")));
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


