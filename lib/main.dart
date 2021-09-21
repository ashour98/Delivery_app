import 'package:courier_pro/appBehaviour/my_behaviour.dart';
import 'package:courier_pro/constant/constant.dart';
import 'package:courier_pro/pages/cart_address/cart.dart';
import 'package:courier_pro/pages/courier/Electronics/Electronics_Item.dart';
import 'package:courier_pro/pages/courier/Flowers/Flowers_Item.dart';
import 'package:courier_pro/pages/courier/Pharmacies/Medicine_Item.dart';
import 'package:courier_pro/pages/orders/OrderDetails.dart';
import 'pages/courier/Grocery/Grocery_items.dart';
import 'pages/courier/Food/restaurant_items.dart';
import 'package:courier_pro/pages/splashScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:courier_pro/pages/courier/ItemInfo.dart';
import 'package:provider/provider.dart';

import 'Shared/CartItem.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(EasyLocalization(

      supportedLocales: [Locale('ar', 'QA'), Locale('en', 'QA')],
      path: 'lib/locale',
      fallbackLocale: Locale('en', 'QA'),
      child: MyApp(),
    ));
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
    ChangeNotifierProvider<CartItem>(
    create: (context) => CartItem(),
    )
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Courier Pro User',
        routes: {
          "ItemInfo": (context)=> ItemInfo(),
          "RestaurantItems": (context)=> RestaurantItems(),
          "Cart":(context)=> Cart(),
          "GroceryItems": (context)=> GroceryItems(),
          "FlowersItem": (context)=> FlowersItem(),
          'ElectronicsItem':(context)=> ElectronicsItem(),
          'MedicineItem':(context)=> MedicineItem(),
         // 'OrderDetails':(context)=> OrderDetails(),
        },
        theme: ThemeData(
          primarySwatch: Colors.orange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          primaryColor: primaryColor,
          fontFamily: 'Mukta',
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor,
          ),
          tabBarTheme: TabBarTheme(
            labelColor: greyColor,
          ),
        ),
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child,
          );
        },
        home: SplashScreen(),
      ),
    );
  }
}
