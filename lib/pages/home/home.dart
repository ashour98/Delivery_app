import 'package:courier_pro/constant/constant.dart';
import 'package:courier_pro/pages/courier/Electronics/get_electronics_deliver.dart';
import 'package:courier_pro/pages/courier/Pharmacies/get_medicine_deliver.dart';
import '../courier/Flowers/get_flowers_deliver.dart';
import '../courier/Grocery/Grocery_items.dart';
import '../courier/Food/get_food_deliver.dart';
import '../courier/Grocery/get_grocery_deliver.dart';
import 'package:courier_pro/pages/courier/send_packages.dart';
import 'package:courier_pro/pages/invite_friend/invite_friend.dart';
import 'package:courier_pro/pages/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        elevation: 1.0,
        title: Text('Welcome to Courier Pro', style: appBarTextStyle),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: primaryColor),
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: Profile()));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(fixPadding * 2.0),
            child: Image.asset(
              'assets/banner.png',
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          // Container(
          //   margin: EdgeInsets.all(fixPadding),
          //   width: width - (fixPadding * 2.0),
          //   height: 175.0,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10.0),
          //     image: DecorationImage(
          //       image: AssetImage('assets/banner.png'),
          //       fit: BoxFit.fill,
          //     ),
          //   ),
          // ),
          heightSpace,
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.scale,
                      alignment: Alignment.bottomCenter,
                      child: InviteFriend()));
            },
            child: Container(
              padding: EdgeInsets.all(fixPadding * 2.0),
              color: lightPrimaryColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/wallet.png',
                        width: 35.0,
                        height: 35.0,
                        fit: BoxFit.fitHeight,
                      ),
                      widthSpace,
                      Container(
                        width: width - (fixPadding * 4.0 + 35.0 + 30.0 + 10.0),
                        child: Text(
                            'Invite friends to Courier Pro to earn upto \$20 Courier Pro Cash',
                            style: blackSmallTextStyle),
                      ),
                    ],
                  ),
                  Container(
                    width: 30.0,
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_forward_ios,
                        color: greyColor, size: 18.0),
                  ),
                ],
              ),
            ),
          ),

          // Courier Type Start

          // Send Packages Start
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SendPackages()));
            },
            child: Hero(
              tag: 'Send Packages',
              child: Container(
                margin: EdgeInsets.only(
                    top: fixPadding * 2.0,
                    right: fixPadding * 2.0,
                    left: fixPadding * 2.0),
                padding: EdgeInsets.all(fixPadding * 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                  border: Border.all(width: 0.2, color: primaryColor),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1.5,
                      color: primaryColor.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: primaryColor.withOpacity(0.2),
                      ),
                      child: Image.asset(
                        'assets/icons/courier.png',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    widthSpace,
                    Container(
                      width: width - (fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Send Packages',
                              style: primaryColorHeadingTextStyle),
                          Text('Send packages to anywhere and anytime.',
                              style: greySmallTextStyle)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Send Packages Start

          // Food Deliver Start
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetFoodDeliver()));
            },
            child: Hero(
              tag: 'Get Food Deliver',
              child: Container(
                margin: EdgeInsets.only(
                    top: fixPadding * 2.0,
                    right: fixPadding * 2.0,
                    left: fixPadding * 2.0),
                padding: EdgeInsets.all(fixPadding * 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                  border: Border.all(width: 0.2, color: primaryColor),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1.5,
                      color: primaryColor.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: primaryColor.withOpacity(0.2),
                      ),
                      child: Image.asset(
                        'assets/icons/food.png',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    widthSpace,
                    Container(
                      width: width - (fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Get Food Deliver',
                              style: primaryColorHeadingTextStyle),
                          Text('Order food and we will deliver it.',
                              style: greySmallTextStyle)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Food Deliver Start

          // Grocery Deliver Start
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetGroceryDeliver()));
            },
            child: Hero(
              tag: "Get Grocery Deliver",
              child: Container(
                margin: EdgeInsets.only(
                    top: fixPadding * 2.0,
                    right: fixPadding * 2.0,
                    left: fixPadding * 2.0),
                padding: EdgeInsets.all(fixPadding * 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                  border: Border.all(width: 0.2, color: primaryColor),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1.5,
                      color: primaryColor.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: primaryColor.withOpacity(0.2),
                      ),
                      child: Image.asset(
                        'assets/icons/grocery.png',
                        width: 40.0,
                        height: 40.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    widthSpace,
                    Container(
                      width: width - (fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Get Grocery Deliver',
                              style: primaryColorHeadingTextStyle),
                          Text(
                              'Order grocery and we will deliver it.',
                              style: greySmallTextStyle)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Grocery Deliver Start

          // Flowers Deliver Start
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetFlowersDeliver()));
            },
            child: Hero(
              tag: 'Get Flowers',
              child: Container(
                margin: EdgeInsets.only(
                    top: fixPadding * 2.0,
                    right: fixPadding * 2.0,
                    left: fixPadding * 2.0),
                padding: EdgeInsets.all(fixPadding * 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                  border: Border.all(width: 0.2, color: primaryColor),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1.5,
                      color: primaryColor.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: primaryColor.withOpacity(0.2),
                      ),
                      child: Image.asset(
                        'assets/icons/flowers.png',
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    widthSpace,
                    Container(
                      width: width - (fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Get Flowers',
                              style: primaryColorHeadingTextStyle),
                          Text('Discover Our Extensive Range of Beautiful Flowers',
                              style: greySmallTextStyle)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Flowers Deliver Start

          // pharmacies Deliver Start
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetMedicineDeliver()));
            },
            child: Hero(
              tag: 'Pharmacies',
              child: Container(
                margin: EdgeInsets.only(
                    top: fixPadding * 2.0,
                    right: fixPadding * 2.0,
                    left: fixPadding * 2.0),
                padding: EdgeInsets.all(fixPadding * 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                  border: Border.all(width: 0.2, color: primaryColor),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1.5,
                      color: primaryColor.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: primaryColor.withOpacity(0.2),
                      ),
                      child: Image.asset(
                        'assets/icons/pilll.png',
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    widthSpace,
                    Container(
                      width: width - (fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Pharmacies',
                              style: primaryColorHeadingTextStyle),
                          Text('We care for your health with our services',
                              style: greySmallTextStyle)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // pharmacies Deliver Start

          // electronics Deliver Start
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GetElectronicsDeliver()));
            },
            child: Hero(
              tag: 'Electronics',
              child: Container(
                margin: EdgeInsets.only(
                    top: fixPadding * 2.0,
                    right: fixPadding * 2.0,
                    left: fixPadding * 2.0),
                padding: EdgeInsets.all(fixPadding * 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                  border: Border.all(width: 0.2, color: primaryColor),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 1.5,
                      spreadRadius: 1.5,
                      color: primaryColor.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 70.0,
                      height: 70.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: primaryColor.withOpacity(0.2),
                      ),
                      child: Image.asset(
                        'assets/icons/device.png',
                        width: 70.0,
                        height: 70.0,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    widthSpace,
                    Container(
                      width: width - (fixPadding * 8.0 + 70.0 + 10.0 + 0.4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Electronics',
                              style: primaryColorHeadingTextStyle),
                          Text('Discover new technology and product with our service',
                              style: greySmallTextStyle)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // electronics Deliver Start



          // Courier Type End
          heightSpace,
          heightSpace,
        ],
      ),
    );
  }
}
