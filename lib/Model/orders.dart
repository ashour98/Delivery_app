import 'package:courier_pro/Model/Item.dart';

class orders{
  var id;
  var user_id;
  var merchant_id;
  var product_id;
  var product_quantity;
  var order_total;
  var status_id;
  var merchantImage;
  var merchantName;
  var product_name;
  var Date;
List<Item> list;
  orders({this.id,this.user_id,this.merchant_id,this.product_id,this.product_quantity,this.order_total,this.status_id,this.merchantImage,this.merchantName,this.Date,this.list});
}