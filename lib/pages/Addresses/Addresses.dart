import 'package:courier_pro/FireBase/Store.dart';
import 'package:courier_pro/Model/Addres.dart';
import 'package:courier_pro/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:courier_pro/pages/Addresses/AddLocation.dart';
import 'package:courier_pro/pages/Loading.dart';

class Addresses extends StatefulWidget {
  @override
  _AddressesState createState() => _AddressesState();
}

class _AddressesState extends State<Addresses> {
  List<Address> _ADDRES = [];

  Future<void> getdata() async {
    _ADDRES = await Store.GetAddress();
  }

bool loading=true;
  @override
  void initState() {
    loading = true;
    // TODO: implement initState
    getdata().then((value) => setState((){
      loading=false;

    }));
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusAppBar = MediaQuery.of(context).padding.top;

    return loading ? Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    ):Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Addresses',
            style: blackLargeTextStyle,
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.add_location_alt_rounded,
                  color: primaryColor,
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: AddLocation()));
                })
          ],
        ),
        body: ListView(
          children: [
            FutureBuilder<List<Address>>(
              future: Store.GetAddress(),
                builder: (context, snapshot) {
              if (_ADDRES.isNotEmpty) {
                return Container(
                  height: screenHeight -
                      statusAppBar -
                      appBarHeight -
                      (screenHeight * .09),
                  child: ListView.builder(
                      itemCount: _ADDRES.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          key: Key(_ADDRES[index].toString()),
                          onDismissed: (direction) {
                            Store.DeleteAddress(_ADDRES[index].AId);
                          _ADDRES.removeAt(index);
                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Item Dismissed')));
                          },
                          background: Container(
                            child: Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 40,
                                )),
                            color: Colors.red,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: screenHeight * .17,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                            "Area: ",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight:
                                                FontWeight.bold)),
                                      Text(
                                        _ADDRES[index].Area,
                                        style: TextStyle(
                                            fontSize: 18,
                                            ),
                                      ),
                                    ],),
                                    Row(
                                      children: [
                                      Text(
                                          "Street Name: ",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight:
                                              FontWeight.bold)),
                                      Expanded(
                                        child: Text(
                                          _ADDRES[index].Street,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],),
                                    Row(children: [
                                      Text(
                                        "Mobile Number: ",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight.bold)),
                                      Text(
                                        _ADDRES[index].MobileNum,
                                        style: TextStyle(
                                            fontSize: 18,
                                          ),
                                      ),
                                    ],)
                                  ],
                                ),
                              )
                            ),
                          ),
                        );
                      }),
                );
              }
              else {
                return Container(
                    height: screenHeight -
                        (screenHeight * .09) -
                        appBarHeight -
                        statusAppBar,
                    child: Center(
                        child: Text(
                      'No Addresses',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    )));
              }
            }),
          ],
        ));
  }
}
