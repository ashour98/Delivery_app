import 'package:courier_pro/Model/Item.dart';
import 'package:flutter/cupertino.dart';

import '../Model/Addres.dart';
import '../Model/Addres.dart';
import '../Model/merchants.dart';
class CartItem extends ChangeNotifier{
  List<Item> items= [];

  AddItem(Item item){
    items.add(item);
    notifyListeners();

  }

  List<merchants> rests=[];
  List<merchants> Markets=[];

  AddMarket(merchants Market){
    Markets.add(Market);
    notifyListeners();
  }

  AddRest(merchants rest){
    rests.add(rest);
    notifyListeners();
  }

  int total_price;
  AddTotalPrice(int totalprice){
    total_price= totalprice;
    notifyListeners();
  }

  List<Address> address=[];
  AddAddress(Address adres){
    address.add(adres);
  }



}