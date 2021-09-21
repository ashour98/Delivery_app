
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:courier_pro/Model/Addres.dart';
import 'package:courier_pro/Model/merchants.dart';
import 'package:courier_pro/Model/userinfo.dart';
import 'package:courier_pro/constant/constant.dart';
import '../Model/Item.dart';
import '../constant/constant.dart';

class Store{
  // ignore: non_constant_identifier_names
  static void DeleteAddress(id){
    FirebaseFirestore.instance.collection(kADDRESS).doc(id).delete();
  }

// ignore: non_constant_identifier_names
static void AddAddress(Address address){
  FirebaseFirestore.instance.collection(kADDRESS).add({
    kArea: address.Area,
    kAddresslat: address.address_lat,
    kAddresslng: address.address_lng,
    kAddressType: address.AddressType,
    kStreet: address.Street,
    kAdditionalInfo: address.AdditionalInfo,
    kMobile: address.MobileNum,

  });
}
  static void AddUser(userinfo profile){
    FirebaseFirestore.instance.collection(kUserInfo).doc().set({
      kUserName: profile.fullname,
      kPassword: profile.Password,
      kPhone: profile.Phone,
      kEmail: profile.Email,
      kUserPhoto: profile.photo,
    });
  }


  static Future<List<userinfo>> GetUser()async{
    var snap = await FirebaseFirestore.instance.collection(kUserInfo).get();
    List <userinfo> User=[];
    for(var doc in snap.docs){
      var data = doc.data();
      User.add(userinfo(
          fullname: data[kUserName],
          Email:  data[kEmail],
          Password: data[kPassword],
          Phone: data[kPhone],
          photo: data[kUserPhoto]
      ));
    }
    return User;
  }


static Future<List<Address>> GetAddress()async{
    var snap = await FirebaseFirestore.instance.collection(kADDRESS).get();
    List <Address> address=[];
    for(var doc in snap.docs){
      var data = doc.data();
      address.add(Address(
        AId: doc.id,
        Area: data[kArea],
        Street: data[kStreet],
        AdditionalInfo: data[kAdditionalInfo],
        AddressType: data[kAddressType],
        MobileNum: data[kMobile]
      ));
    }
    return address;
}

static StoreProduct(data,List<Item> products,List<Address> address,List<merchants> rests,int price,var Time){

    DocumentReference CR =FirebaseFirestore.instance.collection(kOrders).doc('444').collection("Active").doc();//todo 444 must be user uid

  CR.set({
    kTotalPrice:price,
    kRestaurant:rests[0].name,
    kRestPhoto:rests[0].photo,
    kDate:Time.toString(),
'address':address[0].Area+","+address[0].MobileNum


  });

    for(var product in products) {
     CR.collection('orders').doc().set({
        kItemName: product.name,
        kItemQuantity:product.quantity,
        kItemPrice:product.price,
      });
    }
    // CR.doc('address').collection(kADDRESS).doc().set({
    //   kArea: address[0].Area,
    //   kAddressType:address[0].AddressType,
    //   kStreet:address[0].Street,
    //   kAdditionalInfo:address[0].AdditionalInfo,
    //   kMobile:address[0].MobileNum,
    // });


}

  static Stream<QuerySnapshot> loadOrders(){
    return FirebaseFirestore.instance.collection(kOrders).snapshots();
  }

  static Future<List<Item>> OrderDetails()async{
    var snap = await FirebaseFirestore.instance.collection(kOrders).doc().collection(kOrderDetails).get();
    List <Item> OrderDetails=[];
    for(var doc in snap.docs){
      var data = doc.data();
      OrderDetails.add(Item(
          name: data[kItemName],
          quantity: data[kItemQuantity],
          price: data[kItemPrice],
      ));
    }

    print("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
    print(OrderDetails[0].name);
    return OrderDetails;
  }

}