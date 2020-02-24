import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feb/2302/mybottom_tab.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class B_Financing extends StatefulWidget {
  @override
  _B_FinancingState createState() => _B_FinancingState();
}

class _B_FinancingState extends State<B_Financing> {
  /* List Widget */
  List<Widget> pages;

  /* Value chart */
  var data = [
    0.0,
    15.0,
    16.0,
    14.0,
    12.0,
    14.0,
    16.0,
    34.0,
    35.0,
    34.0,
    16.0,
    14.0,
    12.0,
    14.0,
    16.0,
    20.0,
    23.0,
    60.0,
    62.0,
    60.0,
    40.0,
    38.0,
    36.0,
    38.0,
    43.0,
    80.0
  ];

  /* String */
  final String total = "\$16,180.34";
  final String bankName1 = "Vietcombank";
  final String bankName2 = "Sacombank";
  final String bankName3 = "Vietinbank";
  final String bankName4 = "Agribank";
  final String _price1 = "823,84.00";
  final String _price2 = "335,90.55";
  final String _lastserinumber1 = "8293";
  final String _lastserinumber2 = "9172";
  final String _dateNumber1 = "8/24";
  final String _dateNumber2 = "11/2";
  final String _paymentName1 = "Fast Food";
  final String _paymentName2 = "Coffeteria";
  final String _paymentwork1 = "Subway";
  final String _paymentwork2 = "Craftwork";
  final String _paymentprice1 = "12,50";
  final String _paymentprice2 = "5,20";
  final String _cardNumber1 = "4479 0323 4583 0341";
  final String _cardNumber2 = "1918 0323 2365 9826";
  final String _cardName1 = "Nguyen Van Teo";
  final String _cardName2 = "Nguyen Thi Nho";

  /* Color List */
  Color _despositColor = Color.fromRGBO(87, 151, 246, 1);
  Color _withDrawColor = Color.fromRGBO(230, 94, 151, 1);
  Color _card1 = Color.fromRGBO(252, 136, 192, 1);
  Color _card2 = Color.fromRGBO(161, 186, 255, 1);
  Color _card3 = Color.fromRGBO(255, 147, 161, 1);
  Color _card4 = Color.fromRGBO(252, 243, 161, 1);
  Color _paymentColor1 = Color.fromRGBO(255, 203, 190, 1);
  Color _paymentColor2 = Color.fromRGBO(237, 237, 237, 1);

  /* Size */
  final double padding = 16.0;
  final double radius = 8.0;

  /* Page Controller */
  PageController _pageController;

  /* Page view Index */
  int selectedIndex = 0;

  /* Bottom tab index*/
  int currentIndex = 2;

