import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nccguide/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'data.dart';
import 'dart:math';
import 'workout.dart';

class menuPage extends StatefulWidget {
  @override
  _menuPageState createState() => _menuPageState();
}

int num;

var cAR1 = 12.0 / 16.0;
var wAR1 = cAR1 * 1.2;


class _menuPageState extends State<menuPage> {

  double currentPage = images.length - 1.0;
  PageController controller = PageController(initialPage: images.length - 1);

  Future<void> _launched;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF081018),
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: IconButton(
            icon: Icon(
              Icons.share,
              color: Color(0xFFFFFFFF),
              size: 30.0,
            ),
            onPressed: () {
              print('lol');
            },
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: IconButton(
              icon: Icon(
                Icons.music_note,
                color: Color(0xFFFFFFFF),
                size: 30.0,
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'nccSong');
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 25.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Guide',
                  style: kheaderTS,
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, top: 5.0),
                child: Text(
                  'Select an option',
                  style: ksimpleTS.copyWith(fontSize: 20.0),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                Timer(Duration(milliseconds: 500),
                    () => Navigator.pushNamed(context, 'guide$num'));
              },
              child: Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage, cAR1, wAR1),
                  Positioned.fill(
                    child: PageView.builder(
                        itemCount: images.length,
                        controller: controller,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return Container();
                        }),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: kheaderPad,
                child: Text(
                  'NCC',
                  style: kheaderTS,
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0, right: 10.0),
                child: Text(
                  '''
National Cadet Corps is a Tri-Services Organisation, comprising the Army, Navy and Air Wing, engaged in grooming the youth of the country into disciplined and patriotic citizens. The National Cadet Corps was formed by the National Cadet Corps Act of 1948 and is world's larget voluntary uniformed organisation which recruits cadets from high schools, higher secondary, colleges and universities all over India. NCC helps in attaining physical fitness and improves personality. The Cadets are given basic military training in small arms and parades.
              ''',
                  style: ksimpleTS,
                ),
              ),
            ),
            Padding(
              padding: kheaderPad,
              child: Text(
                'Adventure Activities',
                style: kheaderTS.copyWith(letterSpacing: 2.0),
              ),
            ),
            demo(),
            Padding(
              padding: const EdgeInsets.only(right: 10.0,top: 15.0,bottom: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                    Text(
                      "Visit NCC India Website",
                      style: ksimpleTS.copyWith(fontWeight: FontWeight.w600, fontSize: 22.0),
                    ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_forward_ios,
                    ),
                    onPressed: () => setState(() {
                      _launched = _launchInBrowser('https://indiancc.nic.in/');
                    }),
                  ),
                ],
              ),
            ),
            Text(
              'Unity and Discipline',
              style: kheaderTS.copyWith(fontSize: 25.0, letterSpacing: 2.0),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: Image.asset(
          'images/strip.png',
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  double currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;
  var cardAspectRatio;
  var widgetAspectRatio;

  CardScrollWidget(
      this.currentPage, this.cardAspectRatio, this.widgetAspectRatio);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;
          num = currentPage.toInt();

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              child: Text(title[i],
                                  style: TextStyle(
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: Offset(2.0, 2.0),
                                          blurRadius: 3.0,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ],
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 2.0,
                                      fontFamily: "Simplifica")),
                            ),
                            SizedBox(
                              height: 20.0,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
