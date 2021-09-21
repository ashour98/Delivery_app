import 'package:courier_pro/constant/constant.dart';
import 'restaurant_items.dart';
import 'package:flutter/material.dart';
import 'package:courier_pro/Model/merchants.dart';
import 'package:provider/provider.dart';

import '../../../Shared/CartItem.dart';

class GetFoodDeliver extends StatefulWidget {
  @override
  _GetFoodDeliverState createState() => _GetFoodDeliverState();
}

class _GetFoodDeliverState extends State<GetFoodDeliver> {
  final _restaurantsList = [
    merchants(
        name: 'Bar 61 Restaurant',
        type: 'Beverages, Snacks',
        address: '76A England',
        photo: 'assets/restaurant/restaurant_5.png',
        time: '15 mins',
        delivery: 'Free Delivery',
        offer: '20% off upto \$2'
    ),
    merchants(
        name: 'Core by Clare Smyth',
        type: 'Beverages, Fast Food',
        address: '220 Opera Street',
        photo: 'assets/restaurant/restaurant_4.png',
        time: '20 mins',
        delivery: '',
        offer: ''
    ),
    merchants(
        name: 'Amrutha Lounge',
        type: 'Full Meal',
        address: '90B Silicon Velley',
        photo: 'assets/restaurant/restaurant_3.png',
        time: '25 mins',
        delivery: 'Free Delivery',
        offer: '25% off on order above \$5'
    ),
    merchants(
        name: 'The Barbary',
        type: 'Desserts',
        address: '99C OBC Area',
        photo: 'assets/restaurant/restaurant_2.png',
        time: '28 mins',
        delivery: 'Free Delivery',
        offer: '20% off upto \$3'
    ),
    merchants(
        name: 'The Palomar',
        type: 'American Fastfood',
        address: '31A Om Colony',
        photo: 'assets/restaurant/restaurant_1.png',
        time: '15 mins',
        delivery: 'Free Delivery',
        offer: '15% off upto \$5'
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Hero(
      tag: 'Get Food Deliver',
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 1.0,
          titleSpacing: 0.0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Restaurants', style: appBarTextStyle),
              Text('285 Stores', style: greySmallTextStyle),
            ],
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: blackColor),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: ListView.builder(
          itemCount: _restaurantsList.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final List<merchants> item = _restaurantsList;
            return InkWell(
              onTap: () {

                Navigator.pushNamed(context,"RestaurantItems",arguments:_restaurantsList[index]);
                CartItem cartitem= Provider.of<CartItem>(context, listen: false);
                cartitem.rests.clear();
                cartitem.Markets.clear();
                cartitem.AddRest(_restaurantsList[index]);
                cartitem.items.clear();

              },
              child: Container(
                width: width,
                margin: (index == 0)
                    ? EdgeInsets.all(fixPadding * 2.0)
                    : EdgeInsets.only(
                        right: fixPadding * 2.0,
                        left: fixPadding * 2.0,
                        bottom: fixPadding * 2.0),
                padding: EdgeInsets.all(fixPadding),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      item[index].photo,
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.fitHeight,
                    ),
                    widthSpace,
                    Container(
                      width: (width - (fixPadding * 6.0 + 10.0 + 100.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item[index].name,
                            style: appBarBlackTextStyle,
                          ),
                          Text(item[index].type, style: primaryColorSmallTextStyle),
                          Text(item[index].address, style: inputTextStyle),
                          SizedBox(height: 3.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.timer,
                                  color: primaryColor, size: 18.0),
                              SizedBox(width: 5.0),
                              Text(
                                (item[index].delivery != '')
                                    ? '${item[index].time}, ${item[index].delivery}'
                                    : '${item[index].time} delivery',
                                style: TextStyle(color: primaryColor),
                              ),
                            ],
                          ),
                          (item[index].offer != '')
                              ? SizedBox(height: 5.0)
                              : Container(),
                          (item[index].offer != '')
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.local_offer,
                                        color: Colors.deepPurple, size: 18.0),
                                    SizedBox(width: 5.0),
                                    Text(
                                      item[index].offer,
                                      style:
                                          TextStyle(color: Colors.deepPurple),
                                    ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
