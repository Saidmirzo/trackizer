import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

import './const.dart';

class TrackizerPage extends StatelessWidget {
  const TrackizerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool press = true;
    //var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff1C1C23),
      //---------------------------------------------------------

      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xff1C1C23),
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.calendar_month, size: 30),
          Icon(Icons.card_giftcard, size: 30),
        ],
        onTap: (index) {},
      ),

      //----------------------------------------------------------
      appBar: AppBar(
        elevation: 0,
        actions: const [Icon(Icons.settings)],
        backgroundColor: const Color(0xff353542),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: width,
                height: 400,
                //color:Colors.blue,
                decoration: const BoxDecoration(
                  color: Color(0xff353542),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(30),
                      child: const SimpleCircularProgressBar(
                        startAngle: 220,
                        progressStrokeWidth: 10,
                        backStrokeWidth: 10,
                        maxValue: 70,
                        size: 50,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          list_btn(
                              'Active suns', '12', const Color(0xffFFA699)),
                          list_btn(
                              'Active suns', '12', const Color(0xffAD7BFF)),
                          list_btn(
                              'Active suns', '12', const Color(0xff7DFFEE)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                height: 50,
                width: 350,
                decoration: BoxDecoration(
                  color: Color(0xff0E0E12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 33,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:
                            press ? const Color(0xff1B1B22) : const Color(0xff0E0E12),
                      ),
                      child: TextButton(
                        onPressed: () {
                          press = false;
                        },
                        child: Text(
                          'Your subscriptions',
                          style: sTextStyle(color: Colors.white, size: 14),
                        ),
                      ),
                    ),
                    Container(
                      height: 33,
                      width: 160,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: press ? const Color(0xff1B1B22) : const Color(0xff0E0E12),
                      ),
                      child: TextButton(
                        onPressed: () {
                          press = true;
                        },
                        child: Text(
                          'Upcoming bills',
                          style: sTextStyle(color: Colors.white, size: 14),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              list_app('assets/logo_spotify.png', 'Spotfy', '\$5.99'),
              list_app('assets/logo_yt.png', 'YouTube Premium', '\$18.99'),
              list_app(
                  'assets/logo_onedrive.png', 'Microsoft OneDrive', '\$29.99'),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container list_app(String icon, String text, String price) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(top: 10),
      height: 80,
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white10, width: 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Image.asset(
          icon,
          height: 50,
        ),
        title: Text(
          text,
          style: sTextStyle(
            size: 16,
            color: Colors.white,
          ),
        ),
        trailing: Text(
          price,
          style: sTextStyle(
            size: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Padding list_btn(String text, String num, Color topLinerColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        width: 104,
        height: 70,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 7),
              child: Container(
                // color: Colors.black,
                width: 104,
                height: 68,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(78, 78, 97, 0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: [
                        Text(
                          text,
                          style: sTextStyle(
                              color: const Color(
                                0xff83839C,
                              ),
                              size: 12),
                        ),
                        Text(
                          num,
                          style: sTextStyle(
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Divider(
                  color: topLinerColor,
                  thickness: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
