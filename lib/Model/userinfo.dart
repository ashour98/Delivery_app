
import 'dart:io';

import 'package:flutter/material.dart';

class userinfo {
  int id;
  String fullname;
  int countryCode;
  String Password;
  String Phone;
  String Email;
  String address;
  String address_It;
  String address_In;
  File image;
  String photo;
  String APN;

  userinfo({
    this.id,
    this.fullname,
    this.countryCode,
    this.Password,
    this.Phone,
    this.Email,
    this.address,
    this.address_It,
    this.address_In,
    this.image,
    this.photo,
    this.APN,
  });
}
