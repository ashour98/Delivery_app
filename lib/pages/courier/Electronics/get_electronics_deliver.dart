import 'package:courier_pro/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:courier_pro/Model/merchants.dart';
import 'package:provider/provider.dart';

import '../../../../Shared/CartItem.dart';

class GetElectronicsDeliver extends StatefulWidget {
  @override
  _GetElectronicsDeliverState createState() => _GetElectronicsDeliverState();
}

class _GetElectronicsDeliverState extends State<GetElectronicsDeliver> {
  final _electronicsList = [
    merchants(
        name: 'Virgin Mega Store',
        type: 'Beverages, Snacks',
        address: '76A England',
        photo: 'assets/grocery/lulu.jpg',
        time: '15 mins',
        delivery: 'Free Delivery',
        offer: '20% off upto \$2'
    ),
    merchants(
        name: 'Al Meraa',
        type: 'Beverages, Fast Food',
        address: '220 Opera Street',
        photo: 'assets/grocery/Meraa.jpg',
        time: '20 mins',
        delivery: '',
        offer: ''
    ),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Hero(
      tag: 'Electronics',
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 1.0,
          titleSpacing: 0.0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Grocery', style: appBarTextStyle),
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
          itemCount: _electronicsList.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final List<merchants> item = _electronicsList;
            return InkWell(
              onTap: () {

                Navigator.pushNamed(context,"ElectronicsItem",arguments:_electronicsList[index]);
                CartItem cartitem= Provider.of<CartItem>(context, listen: false);
                cartitem.rests.clear();
                cartitem.Markets.clear();
                cartitem.AddRest(_electronicsList[index]);
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
