// 22:46 MegaJoon

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'b_travelapp2.dart';
import 'b_travelitemlist.dart';

class B_TravelApp extends StatefulWidget {
  @override
  _B_TravelAppState createState() => _B_TravelAppState();
}

class _B_TravelAppState extends State<B_TravelApp> {
  /* List<widget> */
  List<Widget> pages = [];

  /* Size */
  final double padding = 16.0;
  final double radius = 16.0;

  /* String */
  String title = "Hello, Black Cat";
  String subTitle1 = "Where are we\n";
  String subTitle2 = "going today?";

  /* Image */
  String _profileImage =
      "https://avatars1.githubusercontent.com/u/51372227?s=460&v=4";

  /* Bototm bar index */
  int currentIndex = 0;

  /* PageView Controller */
  PageController _pageController;

  /* Page View Index */
  int selectedIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: selectedIndex,
      viewportFraction: 0.80,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    buildWidgetPages();

    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
// Bottom Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,

        //- unselected
        unselectedIconTheme: IconThemeData(
          size: 24.0,
          color: Colors.grey[400],
        ),

        //- slected
        selectedIconTheme: IconThemeData(
          size: 24.0,
          color: Colors.black,
        ),

        //- onCLick event
        currentIndex: currentIndex,
        onTap: (int _currentIndex) {
          setState(() {
            currentIndex = _currentIndex;
            print(currentIndex);
          });
        },
        //- bottom item
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.compass),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.search),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text(""),
          ),
        ],
      ),
    );
  }

  buildWidgetPages() {
    pages = [
      // Init Page
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //App bar
          SafeArea(
            top: true,
            left: true,
            right: true,
            child: Container(
              margin: EdgeInsets.only(
                left: padding,
                right: padding,
                top: padding,
              ),
              height: 40.0,
              child: Row(
                children: <Widget>[
                  //Left profile
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  //Right profile
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
          ),
          // Sub Text
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: subTitle1,
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  // Line 2
                  TextSpan(
                    text: subTitle2,
                    style: TextStyle(
                      fontSize: 32.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Page View
          Flexible(
            fit: FlexFit.tight,
            child: PageView.builder(
              itemCount: travels.length,
              scrollDirection: Axis.horizontal,
              controller: _pageController,
              onPageChanged: (int _selectedIndex) {
                setState(() {
                  selectedIndex = _selectedIndex;
                });
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    print("On Click Page View ${index}");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SecondTravelPage(index)),
                    );
                  },
                  child: Hero(
                    tag: "travel $index",
                    child: Container(
                      padding: EdgeInsets.only(
                          left: padding,
                          right: padding,
                          top: padding,
                          bottom: padding * 2),
                      margin: EdgeInsets.only(
                          top: padding, right: padding * 2, bottom: padding),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          // color: Colors.redAccent,
                          image: DecorationImage(
                            image: AssetImage(
                              travels[index].image,
                            ),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                spreadRadius: 4.0,
                                blurRadius: 4.0,
                                offset: Offset(2.0, 2.0))
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // container Score
                          Container(
                            height: 20.0,
                            width: 50.0,
                            decoration: ShapeDecoration(
                                shape: StadiumBorder(),
                                color: Colors.white.withOpacity(0.40)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // Icon Start
                                Icon(Icons.star,
                                    size: 12.0, color: Colors.white),
                                SizedBox(
                                  width: 2.0,
                                ),
                                Text(
                                  travels[index].score,
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                )
                                // Text Score
                              ],
                            ),
                          ),
                          //Tittle
                          Spacer(),
                          Text(
                            travels[index].title,
                            style: TextStyle(
                                fontSize: 28.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              //Icon Location
                              Icon(Icons.location_on,
                                  size: 12.0, color: Colors.white),
                              //Spacer
                              SizedBox(width: 4.0),
                              Text(
                                travels[index].subTitle,
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )

                          //text subText
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // don't use
      Placeholder(color: Colors.red),
      Placeholder(color: Colors.green),
      Placeholder(color: Colors.blue),
      // Placeholder(color: Colors.pink),
      // Placeholder(color: Colors.black),
    ];
  }
}
