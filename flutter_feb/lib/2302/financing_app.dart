import 'package:flutter/material.dart';
import 'package:flutter_feb/2302/mybottom_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class B_Financing extends StatefulWidget {
  @override
  _B_FinancingState createState() => _B_FinancingState();
}

class _B_FinancingState extends State<B_Financing> {
  /* List Widget */
  List<Widget> pages;

  /* String */
  final String total = "\$16,180.34";
  final String bankName1 = "Vietcombank";
  final String bankName2 = "Sacombank";
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
  int currentIndex = 1;

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
      viewportFraction: 0.9,
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
                  height: 40.0,
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
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // LIST TRANSACTIONS
              Container(
                height: 140.0,
                child: Column(
                  children: <Widget>[
                    //Text Payments
                    Container(
                      margin: EdgeInsets.only(
                        top: padding,
                        right: padding,
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
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // Not Use
              // Placeholder(),
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
                height: 150.0,
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
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
                                    fontSize: 20.0,
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
                                    fontWeight: FontWeight.w400,),
                              ),
                            ],
                          ),

                          //text Cardhoder name  // date

                        ],
                      ),
                    ),

                    // Second card
                    Container(
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
                      child: Placeholder(),
                    ),

                    // Place
                  ],
                ),
              ),

              //Container
              Container(
                child: Placeholder(),
              ),

              //Container
              Container(
                child: Placeholder(),
              )
            ],
          ),
        ),
      ),

      /* Dont use in UI */
      //Statistic Page
      Placeholder(color: Colors.green),
      //Menu Page
      Placeholder(color: Colors.pinkAccent),
    ];
  }
}
