import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:custom_switch/custom_switch.dart';

import 'b_icon.dart';

class B_SmartHome_Air extends StatefulWidget {
  @override
  _B_SmartHome_AirtState createState() => _B_SmartHome_AirtState();
}

class _B_SmartHome_AirtState extends State<B_SmartHome_Air> {
  /* Size */
  final double padding = 16.0;
  final double radius = 16.0;

  /* Color */
  final _sensorContaier = Colors.black87.withOpacity(0.6);
  final Color iconColor = Colors.white;
  final Color _sliderColor =
      Color.alphaBlend(Colors.yellowAccent, Colors.blueAccent);

  /* Sw */
  bool valueSw = true;
  bool btnState = true;

  /* String name */
  String _name = "Air\nCondition";
  String _colourtemp = "Select Temp";
  String _softwhite = "Sweep Wind";
  String _nameLight = "Panasonic Inverter";
  String _priceLight = "1 HP CU/CS-XU9UKH-8";
  double _lastSliderVar = 23;
  double _sliderVar = 23.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            "assets/2402/back3.jpg",
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          child: SafeArea(
            top: true,
            left: true,
            right: true,
            child: Padding(
              padding: EdgeInsets.only(left: padding, right: padding),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Icon Cancel
                  Container(
                    height: 40.0,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: iconColor,
                        size: 34.0,
                      ),
                      onPressed: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                    ),
                  ),

                  // Ceiling Light
                  Container(
                    margin: EdgeInsets.only(top: padding),
                    height: 140.0,
                    child: Text(
                      _name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 60.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                  //Power and save mode  && SW
                  Container(
                    margin: EdgeInsets.only(top: padding),
                    height: 64.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Power Save Mode",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 4.0),
                        CustomSwitch(
                          activeColor: _sensorContaier,
                          value: valueSw,
                          onChanged: (value) {
                            setState(() {
                              valueSw = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  //Circle Button
                  Container(
                    margin: EdgeInsets.only(top: padding),
                    height: 64.0,
                    child: Row(
                      children: <Widget>[
                        Spacer(),
                        Container(
                          width: 64.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40.0),
                            color: Colors.white,
                          ),
                          child: Center(
                              child: IconButton(
                            icon: Icon(FontAwesomeIcons.powerOff,
                                size: 24.0,
                                color: btnState
                                    ? Colors.blue[400]
                                    : Colors.black54),
                            onPressed: () {
                              setState(() {
                                btnState = !btnState;
                              });
                            },
                            // color: Colors.black,
                          )),
                        ),
                      ],
                    ),
                  ),

                  // Box couler temp
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(bottom: padding / 2),
                    padding: EdgeInsets.only(
                        top: padding,
                        right: padding,
                        left: padding,
                        bottom: padding),
                    height: 180.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        color: _sensorContaier),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Coulur temp & sofwhite
                        Container(
                          height: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: 24.0,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      _colourtemp +
                                          ": ${_sliderVar.toInt()} °C",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Spacer(),
                                    Text(
                                      _softwhite,
                                      style: TextStyle(
                                          color: Colors.grey[500],
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                height: 30.0,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(padding),
                                    gradient: LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                        colors: [
                                          Colors.blue[200],
                                          Colors.yellow[300]
                                        ])),
                                child: Slider(
                                  activeColor: Colors.red,
                                  value: _sliderVar,
                                  min: 10.0,
                                  max: 50.0,
                                  divisions: 40,
                                  label: '${_sliderVar.round()}',
                                  onChanged: (double value) {
                                    setState(() {
                                      _sliderVar = value;
                                      _lastSliderVar = value;
                                      print(_sliderVar);
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                        ),

                        //Icon lumom....
                        Container(
                          margin: EdgeInsets.only(top: padding / 2),
                          height: 1.0,
                          color: Colors.grey[400].withOpacity(0.4),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: padding / 2),
                            height: 60.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //Icon
                                Container(
                                  width: 55.0,
                                  height: 55.0,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(radius * 2),
                                      color: Colors.white),
                                  child: IconCustom(
                                    'airconditioner.png',
                                    30.0,
                                    Colors.black,
                                  ),
                                ),

                                // Text
                                Container(
                                  margin: EdgeInsets.only(bottom: padding / 2),
                                  width: 170.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        _nameLight,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20.0,
                                          letterSpacing: 0.01,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        _priceLight,
                                        style: TextStyle(
                                          color: Colors.grey[500],
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.0,
                                          letterSpacing: 0.01,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Icon(
                                    Icons.info,
                                    color: Colors.grey[500],
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      bottom: padding,
                      left: padding * 6,
                      right: padding * 6,
                    ),
                    height: 5.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radius),
                        color: _sensorContaier),
                    // child: Placeholder(),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
