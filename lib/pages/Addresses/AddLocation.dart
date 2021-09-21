import 'dart:async';
import 'dart:convert';

import 'package:courier_pro/FireBase/Store.dart';
import 'package:courier_pro/Model/Addres.dart';
import 'package:courier_pro/constant/constant.dart';
import 'package:courier_pro/pages/Addresses/Addresses.dart';
import 'package:flutter/material.dart';
import 'package:courier_pro/pages/Loading.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';

import '../../constant/key.dart';
import '../courier/send_packages.dart';



class AddLocation extends StatefulWidget {


  @override
  _AddLocationState createState() => _AddLocationState();
}

class _AddLocationState extends State<AddLocation> {

  getCurrentPosotion(){

  }

  // For Pickup Address Screen
  PickResult selectedPickupPlace;
  bool pickupAddress = false;


  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  var location = TextEditingController();

  String _Area, _AddressType, _Street, _AdditionalInfo, _MobileNum, _addresslng, _addresslat;


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      appBar: AppBar(
        title: Text("New Address"),
      ),
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Container(
              height: height*0.3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      child: Text("Load Google Map"),
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PlacePicker(
                                apiKey: googleMapKey,
                                initialPosition: SendPackages.kInitialPosition,
                                useCurrentLocation: true,
                                selectInitialPosition: true,


                                //usePlaceDetailSearch: true,
                                selectedPlaceWidgetBuilder:
                                    (_, selectedPlace, state, isSearchBarFocused) {
                                  return isSearchBarFocused
                                      ? Container()
                                      : FloatingCard(
                                    bottomPosition: 0.0,
                                    leftPosition: 0.0,
                                    rightPosition: 0.0,
                                    width: 500,
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: state == SearchingState.Searching
                                        ? Center(
                                        child:
                                        CircularProgressIndicator())
                                        : ElevatedButton(
                                      child: Text("Pick This Place"),
                                      onPressed: () {
                                        print("---------------------");

                                        _addresslat= selectedPlace.geometry.location.lat.toString();
                                        _addresslng=selectedPlace.geometry.location.lng.toString();

                                        print(_addresslat);
                                        print(_addresslng);

                                        print("xmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm");
                                        print(selectedPlace.formattedAddress);
                                        location.text=selectedPlace.formattedAddress;
                                        Navigator.pop(
                                            context, selectedPlace);
                                        setState(() {});
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ).then((value) =>setState(() {
                           _Street=location.text;
                           print("xxxxxxxxxxxxxxxxxx");
                           print(_Street);


                        }));


                      },
                    ),
                    Container(
                      padding: EdgeInsets.all(fixPadding * 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Place marker on google map at pickup location',
                              style: greySmallTextStyle),
                          heightSpace,
                          (selectedPickupPlace == null)
                              ? Container()
                              : Text(selectedPickupPlace.formattedAddress ?? "",
                            textAlign: TextAlign.center,
                            style: inputTextStyle,
                          ),
                          (selectedPickupPlace == null) ? Container() : heightSpace,
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.all(fixPadding * 2.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heightSpace,
                  TextFormField(
                    onChanged: (value) {
                      _Area = value;
                    },
                    validator: (value) {
                      if (value.isEmpty)
                        return "Required";
                      else return null;
                    },                      style: inputTextStyle,
                    decoration: InputDecoration(
                      labelText: 'Area Name',
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'Area Name',
                      hintStyle: inputHintStyle,
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                  heightSpace,
                  TextFormField(
                    style: inputTextStyle,
                    onChanged: (value) {
                      _AddressType = value;
                    },
                    validator: (value) {
                      if (value.isEmpty)
                        return "Required";
                      else return null;

                    },
                    decoration: InputDecoration(
                      labelText: 'Address Type',
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'Home Number /Building Number /Flat Number',
                      hintStyle: inputHintStyle,
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                  heightSpace,
                  TextFormField(
                    controller: location,
                    style: inputTextStyle,
                    onChanged: (value) {
                        _Street = value;
                    },
                    validator: (value) {
                      if (value.isEmpty)
                        return "Required";
                      else return null;
                    },decoration: InputDecoration(

                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Colors.grey)),
                    hintText: 'Street Name',
                    labelText: 'Street Name',
                    hintStyle: inputHintStyle,
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                  ),
                  heightSpace,
                  TextFormField(
                    style: inputTextStyle,
                    onChanged: (value) {
                      _AdditionalInfo = value;
                      if(_AdditionalInfo == null)
                        return _AdditionalInfo=="";
                    },
                    decoration: InputDecoration(
                      labelText: 'Additional Info',
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'Additional Info (optional)',
                      hintStyle: inputHintStyle,
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                  heightSpace,
                  TextFormField(
                    style: inputTextStyle,
                    onChanged: (value) {
                      _MobileNum=value;
                    },
                    validator: (value) {
                      if (value.isEmpty)
                        return "Required";
                      else return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.grey)),
                      hintText: 'Mobile Number)',
                      hintStyle: inputHintStyle,
                      contentPadding: EdgeInsets.all(10.0),
                    ),
                  ),
                  heightSpace,
                ],
              ),
            ),
            // ignore: deprecated_member_use
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: RaisedButton(
                color: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text("Save Address"),
                  onPressed: (){
                  if(_globalKey.currentState.validate()){
                    _globalKey.currentState.save();

                    Store.AddAddress(Address(
                      Area: _Area,
                      AdditionalInfo: _AdditionalInfo,
                      address_lat: _addresslat,
                      address_lng: _addresslng,
                      AddressType: _AddressType,
                      Street: _Street,
                      MobileNum: _MobileNum,
                    ));
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Addresses(),));
                  }




              }),
            )
          ],
        ),
      ),
    );
  }
}
