import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feb/2302/mybottom_tab.dart';
import 'package:flutter_feb/2802/booking_bottom.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookingApp extends StatefulWidget {
  @override
  _BookingAppState createState() => _BookingAppState();
}

class _BookingAppState extends State<BookingApp> {
  /* List Widget */
  List<Widget> pages;

  /* Color */
  final Color colorBackground = Color.fromRGBO(27, 27, 27, 1);
  final Color textFieldColor = Color.fromRGBO(38, 38, 38, 1);
  final Color colorBottom = Colors.blueGrey[300].withOpacity(0.4);
  final Color dashColor = Colors.white24;
  final Color textColorsGrey = Colors.grey[400];

  /* Size */
  final double padding = 16.0;
  final double radius = 16.0;
  double _width;
  double _height;

  /* Page Controller */
  PageController _pageController;

  /* Page view Index */
  int selectedIndex = 0;

  /* Valid */
  bool checkboxvalue = false;
  bool checkboxvalue2 = true;

  /* Funtion */
  //Bottom tab index
  int currentIndex = 1;
  int currentService = 0;

  /* Funtion */
  void _onPressService(int num) {
    setState(() {
      currentService = num;
      print("currentService ${currentService}");
    });
  }

  // Bottom
  void _onPress(int num) {
    setState(() {
      currentIndex = num;
      print("currentIndex ${currentIndex}");
    });
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width - padding;
    _height = MediaQuery.of(context).size.height - padding;
    _definePages();

    return new Scaffold(
      backgroundColor: colorBackground,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          // Body
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                (currentIndex == 0 || currentIndex == 2)
                    ? SafeArea(
                        left: true,
                        right: true,
                        top: true,
                        child: Container(
                          margin: EdgeInsets.only(
                              top: padding / 2,
                              left: padding * 2,
                              right: padding),
                          height: 24.0,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Spacer(),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Booking",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    ".com",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),

                              //Icon
                              Spacer(),
                              Icon(
                                FontAwesomeIcons.bell,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          //
                        ),
                      )
                    : Container(),
                Container(
                  // width:
                  height: _height - 44.0,
                  child: pages[currentIndex],
                )
                // pages[currentIndex],
              ],
            ),
          ),

          //Bottom bar
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 44.0,
                color: colorBottom,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    BookingBottomTabs(
                        FontAwesomeIcons.search, "Search", currentIndex == 0,
                        () {
                      _onPress(0);
                    }),
                    BookingBottomTabs(FontAwesomeIcons.bookOpen, "Bookings",
                        currentIndex == 1, () {
                      _onPress(1);
                    }),
                    BookingBottomTabs(FontAwesomeIcons.userCircle, "Sign in",
                        currentIndex == 2, () {
                      _onPress(2);
                    }),
                    BookingBottomTabs(
                        Icons.more_horiz, "More", currentIndex == 3, () {
                      _onPress(3);
                    }),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  _definePages() {
    pages = [
      //Page search
      pageViewSearch(),

      //Page bookings
      pageViewBookings(),

      //Page Sign In
      pageViewSignIn(),

      //Page More
      pageViewMore()
    ];
  }

