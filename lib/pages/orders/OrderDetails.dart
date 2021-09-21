import 'package:courier_pro/FireBase/Store.dart';
import 'package:courier_pro/Model/Item.dart';
import 'package:courier_pro/Model/orders.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  final orders order;
  OrderDetails(this.order);
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order details'),
      ),
      body: Column(
        children: [
          FutureBuilder<List<Item>>(
            future: Store.OrderDetails(),
            builder: (context ,snapshot) {
            return Container(
              child: Expanded(
                child: ListView.builder(
                  itemCount: widget.order.list.length,
                itemBuilder:(context, index) =>
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Row(children: [
                          Text(widget.order.list[index].name ),
                          Text('\ (${widget.order.list[index].quantity.toString()})'),],),
                        Text('\QR ${widget.order.list[index].price * widget.order.list[index].quantity}'),
                      ],),
                    ),
            ),
              )
            ,);},
          ),
        ],
      ),
    );
  }
}
