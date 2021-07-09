import 'package:flutter/material.dart';
import 'package:nccguide/constants.dart';
import 'pdfClass.dart';

class redBook extends StatefulWidget {
  @override
  _redBookState createState() => _redBookState();
}

const String _documentPath = 'pdf/RB.pdf';

class _redBookState extends State<redBook> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Document",
          style:
              ksimpleTS.copyWith(fontSize: 25.0, fontWeight: FontWeight.w800),
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
                "Red Book",
                style: kheaderTS,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 10),
            child: Text(
              '''Red Book is an important document for all the cadets of NCC. It lays down guidelines and rules to be followed in Various Camps, which are essential part of the Training.
              
Volume I of Standing Instructions lays down the detailed organization of RD Camp, norms of administration and details of training to be carried out during RD Camp. The duties of NCC Directorates, Camp Appointments, Officers & Cadets has been worked out based on the experience and good practices.

Volume II of Standing Instructions lays down detailed rules for conduct of all Inter Directorate Competitions in NCC.''',
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
                          builder: (context) => FullPdfViewerScreen(path,"Red Book")),
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
