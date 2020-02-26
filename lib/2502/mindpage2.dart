import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feb/2402/b_icon.dart';

class MindPage2 extends StatefulWidget {
  @override
  _MindPage2State createState() => _MindPage2State();
}

class _MindPage2State extends State<MindPage2> {
  /* Text */
  final String _txt_title = "Good night";
  final String _txt_date = "28 february, 2020";
  final String _txt_activity = "Programmation";

  /* Size */
  final double padding = 16.0;
  final double radius = 16.0;

  /* Color */
  final Color _cltxt = Colors.white;
  final Color _cltxtGreen = Color.fromRGBO(118, 255, 3, 1);
  final Color _cltxtBlue = Color.fromRGBO(0, 47, 108, 1);

  bool _btnState = false;

  /* List */
  final List<String> list_icon = <String>[
    'assets/2502/zenicon.png',
    'assets/2502/moonicon.png',
    'assets/2502/morningicon.png'
  ];
  final List<String> list_programing_name = <String>[
    'Meditation Zen',
    'Bedtime',
    'Getup'
  ];
  final List<String> list_programing_descrip = <String>[
    'In progress',
    'Todo',
    'Early'
  ];

  final List<String> list_programing_time = <String>[
    '10:00 pm',
    '11:00 pm',
    '06:00 am'
  ];

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset('assets/2502/back1.jpg', fit: BoxFit.fill),
        ),

        // Page
        Positioned.fill(
          child: SafeArea(
            top: true,
            left: true,
            right: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Welcome
                Container(
                  margin: EdgeInsets.only(top: padding * 3),
                  padding: EdgeInsets.symmetric(horizontal: padding * 2),
                  height: _height / 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        _txt_title,
                        style: TextStyle(
                          color: _cltxt,
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: padding / 2),
                      Text(
                        _txt_date,
                        style: TextStyle(
                            color: _cltxt,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),

                //Button
                Container(
                  margin: EdgeInsets.only(left: padding * 2, top: padding / 4),
                  height: _height / 12,
                  // color: Colors.white,
                  child: CupertinoSwitch(
                    value: _btnState,
                    onChanged: (bool value) {
                      setState(() {
                        _btnState = value;
                        print(value);
                      });
                    },
                  ),
                ),

                // Programation
                Spacer(),
                Container(
                  margin: EdgeInsets.only(top: padding, left: padding * 2),
                  height: _height / 13,
                  child: Row(
                    children: <Widget>[
                      Text(
                        _txt_activity,
                        style: TextStyle(
                          color: _cltxt,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(left: padding / 2),
                        width: 60.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(radius / 1.5),
                              bottomLeft: Radius.circular(radius / 1.5),
                            ),
                            color: Colors.blue[800]),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.add,
                              size: 24.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      bottom: padding * 5, left: padding * 2, right: padding),
                  height: _height / 4.2,
                  // color: Colors.white,
                  // width: _width*3/4,
                  child: ListView.builder(
                      // padding: EdgeInsets.all(padding),
                      itemCount: list_icon.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin:
                              EdgeInsets.only(bottom: padding, top: padding),
                          child: Row(
                            children: <Widget>[
                              // Icons
                              Stack(
                                children: <Widget>[
                                  Container(
                                    height: _height / 12,
                                    width: _height / 12,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(padding * 2),
                                      color: index != 0
                                          ? _cltxtBlue
                                          : Colors.blue[800],
                                    ),
                                    child: Center(
                                      child: IconCustom(
                                        list_icon[index],
                                        24.0,
                                        Colors.white ,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 4,
                                    right: 5,
                                    child: Container(
                                      height: 10.0,
                                      width: 10.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(radius * 2),
                                        color: _cltxtGreen
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(left: padding),
                                height: _height / 12,
                                width: _width * 2.1 / 3,
                                // color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      '${list_programing_name[index]}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 4.0),
                                    Row(
                                      children: <Widget>[
                                        Text(
                                          '${list_programing_descrip[index]}',
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Spacer(),
                                        Text(
                                          '${list_programing_time[index]}',
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

/* 
  child: Row(
                            children: <Widget>[
                              // Icons
                              Container(
                                height: _height / 12,
                                width: _height / 12,
                                color: Colors.white,
                                child: Placeholder(),
                              ),

                              //Name && time
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    '${list_programing_name[index]}',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        '${list_programing_descrip[index]}',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '${list_programing_time[index]}',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          */
