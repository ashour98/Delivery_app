import 'dart:collection';

import 'package:courier_pro/Model/orders.dart';
import 'package:courier_pro/constant/constant.dart';
import 'package:courier_pro/pages/courier/route_map.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'OrderDetails.dart';

class TrackOrder extends StatefulWidget {
  final orders order;
  TrackOrder(this.order);
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 1.0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Track order',
              style: appBarBlackTextStyle,
            ),
            SizedBox(height: 5.0),
            Text(
              'Package Send',
              style: greySmallTextStyle,
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: blackColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomSheet: Wrap(
        children: [
          Material(
            elevation: 7.0,
            color: whiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.access_time, color: greyColor, size: 25.0),
                      widthSpace,
                      Text(
                        'Delivery by',
                        style: greyNormalTextStyle,
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        '4:10 PM',
                        style: blackLargeTextStyle,
                      ),
                    ],
                  ),
                ),
                getDevider(),
                Padding(
                  padding: const EdgeInsets.only(top: 30,bottom: 30),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20,top: 20,),
                                  height: 4,
                                  width: width-100,
                                  color: Colors.grey,
                                ),
                                Row(children: [
                                  StatutsWidget("orderplaced","Order Placed",true),
                                  StatutsWidget("preparing","Preparing",false),
                                  StatutsWidget("delivering","Dispatched",false),
                                  StatutsWidget("delivered","Delivered",false)
                                ],)
                              ],
                            ),
                            widthSpace,
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                getDevider(),
                Container(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: AssetImage('assets/delivery_boy.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          widthSpace,
                          Text(
                            'Peter Jones',
                            style: blackLargeTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.chat_bubble_outline,
                                color: greyColor, size: 28.0),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon:
                                Icon(Icons.call, color: greyColor, size: 28.0),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                getDevider(),
                Container(
                  padding: EdgeInsets.all(fixPadding * 2.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '4 items - \$20',
                            style: blackHeadingTextStyle,
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: OrderDetails(widget.order)));


                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Order Details',
                                  style: blueSmallTextStyle,
                                ),
                                SizedBox(width: 3.0),
                                Icon(Icons.arrow_forward_ios,
                                    size: 10.0, color: greyColor),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Paid successfully',
                            style: greySmallTextStyle,
                          ),
                          SizedBox(width: 5.0),
                          Container(
                            width: 30.0,
                            height: 30.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              color: Colors.deepPurple.withOpacity(0.16),
                            ),
                            child: Icon(Icons.check,
                                color: Colors.deepPurple, size: 18.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: RouteMap(
          sourceLat: 51.5075132,
          sourceLang: -0.1279052,
          destinationLat: 51.5192763,
          destinationLang: -0.1237237),
    );
  }

  getDevider() {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 1.0,
      color: Colors.grey[200],
    );
  }

  Widget StatutsWidget(String img, String status, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/TrackOrder/$img.png"),
                      fit: BoxFit.contain
                  ),
                  shape: BoxShape.circle,
                  color: (isActive) ? Colors.orange : Colors.white,
                  border: Border.all(
                      color: (isActive) ? Colors.transparent : Colors.orange,
                      width: 2
                  )
              ),
            ),
            SizedBox(width: 20,),
          ],
        ),
          SizedBox(height: 5,),
          Column(
            children: [
              Text(status,style: TextStyle(
                  color: (isActive) ? Colors.orange : Colors.black)
                ,)
            ],
          )
        ],

      ),
    );
  }
}
