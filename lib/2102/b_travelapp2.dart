import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feb/2102/b_travelitemlist.dart';

class SecondTravelPage extends StatefulWidget {
  // index in page view
  final int index;

  SecondTravelPage(this.index);

  @override
  _SecondTravelPageState createState() => _SecondTravelPageState();
}

class _SecondTravelPageState extends State<SecondTravelPage> {
  /* Size */
  final double padding = 16.0;
  final double radius = 16.0;

  // final List<List> jp = japan;

  /* Image */
  String _profileImage =
      "https://avatars1.githubusercontent.com/u/51372227?s=460&v=4";

  /* page View Index*/
  int selectedIndex = 0;

  /* PageView Controller */
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: selectedIndex,
      viewportFraction: 0.70,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: -150,
            left: -150,
            right: -150,
            bottom: -150,
            child: Hero(
              tag: "travel ${widget.index}",
              child: Image.asset(
                travels[widget.index].image,
                fit: BoxFit.fill,
              ),
            ),
          ),

          // Page Colum
          Positioned.fill(
            child: SafeArea(
              top: true,
              left: true,
              right: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //App bar
                  Container(
                    margin: EdgeInsets.only(
                      right: padding,
                    ),
                    // color: Colors.red,
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            print("On Click left icon in appbar");
                            print("Move back page");
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            size: 28.0,
                            color: Colors.white,
                          ),
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

                  //Tittle Scrore
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(
                        left: padding, right: padding, top: padding),
                    height: 130.0,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //left slide
                        Flexible(
                          flex: 5,
                          child: RichText(
                            text: TextSpan(children: [
                              //Line1
                              TextSpan(
                                text: "The best\n",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              //Line 2
                              TextSpan(
                                text: "Cities of\n",
                                style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                              TextSpan(
                                text: travels[widget.index].title,
                                style: TextStyle(
                                    fontSize: 40.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300),
                              ),
                            ]),
                          ),
                        ),

                        //right slide
                        Spacer(),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                      travels[widget.index].score,
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    )
                                    // Text Score
                                  ],
                                ),
                              ),
                              //Icons
                              Spacer(),
                              Transform.rotate(
                                angle: pi / 2,
                                child: Icon(
                                  Icons.tune,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  //PageView
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: padding),
                    height: 410.0,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      itemCount: japan.length,
                      onPageChanged: (int _selectedIndex) {
                        setState(() {
                          selectedIndex = _selectedIndex;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: padding * 2),
                          padding: EdgeInsets.all(padding),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 2.0,
                                  blurRadius: 2.0,
                                  offset: Offset(2.0, 2.0),
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Image Top
                              Container(
                                height: 180.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(radius),
                                  image: DecorationImage(
                                      image: AssetImage(japan[index].image),
                                      // travels[widget.index].image),
                                      fit: BoxFit.fill),
                                ),
                                // child: Placeholder(),
                              ),
                              Spacer(),
                              //Text title
                              Text(
                                japan[index].title,
                                style: TextStyle(
                                    fontSize: 24.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5),
                              ),

                              //Text description
                              Text(
                                japan[index].description,
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5),
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),

                              //Text Readmore and Icon
                              Spacer(),
                              Container(
                                height: 24.0,
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Read more",
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.favorite,
                                      size: 16.0,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(width: 2.0),
                                    Text(
                                      // japan[index].like,
                                      "987",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  //Indicator
                  Container(
                    height: 40.0,
                    child: Center(
                      child: DotsIndicator(
                        dotsCount: japan.length,
                        position: selectedIndex.toDouble(),
                        axis: Axis.horizontal,
                        decorator: DotsDecorator(
                          spacing: EdgeInsets.zero,

                          //color
                          color: Colors.grey,
                          activeColor: Colors.white,

                          //size
                          size: Size(16.0, 8.0),
                          activeSize: Size(16.0, 8.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