  /* Bottom Tab Funtion */
  void _onPress(int num) {
    setState(() {
      currentIndex = num;
      print("currentIndex ${currentIndex}");
    });
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: selectedIndex,
      viewportFraction: 0.85,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _definePages();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned.fill(
            child: pages[currentIndex],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: padding, right: padding),
              height: 54.0,
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MyBottomTabs(FontAwesomeIcons.home, "Home", currentIndex == 0,
                      () {
                    _onPress(0);
                  }),
                  MyBottomTabs(
                      FontAwesomeIcons.creditCard, "Card", currentIndex == 1,
                      () {
                    _onPress(1);
                  }),
                  MyBottomTabs(
                      FontAwesomeIcons.signal, "Statistic", currentIndex == 2,
                      () {
                    _onPress(2);
                  }),
                  MyBottomTabs(
                      FontAwesomeIcons.thLarge, "Menu", currentIndex == 3, () {
                    _onPress(3);
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _definePages() {
    pages = [
      //Home Page
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //App bar
              SafeArea(
                top: true,
                left: true,
                right: true,
                child: Container(
                  margin: EdgeInsets.only(top: padding),
                  height: 64.0,
                  child: Row(
                    children: <Widget>[
                      //Text Name
                      Text(
                        "Black Cat",
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),

                      //Space
                      Spacer(),

                      //Icon Right
                      Transform.rotate(
                        angle: 1.56,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.tune,
                            size: 28.0,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              //total Price
              Container(
                height: 64.0,
                child: Row(
                  children: <Widget>[
                    Text(
                      total,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),

                    //Container USD
                    Container(
                      margin: EdgeInsets.only(right: padding),
                      height: 32.0,
                      width: 64.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.black),
                      child: Center(
                        child: Text(
                          "USD",
                          style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //View Deposit && With Raw
              Container(
                margin: EdgeInsets.only(right: padding),
                height: 54.0,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius),
                            color: _despositColor),
                        child: Center(
                          child: Text(
                            "Deposit",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: padding),
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius),
                            color: _withDrawColor),
                        child: Center(
                          child: Text(
                            "Withdraw",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // LIST CARD
              Container(
                // margin: EdgeInsets.only(top: padding),
                height: 200.0,
                child: Column(
                  children: <Widget>[
                    //Page Card - View all
                    Container(
                      margin: EdgeInsets.only(
                          right: padding, top: padding, bottom: padding),
                      height: 32.0,
                      child: Row(
                        children: <Widget>[
                          //text card
                          Text(
                            "Card",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          //text view all
                          Text(
                            "View all",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: _despositColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // View List
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(bottom: padding),
                        shrinkWrap: true,
                        children: <Widget>[
                          //Master card
                          Container(
                            padding: EdgeInsets.all(padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 230.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius),
                                gradient: LinearGradient(
                                    colors: [_card1, _card2],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 2.0,
                                      blurRadius: 2.0)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //Text : Bank Name
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    // Contaier Icon logo
                                    Container(
                                      margin: EdgeInsets.only(right: padding),
                                      height: 16.0,
                                      width: 28.0,
                                      child: Stack(
                                        children: <Widget>[
                                          // left circle container
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            bottom: 0,
                                            child: Container(
                                              width: 16.0,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.red
                                                  // .withOpacity(0.80),
                                                  ),
                                            ),
                                          ),

                                          //right circle container
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                              width: 16.0,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.orange
                                                  // .withOpacity(0.80),
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Text Bank Name
                                    Text(
                                      bankName1.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                // Pirce
                                Text(
                                  "\$ " + _price1,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),

                                // Series number
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "**** " + _lastserinumber1,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Text(
                                      _dateNumber1,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //Visa Card
                          Container(
                            padding: EdgeInsets.all(padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 230.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius),
                                gradient: LinearGradient(
                                    colors: [_card3, _card4],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 2.0,
                                      blurRadius: 2.0)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //Text : Bank Name
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    // Text Vias Logo
                                    Text(
                                      "Visa".toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    SizedBox(width: padding),
                                    // Text Bank Name
                                    Text(
                                      bankName2.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),

                                // Pirce
                                Text(
                                  "\$ " + _price2,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),

                                // Series number
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "**** " + _lastserinumber2,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Text(
                                      _dateNumber2,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),

                          //Master card
                          Container(
                            padding: EdgeInsets.all(padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 230.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius),
                                gradient: LinearGradient(
                                    colors: [_card1, _card2],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 2.0,
                                      blurRadius: 2.0)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //Text : Bank Name
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    // Contaier Icon logo
                                    Container(
                                      margin: EdgeInsets.only(right: padding),
                                      height: 16.0,
                                      width: 28.0,
                                      child: Stack(
                                        children: <Widget>[
                                          // left circle container
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            bottom: 0,
                                            child: Container(
                                              width: 16.0,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.red
                                                  // .withOpacity(0.80),
                                                  ),
                                            ),
                                          ),

                                          //right circle container
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: Container(
                                              width: 16.0,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.orange
                                                  // .withOpacity(0.80),
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    // Text Bank Name
                                    Text(
                                      bankName1.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                // Pirce
                                Text(
                                  "\$ " + _price1,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),

                                // Series number
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "**** " + _lastserinumber1,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Text(
                                      _dateNumber1,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          //Visa Card
                          Container(
                            padding: EdgeInsets.all(padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 230.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(radius),
                                gradient: LinearGradient(
                                    colors: [_card3, _card4],
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      spreadRadius: 2.0,
                                      blurRadius: 2.0)
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //Text : Bank Name
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    // Text Vias Logo
                                    Text(
                                      "Visa".toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.indigo,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic),
                                    ),
                                    SizedBox(width: padding),
                                    // Text Bank Name
                                    Text(
                                      bankName2.toUpperCase(),
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),

                                // Pirce
                                Text(
                                  "\$ " + _price2,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),

                                // Series number
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "**** " + _lastserinumber2,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Text(
                                      _dateNumber2,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // LIST PAYMENTS
              Container(
                height: 140.0,
                child: Column(
                  children: <Widget>[
                    //Text Payments
                    Container(
                      margin: EdgeInsets.only(
                          // top: padding,
                          right: padding,
                          bottom: padding),
                      height: 32.0,
                      child: Row(
                        children: <Widget>[
                          //text Payments
                          Text(
                            "Payments",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          //text view all
                          Text(
                            "View all",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: _despositColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // View List
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(bottom: padding),
                        shrinkWrap: true,
                        children: <Widget>[
                          // fast food
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: padding / 2, vertical: padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: _paymentColor1,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                  color: Colors.black12,
                                )
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 45.0,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(radius),
                                      color: Colors.white),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.pizzaSlice,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                //Colum
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      //text Fast
                                      Text(
                                        _paymentName1,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      //text Fast
                                      Text(
                                        _paymentwork1,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),

                                //price
                                Text(
                                  "-\$ " + _paymentprice1,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),

                          //coffee
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: padding / 2, vertical: padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: _paymentColor2,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                  color: Colors.black12,
                                )
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 45.0,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(radius),
                                      color: Colors.white),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.coffee,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                //Colum
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      //text Fast
                                      Text(
                                        _paymentName2,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      //text Fast
                                      Text(
                                        _paymentwork2,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),

                                //price
                                Text(
                                  "-\$ " + _paymentprice2,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),

                          // fast food
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: padding / 2, vertical: padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: _paymentColor1,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                  color: Colors.black12,
                                )
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 45.0,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(radius),
                                      color: Colors.white),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.pizzaSlice,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                //Colum
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      //text Fast
                                      Text(
                                        _paymentName1,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      //text Fast
                                      Text(
                                        _paymentwork1,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),

                                //price
                                Text(
                                  "-\$ " + _paymentprice1,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),

                          //coffee
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: padding / 2, vertical: padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: _paymentColor2,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                  color: Colors.black12,
                                )
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 45.0,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(radius),
                                      color: Colors.white),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.coffee,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                //Colum
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      //text Fast
                                      Text(
                                        _paymentName2,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      //text Fast
                                      Text(
                                        _paymentwork2,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),

                                //price
                                Text(
                                  "-\$ " + _paymentprice2,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // LIST TRANSACTIONS
              Container(
                height: 150.0,
                child: Column(
                  children: <Widget>[
                    //Text Payments
                    Container(
                      margin: EdgeInsets.only(
                        top: padding,
                        right: padding,
                        bottom: padding,
                      ),
                      height: 32.0,
                      child: Row(
                        children: <Widget>[
                          //text Payments
                          Text(
                            "Transactions",
                            style: TextStyle(
                              fontSize: 24.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          //text view all
                          Text(
                            "View all",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: _despositColor,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // View List
                    Flexible(
                      fit: FlexFit.tight,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(bottom: padding),
                        shrinkWrap: true,
                        children: <Widget>[
                          // fast food
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: padding / 2, vertical: padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: Colors.pink,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                  color: Colors.black12,
                                )
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 45.0,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(radius),
                                      color: Colors.white),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.pizzaSlice,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                //Colum
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      //text Fast
                                      Text(
                                        _paymentName1,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      //text Fast
                                      Text(
                                        _paymentwork1,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),

                                //price
                                Text(
                                  "-\$ " + _paymentprice1,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),

                          //coffee
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: padding / 2, vertical: padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: Colors.blueAccent,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                  color: Colors.black12,
                                )
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 45.0,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(radius),
                                      color: Colors.white),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.coffee,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                //Colum
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      //text Fast
                                      Text(
                                        _paymentName2,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      //text Fast
                                      Text(
                                        _paymentwork2,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),

                                //price
                                Text(
                                  "-\$ " + _paymentprice2,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),

                          // fast food
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: padding / 2, vertical: padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: Colors.pink,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                  color: Colors.black12,
                                )
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 45.0,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(radius),
                                      color: Colors.white),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.pizzaSlice,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                //Colum
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      //text Fast
                                      Text(
                                        _paymentName1,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      //text Fast
                                      Text(
                                        _paymentwork1,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),

                                //price
                                Text(
                                  "-\$ " + _paymentprice1,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),

                          //coffee
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: padding / 2, vertical: padding),
                            margin: EdgeInsets.only(right: padding),
                            width: 230,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(radius),
                              color: Colors.blueAccent,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                  color: Colors.black12,
                                )
                              ],
                            ),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: padding),
                                  width: 45.0,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(radius),
                                      color: Colors.white),
                                  child: Center(
                                    child: Icon(
                                      FontAwesomeIcons.coffee,
                                      size: 20.0,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                //Colum
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      //text Fast
                                      Text(
                                        _paymentName2,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      //text Fast
                                      Text(
                                        _paymentwork2,
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),

                                //price
                                Text(
                                  "-\$ " + _paymentprice2,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              // Not Use
              Container(
                height: 60.0,
              ),
              // Placeholder(),
              // Placeholder(),
            ],
          ),
        ),
      ),

      //Card Page
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // App bar
              SafeArea(
                top: true,
                left: true,
                right: true,
                child: Container(
                  height: 40.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // Left Icon
                      Icon(Icons.arrow_back, size: 28.0, color: Colors.black),

                      // Text Cards
                      Text(
                        "Cards",
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),

                      // Icon Right
                      Transform.rotate(
                        angle: 1.56,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.tune,
                            size: 28.0,
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // PageView
              Container(
                padding: EdgeInsets.only(bottom: 4.0),
                height: 160.0,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: (int _selectedIndex) {
                    setState(() {
                      selectedIndex = _selectedIndex;
                    });
                  },
                  children: <Widget>[
                    // First card
                    Container(
                      padding: EdgeInsets.all(padding),
                      margin: EdgeInsets.only(right: padding),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          gradient: LinearGradient(
                              colors: [_card1, _card2],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2.0,
                                spreadRadius: 2.0)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //text Captial one
                          Row(
                            children: <Widget>[
                              // capital one
                              Text(
                                bankName1,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),

                              //
                              Spacer(),

                              //text Visa
                              Text(
                                "Visa",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),

                          //text Account number
                          Row(
                            children: <Widget>[
                              // capital one
                              Text(
                                _cardNumber1,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),

                              //
                              Spacer(),

                              //text Visa
                              Text(
                                "Platinum".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),

                          //text Cardhoder name  // date
                          Row(
                            children: <Widget>[
                              // capital one
                              Text(
                                _cardName1,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),

                              //
                              Spacer(),

                              //text Visa
                              Text(
                                _dateNumber1,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Second card
                    Container(
                      padding: EdgeInsets.all(padding),
                      margin: EdgeInsets.only(right: padding),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          gradient: LinearGradient(
                              colors: [_card3, _card4],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2.0,
                                spreadRadius: 2.0)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //text Captial one
                          Row(
                            children: <Widget>[
                              // capital one
                              Text(
                                bankName2,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),

                              //
                              Spacer(),

                              //text Visa
                              Text(
                                "Debit",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),

                          //text Account number
                          Row(
                            children: <Widget>[
                              // capital one
                              Text(
                                _cardNumber2,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),

                              //
                              Spacer(),

                              //text Visa
                              Text(
                                "Platinum".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),

                          //text Cardhoder name  // date
                          Row(
                            children: <Widget>[
                              // capital one
                              Text(
                                _cardName1,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),

                              //
                              Spacer(),

                              //text Visa
                              Text(
                                _dateNumber2,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // 3 card
                    Container(
                      padding: EdgeInsets.all(padding),
                      margin: EdgeInsets.only(right: padding),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          gradient: LinearGradient(
                              colors: [Colors.amber, Colors.deepPurple],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2.0,
                                spreadRadius: 2.0)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //text Captial one
                          Row(
                            children: <Widget>[
                              // capital one
                              Text(
                                bankName3,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),

                              //
                              Spacer(),

                              //text Visa
                              Text(
                                "Visa",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),

                          //text Account number
                          Row(
                            children: <Widget>[
                              // capital one
                              Text(
                                _cardNumber1,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),

                              //
                              Spacer(),

                              //text Visa
                              Text(
                                "Platinum".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),

                          //text Cardhoder name  // date
                          Row(
                            children: <Widget>[
                              // capital one
                              Text(
                                _cardName1,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),

                              //
                              Spacer(),

                              //text Visa
                              Text(
                                _dateNumber1,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // 4 card
                    Container(
                      padding: EdgeInsets.all(padding),
                      margin: EdgeInsets.only(right: padding),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radius),
                          gradient: LinearGradient(
                              colors: [Colors.green, Colors.blue],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                blurRadius: 2.0,
                                spreadRadius: 2.0)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //text Captial one
                          Row(
                            children: <Widget>[
                              // capital one
                              Text(
                                bankName4,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),

                              //
                              Spacer(),

                              //text Visa
                              Text(
                                "Debit",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),

                          //text Account number
                          Row(
                            children: <Widget>[
                              // capital one
                              Text(
                                _cardNumber2,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),

                              //
                              Spacer(),

                              //text Visa
                              Text(
                                "Platinum".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),

                          //text Cardhoder name  // date
                          Row(
                            children: <Widget>[
                              // capital one
                              Text(
                                _cardName1,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),

                              //
                              Spacer(),

                              //text Visa
                              Text(
                                _dateNumber2,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Place
                  ],
                ),
              ),

              // Indicator
              Container(
                height: 32.0,
                child: Center(
                  child: DotsIndicator(
                    dotsCount: 4,
                    position: selectedIndex.toDouble(),
                    decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.black,
                        size: Size(8.0, 8.0),
                        activeSize: Size(16.0, 8.0),
                        activeShape: StadiumBorder(),
                        spacing: EdgeInsets.all(2.0)),
                  ),
                ),
              ),

              // History Viewall
              Container(
                margin: EdgeInsets.only(
                    right: padding, top: padding / 2, bottom: padding),
                height: 32.0,
                child: Row(
                  children: <Widget>[
                    //text card
                    Text(
                      "History",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    //text view all
                    Text(
                      "View all",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: _despositColor,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),

              /* List View 1 */
              // Text Yesterday
              Text(
                "Yesterday",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // History 1 of yesterday
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                margin: EdgeInsets.only(top: padding / 2, right: padding),
                height: 64.0,
                child: Row(
                  children: <Widget>[
                    // left icon
                    Container(
                      margin: EdgeInsets.only(right: padding),
                      width: 64.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey.withOpacity(0.50),
                      ),
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.utensils,
                          size: 28.0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //  2 Line
                    Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // txt Price
                            Text(
                              "Capital One",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),

                            // txt Cashback
                            Text(
                              "Cashback",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),

                    // 2 Line Right
                    // Spacer(),
                    Container(
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          // txt Price
                          Text(
                            "+\$48.50",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Bank Serivces",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // History 2 of yesterday
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                margin: EdgeInsets.only(right: padding),
                height: 64.0,
                child: Row(
                  children: <Widget>[
                    // left icon
                    Container(
                      margin: EdgeInsets.only(right: padding),
                      width: 64.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.deepOrangeAccent,
                      ),
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.hamburger,
                          size: 28.0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //  2 Line
                    Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // txt Price
                            Text(
                              "Capital One",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),

                            // txt Cashback
                            Text(
                              "Burger King",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),

                    // 2 Line Right
                    // Spacer(),
                    Container(
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          // txt Price
                          Text(
                            "-\$32.44",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.red,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Fast Food",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              /* List View 2 */
              // Text Yesterday
              SizedBox(height: 8.0),
              Text(
                "20 February",
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),

              // History 1 of yesterday
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                margin: EdgeInsets.only(top: padding / 2, right: padding),
                height: 64.0,
                child: Row(
                  children: <Widget>[
                    // left icon
                    Container(
                      margin: EdgeInsets.only(right: padding),
                      width: 64.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey.withOpacity(0.50),
                      ),
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.home,
                          size: 28.0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //  2 Line
                    Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // txt Price
                            Text(
                              "Capital One",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),

                            // txt Cashback
                            Text(
                              "Bank Invoice",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),

                    // 2 Line Right
                    // Spacer(),
                    Container(
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          // txt Price
                          Text(
                            "+\$2.300.000",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Bank Serivces",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // History 2 of yesterday
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                margin: EdgeInsets.only(right: padding),
                height: 64.0,
                child: Row(
                  children: <Widget>[
                    // left icon
                    Container(
                      margin: EdgeInsets.only(right: padding),
                      width: 64.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.deepOrangeAccent,
                      ),
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.creditCard,
                          size: 28.0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //  2 Line
                    Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // txt Price
                            Text(
                              "Capital One",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),

                            // txt Cashback
                            Text(
                              "Card Tranfer",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),

                    // 2 Line Right
                    // Spacer(),
                    Container(
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          // txt Price
                          Text(
                            "-\$500.000",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.red,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Tranfers",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // History 3 of yesterday
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                margin: EdgeInsets.only(top: padding / 2, right: padding),
                height: 64.0,
                child: Row(
                  children: <Widget>[
                    // left icon
                    Container(
                      margin: EdgeInsets.only(right: padding),
                      width: 64.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey.withOpacity(0.50),
                      ),
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.home,
                          size: 28.0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //  2 Line
                    Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // txt Price
                            Text(
                              "Capital One",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),

                            // txt Cashback
                            Text(
                              "Bank Invoice",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),

                    // 2 Line Right
                    // Spacer(),
                    Container(
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          // txt Price
                          Text(
                            "+\$600.000",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Bank Serivces",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // History 4 of yesterday
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.0),
                margin: EdgeInsets.only(right: padding),
                height: 64.0,
                child: Row(
                  children: <Widget>[
                    // left icon
                    Container(
                      margin: EdgeInsets.only(right: padding),
                      width: 64.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.deepOrangeAccent,
                      ),
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.creditCard,
                          size: 28.0,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //  2 Line
                    Flexible(
                        fit: FlexFit.tight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // txt Price
                            Text(
                              "Capital One",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400),
                            ),

                            // txt Cashback
                            Text(
                              "Coffee",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),

                    // 2 Line Right
                    // Spacer(),
                    Container(
                      width: 120.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          // txt Price
                          Text(
                            "-\$20.000",
                            style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.red,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "Drink",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // Container
              Container(
                height: 60.0,
                // child: Placeholder(),
              ),
            ],
          ),
        ),
      ),

//*************************************************** */
      //Statistic Page
      Stack(
        children: <Widget>[
          //Blue Color
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.blue[900],
              height: 450.0,
            ),
          ),

          //TopView
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 450.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30.0),
                  //Account
                  Container(
                    margin: EdgeInsets.only(left: padding, right: padding),
                    child: Text(
                      'Account User',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                      ),
                    ),
                  ),

                  //Price
                  SizedBox(height: padding / 2),
                  Container(
                    margin: EdgeInsets.only(left: padding, right: padding),
                    child: Row(
                      children: <Widget>[
                        //left text
                        Text(
                          '\$ 1.350.200',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                          ),
                        ),
                        Spacer(),
                        //right Icon
                        Icon(
                          FontAwesomeIcons.download,
                          color: Colors.white,
                          size: 24.0,
                        )
                      ],
                    ),
                  ),

                  //Sale - Translate
                  Container(
                    margin: EdgeInsets.only(left: padding, right: padding),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: padding),
                          height: 30.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(radius * 2),
                            color: Colors.grey.withOpacity(0.6),
                          ),
                          child: Center(
                            child: Text(
                              "Sales",
                              style: TextStyle(
                                  fontSize: 14.0, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Container(
                          margin: EdgeInsets.only(top: padding),
                          // width: 80.0,
                          height: 30.0,
                          child: Center(
                            child: Text(
                              "Transactions",
                              style:
                                  TextStyle(fontSize: 14.0, color: Colors.grey),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),

                  //Chart
                  Container(
                    height: 240.0,
                    child: new Sparkline(
                      data: data,
                      lineColor: Colors.white,
                      lineWidth: 1.0,
                      pointsMode: PointsMode.last,
                    ),
                  )
                ],
              ),
            ),
          ),

          //Bottom View
          Positioned(
            top: 380,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(left: padding * 2, right: padding * 2),
              child: Column(
                children: <Widget>[
                  // month of year
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Jan",
                          style: TextStyle(
                            color: Colors.grey[800],
                          )),
                      Text("Feb",
                          style: TextStyle(
                            color: Colors.grey[800],
                          )),
                      Text("Mar",
                          style: TextStyle(
                            color: Colors.grey[800],
                          )),
                      Text("Apr",
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      Text("Jan",
                          style: TextStyle(
                            color: Colors.grey[800],
                          )),
                      Text("May",
                          style: TextStyle(
                            color: Colors.grey[800],
                          )),
                      Text("Jun",
                          style: TextStyle(
                            color: Colors.grey[800],
                          )),
                    ],
                  ),

                  // White View
                  SizedBox(height: padding / 2),
                  Container(
                    height: 180.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius * 2),
                      color: Colors.grey[200],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Name
                        Container(
                          padding: EdgeInsets.only(
                              left: padding, right: padding, top: padding / 2),
                          height: 50.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 30.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.6),
                                ),
                                child: Center(
                                  child: Icon(
                                    FontAwesomeIcons.cat,
                                    color: Colors.yellowAccent,
                                    size: 16.0,
                                  ),
                                ),
                              ),

                              // Name + Personal
                              SizedBox(width: 8.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Nguyen Van Teo",
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Personal")
                                ],
                              ),
                              Spacer(),
                              // Right Container USD
                              Container(
                                width: 60.0,
                                height: 30.0,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(radius * 2),
                                    color: Colors.grey.withOpacity(0.4)),
                                child: Center(
                                    child: Text("USD",
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold))),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: padding, right: padding),
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),

                        //Platinum
                        Container(
                          margin:
                              EdgeInsets.only(left: padding, right: padding),
                          height: 60.0,
                          // color: Colors.blue,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Platinum",
                                style: TextStyle(color: Colors.red),
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "+2 Persents",
                                    style: TextStyle(color: Colors.grey[400]),
                                  ),
                                  Text(
                                    "per-year",
                                    style: TextStyle(color: Colors.grey[400]),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),

                        //Price
                        Container(
                          // color: Colors.red,
                          margin:
                              EdgeInsets.only(left: padding, right: padding),
                          child: Text(
                            "\$ 23.562.400",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //SizeBox
                  SizedBox(height: padding),
                  //
                  Container(
                    padding: EdgeInsets.only(
                        left: padding, right: padding, top: padding / 2),
                    height: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius * 2),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.withOpacity(0.6),
                          ),
                          child: Center(
                            child: Icon(
                              FontAwesomeIcons.cat,
                              color: Colors.yellowAccent,
                              size: 20.0,
                            ),
                          ),
                        ),

                        // Name + Personal
                        SizedBox(width: 8.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Nguyen Van Teo",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 6.0),
                            Text("7:42   12 March")
                          ],
                        ),
                        Spacer(),
                        // Right Container USD
                        Container(
                          width: 60.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "-\$120",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 6.0),
                              Text(
                                "Coffee",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  //
                ],
              ),
            ),
          )
        ],
      ),
      //Menu Page
      /* Dont use in UI */
      Container(
        // color: Colors.pinkAccent,
        child: Center(
          child: Text("LOADING......",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
          ),),
        ),
      ),
    ];
  }
}
