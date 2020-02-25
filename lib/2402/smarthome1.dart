import 'package:flutter/material.dart';
import 'package:flutter_feb/2402/b_icon.dart';
import 'package:flutter_feb/2402/smarthome4.dart';
import 'package:flutter_feb/2402/smarthome2.dart';
import 'package:flutter_feb/2402/smarthome3.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class B_SmartHome extends StatefulWidget {
  @override
  _B_SmartHomeState createState() => _B_SmartHomeState();
}

class _B_SmartHomeState extends State<B_SmartHome> {
  /* List */
  final List<String> room = <String>[
    'Living room',
    'Bedroom',
    "Kitchen",
    "Bathroom"
  ];

  /* Color */
  final _sensorContaier = Colors.black87.withOpacity(0.6);
  final Color iconColor = Colors.white;

  /* String */
  final String _name1 = "Ceiling\nFans";
  final String _temp = "23°C";
  final String _humi = "47%";
  final String _light = "50%";

  /* Image */
  String _profileImage =
      "https://avatars1.githubusercontent.com/u/51372227?s=460&v=4";

  /* Size */
  final double padding = 16.0;
  final double radius = 16.0;

  @override
  Widget build(BuildContext context) {
    /* Size screen*/
    final double _width = MediaQuery.of(context).size.width;
    final double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Stack(
        children: <Widget>[
          // Background Color
          Positioned.fill(
            child: Image.asset(
              "assets/2402/back1.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Padding(
                padding: EdgeInsets.only(
                    top: padding / 2, right: padding, left: padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //App bar
                    Container(
                      // color: Colors.red,
                      height: 40.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.dashboard,
                            size: 28.0,
                            color: Colors.white70,
                          ),
                          Spacer(),
                          Container(
                            height: 32.0,
                            width: 32.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(_profileImage),
                                  fit: BoxFit.cover,
                                )),
                          )
                        ],
                      ),
                    ),

                    //Name room
                    // Spacer(),
                    Container(
                        margin: EdgeInsets.only(top: padding),
                        height: 60.0,
                        // color: Colors.blue,
                        child: ListView.builder(
                          itemCount: room.length,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                          itemBuilder: (BuildContext context, int i) {
                            return Container(
                              margin: EdgeInsets.only(right: padding),
                              width: _width * 3 / 5,
                              child: Text(
                                "${room[i]}",
                                style: TextStyle(
                                  color: i == 0 ? Colors.white : Colors.grey,
                                  fontSize: 32.0,
                                  // letterSpacing: 0.8,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            );
                          },
                        )),

                    //Value sensor
                    // Spacer(),
                    Container(
                      margin: EdgeInsets.only(
                          top: padding * 1.5, right: 4.0, left: 4.0),
                      height: 60.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          color: _sensorContaier),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          // Temp
                          SensorValue(
                            width: _width,
                            iconColor: iconColor,
                            imgIcon: "temp.png",
                            value: _temp,
                            namevalue: "TEMP",
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: padding / 2, bottom: padding / 2),
                            width: 2.0,
                            color: Colors.grey[600],
                          ),
                          SensorValue(
                            width: _width,
                            iconColor: iconColor,
                            imgIcon: "humidity.png",
                            value: _humi,
                            namevalue: "HUMUDITY",
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: padding / 2, bottom: padding / 2),
                            width: 2.0,
                            color: Colors.grey[600],
                          ),
                          SensorValue(
                            width: _width,
                            iconColor: iconColor,
                            imgIcon: "light.png",
                            value: _light,
                            namevalue: "LIGHT",
                          ),
                        ],
                      ),
                    ),
                    //GribView
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: padding * 2,
                        right: padding,
                        left: padding,
                      ),
                      height: _width / 1.2,
                      // color: Colors.red,
                      child: Center(
                        child: GridView.count(
                          crossAxisSpacing: padding,
                          mainAxisSpacing: padding,
                          crossAxisCount: 2,
                          scrollDirection: Axis.vertical,
                          // childAspectRatio: 0.8,
                          children: <Widget>[
                            //Add new
                            Container(
                              child: Center(
                                child: Container(
                                  height: _width / 4,
                                  width: _width / 4,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(radius * 4),
                                      color: _sensorContaier),
                                  child: Icon(Icons.add,
                                      color: Colors.white, size: 40.0),
                                ),
                              ),
                            ),

                            //Air Condition

                            InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            B_SmartHome_Air()),
                                  );
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(padding),
                                // height: _width / 4,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(radius * 1.5),
                                  color: Colors.white.withOpacity(0.85),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    IconCustom('airconditioner.png', 34.0,
                                        Colors.black),
                                    SizedBox(height: 4.0),
                                    Text(
                                      "Air\nCondition",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      "Auto".toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //Celling Fans
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            B_SmartHome_Fan()),
                                  );
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(padding),
                                // height: _width / 4,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(radius * 1.5),
                                  color: Colors.white.withOpacity(0.85),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    // Icon(FontAwesomeIcons.windows),
                                    IconCustom('fan.png', 34.0, Colors.black),
                                    SizedBox(height: 4.0),
                                    Text(
                                      _name1,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      "ON 60%".toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            //Celling Light
                            InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            B_SmartHome_Light()),
                                  );
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(padding),
                                // height: _width / 4,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(radius * 1.5),
                                  color: Colors.white.withOpacity(0.85),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    IconCustom('lamp.png', 34.0, Colors.black),
                                    SizedBox(height: 4.0),
                                    Text(
                                      "Ceiling\nLight",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                      "OFF".toUpperCase(),
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SensorValue extends StatelessWidget {
  const SensorValue({
    Key key,
    @required double width,
    @required this.iconColor,
    @required String value,
    @required String imgIcon,
    String namevalue,
  })  : _width = width,
        _imgIcon = imgIcon,
        _value = value,
        _namevalue = namevalue,
        super(key: key);

  final double _width;
  final Color iconColor;
  final String _value;
  final String _imgIcon;
  final String _namevalue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width / 4,
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconCustom('${_imgIcon}', 18.0, iconColor),
                SizedBox(width: 4.0),
                Text("${_value}",
                    style: TextStyle(
                        color: iconColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          // SizedBox(height: 4.0),
          Text(
            "${_namevalue}",
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 10.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2),
          )
        ],
      ),
    );
  }
}
