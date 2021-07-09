import 'package:flutter/material.dart';
import 'package:nccguide/constants.dart';
import 'pdfClass.dart';

class cSubject extends StatefulWidget {
  @override
  _cSubjectState createState() => _cSubjectState();
}

const String _documentPath = 'pdf/CommonSubject.pdf';

class _cSubjectState extends State<cSubject> {
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
          SizedBox(
            height: 30.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Text(
                "Common Subject",
                style: kheaderTS,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10),
            child: Text(
              '''The Document Contains the Practices and Topics which are common to all the wings of NCC, namely Army, Navy and AirForce. It explains about the Organisation, Aims and Objective of NCC. It includes topics like Duties of NCC Cadets, Drill, Personality Development, Disaster Management, National Integration etc.''',
              style: ksimpleTS,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  prepareTestPdf(context,_documentPath).then((path) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FullPdfViewerScreen(path,"Common Subject")),
                    );
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