  //Page more
  SingleChildScrollView pageViewMore() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[],
      ),
    );
  }

  //Page signin
  SingleChildScrollView pageViewSignIn() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Accinnidatuib && Car Rental
        ],
      ),
    );
  }

  //Page bookings
  SingleChildScrollView pageViewBookings() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Accinnidatuib && Car Rental
          Container(
            margin: EdgeInsets.only(top: padding * 1.5),
            padding: EdgeInsets.symmetric(horizontal: padding),
            height: 44.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Spacer(),
                Text(
                  "Bookings",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600),
                ),
                Spacer(),
                Icon(
                  FontAwesomeIcons.cloudDownloadAlt,
                  size: 24.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: padding),
            height: 54.0,
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Row(
              children: <Widget>[
                Text(
                  "Add a phrase to view your\nnext booking",
                  style: TextStyle(
                      color: textColorsGrey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius),
                      color: Colors.black),
                  width: 160.0,
                  height: 50.0,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.account_circle,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      SizedBox(width: padding / 2),
                      Text(
                        "Add to Siri",
                        style: TextStyle(
                            color: textColorsGrey,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          //Welcom back
          Container(
            margin: EdgeInsets.only(top: padding),
            padding:
                EdgeInsets.only(top: padding, left: padding, right: padding),
            height: _height,
            width: _width,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Welcome back!",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: padding / 2),
                Text(
                  "To see your bookings, you may need to import them using your booking reference number and Pin or by signing into your account ",
                  style: TextStyle(
                      color: textColorsGrey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      height: 1.4),
                ),
                Container(
                  margin: EdgeInsets.only(top: padding),
                  height: 40.0,
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: Colors.blue,
                      ),
                      color: colorBackground),
                  child: Center(
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                          height: 1.4),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///Page Search
  SingleChildScrollView pageViewSearch() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Accinnidatuib && Car Rental
          Container(
            margin: EdgeInsets.all(padding / 2),
            height: 64.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                /*Accinnidatuib*/
                InkWell(
                  onTap: () {
                    _onPressService(0);
                  },
                  child: Container(
                    width: _width / 2,
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.add_to_home_screen,
                              color: currentService != 0
                                  ? Colors.grey[400]
                                  : Colors.blue,
                              size: 24.0,
                            ),
                            SizedBox(
                              width: padding / 2,
                            ),
                            Text(
                              "Accommondation",
                              style: TextStyle(
                                  color: currentService != 0
                                      ? Colors.grey[400]
                                      : Colors.blue,
                                  fontSize: 14.0),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          alignment: AlignmentDirectional.bottomCenter,
                          margin: EdgeInsets.only(left: padding / 2),
                          height: 2.0,
                          color: currentService != 0
                              ? Colors.white24
                              : Colors.blue,
                        )
                      ],
                    ),
                  ),
                ),

                /*Car Rental*/
                InkWell(
                  onTap: () {
                    _onPressService(1);
                  },
                  child: Container(
                    width: _width / 2,
                    child: Column(
                      children: <Widget>[
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.car,
                              color: currentService != 1
                                  ? Colors.grey[400]
                                  : Colors.blue,
                              size: 24.0,
                            ),
                            SizedBox(
                              width: padding / 2,
                            ),
                            Text(
                              "Car rental",
                              style: TextStyle(
                                  color: currentService != 1
                                      ? Colors.grey[400]
                                      : Colors.blue,
                                  fontSize: 14.0),
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          alignment: AlignmentDirectional.bottomCenter,
                          margin: EdgeInsets.only(right: padding / 2),
                          height: 2.0,
                          color: currentService != 1
                              ? Colors.white24
                              : Colors.blue,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Serach && Destination/property name
          Container(
            margin: EdgeInsets.symmetric(horizontal: padding / 2),
            height: 76.0,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Search",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: padding / 4),
                  Text(
                    "Destination/property name",
                    style: TextStyle(color: Colors.white70, fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),

          // TextField && im traving && sign in && rasse button
          Container(
            margin: EdgeInsets.only(
                left: padding, right: padding, top: padding / 2),
            // color: Colors.red,
            child: Column(
              children: <Widget>[
                // text Enter destinaniton
                TextField(
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: textFieldColor,
                    hintText: "Enter destination",
                    hintStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 14.0,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w400),
                    prefixIcon: Icon(
                      FontAwesomeIcons.search,
                      size: 18.0,
                      color: Colors.white70,
                    ),
                  ),
                ),

                // Fri 28 Freb
                SizedBox(height: padding / 6),
                TextField(
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: textFieldColor,
                    hintText: "Fri 28 Feb - Sat 29 Feb",
                    hintStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 14.0,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w400),
                    prefixIcon: Icon(
                      Icons.work,
                      size: 18.0,
                      color: Colors.white70,
                    ),
                  ),
                ),

                // 1 room
                SizedBox(height: padding / 6),
                TextField(
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: textFieldColor,
                    hintText: "1 room - 2 adults. No children",
                    hintStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 14.0,
                        letterSpacing: 0.5,
                        fontWeight: FontWeight.w400),
                    prefixIcon: Icon(
                      FontAwesomeIcons.user,
                      size: 18.0,
                      color: Colors.white70,
                    ),
                  ),
                ),

                //Button Search
                SizedBox(height: padding / 6),
                SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {},
                    color: Colors.blue,
                    child: Text(
                      "Search",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),

                // Text I'm travelling for work
                Row(
                  children: <Widget>[
                    Text(
                      "I'm travelling for work",
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                    Spacer(),
                    CircularCheckBox(
                      inactiveColor: Colors.white,
                      value: checkboxvalue,
                      // materialTapTargetSie: MaterialTapTargetSize.padded,
                      onChanged: (bool x) {
                        setState(() {
                          print(checkboxvalue);
                          checkboxvalue = !checkboxvalue;
                        });
                      },
                    ),
                  ],
                ),

                //
              ],
            ),
          ),

          // Sing in to unlock Sercret Deal discounts
          Container(
            height: 1.0,
            color: dashColor,
          ),
          Row(
            children: <Widget>[
              CircularCheckBox(
                inactiveColor: Colors.green,
                activeColor: Colors.green,
                // disabledColor: Colors.green,
                value: checkboxvalue2,
                // materialTapTargetSie: MaterialTapTargetSize.padded,
                onChanged: (bool x) {
                  setState(() {
                    print(checkboxvalue2);
                    checkboxvalue2 = !checkboxvalue2;
                  });
                },
              ),
              Text(
                "Sign in to unlock Secret Deal discounts",
                style: TextStyle(
                    color: textColorsGrey,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Container(
            height: 1.0,
            color: dashColor,
          ),

          // Not now && Sign in
          Container(
            height: 40.0,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: _width / 2,
                    // color: Colors.white,
                    child: Center(
                      child: Text(
                        "Not now",
                        style: TextStyle(color: Colors.blue, fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1.0,
                  color: dashColor,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: _width / 2,
                    // color: Colors.white,
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: Colors.blue, fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: padding / 2,
            color: Colors.black,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: padding),
            padding: EdgeInsets.symmetric(horizontal: padding),
            height: 54.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "Recently viewed",
                  style: TextStyle(
                      color: textColorsGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0),
                ),
                Spacer(),
                Text(
                  "26 Properties",
                  style: TextStyle(
                      color: textColorsGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0),
                ),
                Icon(Icons.chevron_right, color: Colors.grey[600])
              ],
            ),
          ),
          Container(
            height: padding / 2,
            color: Colors.black,
          ),

          // Today's deals
          Container(
            padding: EdgeInsets.all(padding / 4),
            height: 240.0,
            // width: _width,
            // color: Colors.green,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Today's deals",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  margin: EdgeInsets.only(top: padding / 4),
                  padding: EdgeInsets.only(right: padding),
                  height: 200,
                  // color: Colors.white,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(bottom: padding / 4),
                    // shrinkWrap: true,
                    children: <Widget>[
                      //View 1
                      Container(
                        margin: EdgeInsets.only(right: padding),
                        // padding: EdgeInsets.only(bottom: padding),
                        width: _width * 2 / 3,
                        height: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            //Image
                            Container(
                              width: _width * 2 / 3,
                              height: 131.0,
                              child: Image(
                                image: AssetImage('assets/2102/italya.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: padding / 2),
                            //Text Descrip
                            Text(
                              "Early 2020 Deals",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            //Text tittle
                            Text(
                              "Get 20% off stays  1 Jan~31 Mar",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),

                      ///View 2
                      Container(
                        margin: EdgeInsets.only(right: padding),
                        // padding: EdgeInsets.only(bottom: padding),
                        width: _width * 2 / 3,
                        height: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            //Image
                            Container(
                              width: _width * 2 / 3,
                              height: 131.0,
                              child: Image(
                                image: AssetImage('assets/2102/japan.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: padding / 2),
                            //Text Descrip
                            Text(
                              "Early 2020 Deals",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            //Text tittle
                            Text(
                              "Get 20% off stays  20 Jan ~31",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "May",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),

                      //View 3
                      Container(
                        margin: EdgeInsets.only(right: padding),
                        // padding: EdgeInsets.only(bottom: padding),
                        width: _width * 2 / 3,
                        height: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            //Image
                            Container(
                              width: _width * 2 / 3,
                              height: 131.0,
                              child: Image(
                                image: AssetImage('assets/2102/tokyo4.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: padding / 2),
                            //Text Descrip
                            Text(
                              "Early 2020 Deals",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            //Text tittle
                            Text(
                              "Get 20% off stays  1 Jan~31 Mar",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),

                      ///View 4
                      Container(
                        margin: EdgeInsets.only(right: padding),
                        // padding: EdgeInsets.only(bottom: padding),
                        width: _width * 2 / 3,
                        height: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            //Image
                            Container(
                              width: _width * 2 / 3,
                              height: 131.0,
                              child: Image(
                                image: AssetImage('assets/2102/tokyo2.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            SizedBox(height: padding / 2),
                            //Text Descrip
                            Text(
                              "Early 2020 Deals",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            //Text tittle
                            Text(
                              "Get 20% off stays  20 Jan ~31",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              "May",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.0,
                                  letterSpacing: 0.8,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      //
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: padding / 2,
            color: Colors.black,
          ),

          //Inspriring deals to your inbox
          Container(
            // height: 300.0,
            padding: EdgeInsets.only(top: padding / 2, bottom: padding / 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: padding / 4),
                  width: 40.0,
                  child: Icon(
                    FontAwesomeIcons.lightbulb,
                    size: 24.0,
                    color: Colors.white70,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: padding / 4),
                  width: _width - 64,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Inspirring deals to your inbox",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.8),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "We have 841,745 member-only deals-subcribe\nto unlock them",
                        style: TextStyle(
                          color: Colors.white70,
                          letterSpacing: 0.8,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: padding / 4),
                      TextField(
                        // style: TextStyle(fontSize: 15.0, color: Colors.white),
                        decoration: InputDecoration(
                          // filled: true,
                          hintText: "Email address",
                          hintStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 14.0,
                            letterSpacing: 0.4,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "Subcribes",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: 4.0),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: padding / 4),
                  width: 40.0,
                  child: Icon(
                    Icons.close,
                    size: 24.0,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: padding / 2,
            color: Colors.black,
          ),

          //List your property on Booking.com
          Container(
            // height: 300.0,
            padding: EdgeInsets.only(top: padding / 2, bottom: padding / 2),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: padding / 4),
                  width: 40.0,
                  child: Icon(
                    FontAwesomeIcons.home,
                    size: 20.0,
                    color: Colors.white70,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: padding / 4),
                  width: _width - 64,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "List your property on Booking.com",
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.8),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        "Make money while you travel",
                        style: TextStyle(
                          color: Colors.white70,
                          letterSpacing: 0.8,
                          fontSize: 14.0,
                        ),
                      ),
                      SizedBox(height: padding / 2),
                      Text(
                        "List now",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 4.0),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: padding / 4),
                  width: 40.0,
                  child: Icon(
                    Icons.close,
                    size: 24.0,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: padding / 2,
            color: Colors.black,
          ),

          //
          Container(
            height: 60.0,
          ),
          //
        ],
      ),
    );
  }
}
