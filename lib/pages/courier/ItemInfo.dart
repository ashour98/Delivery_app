import 'package:courier_pro/Shared/CartItem.dart';
import 'package:courier_pro/constant/constant.dart';
import 'package:courier_pro/pages/cart_address/cart.dart';
import 'package:flutter/material.dart';
import 'package:courier_pro/Model/Item.dart';
import 'package:provider/provider.dart';

class ItemInfo extends StatefulWidget {

  @override
  _ItemInfoState createState() => _ItemInfoState();
}

class _ItemInfoState extends State<ItemInfo> {
  int _quantity = 1;
  @override
  Widget build(BuildContext context) {
    Item product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: blackColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(icon: Icon(Icons.shopping_cart,color: Colors.black), onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart()));
          })

        ],
      ),
      body:SingleChildScrollView(
        child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height*.4,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  fit: BoxFit.cover,
                  image: product.Image!=null ?AssetImage(product.Image) : NetworkImage(
                      'https://media-cdn.tripadvisor.com/media/photo-s/17/3b/9a/d2/burger-king.jpg'),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  color: Colors.white,
                  height: MediaQuery.of(context).size.height*0.55,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          product.desc,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '\$${product.price}',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Material(
                                color: primaryColor,
                                child: GestureDetector(
                                  onTap: Add,
                                  child: SizedBox(
                                    child: Icon(Icons.add),
                                    height: 28,
                                    width: 28,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              _quantity.toString(),
                              style: TextStyle(fontSize: 50),
                            ),
                            ClipOval(
                              child: Material(
                                color: primaryColor,
                                child: GestureDetector(
                                  onTap: subtract,
                                  child: SizedBox(
                                    child: Icon(Icons.remove),
                                    height: 28,
                                    width: 28,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .06,
                          child: Builder(
                            builder: (context) => RaisedButton(
                              child: Text(
                                'Add to Cart',
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                CartItem cartitem= Provider.of<CartItem>(context, listen: false);
                                product.quantity=_quantity;
                                cartitem.AddItem(product);
                                Scaffold.of(context).showSnackBar(SnackBar(content: Text('Added')));

                              },
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                    /**/


              )
            ],
          ),
      ),
    );
  }

  void subtract() {
    if (_quantity > 0) {
      setState(() {
        _quantity--;
      });
    }
  }

  void Add() {
    setState(() {
      _quantity++;
    });
  }



}
