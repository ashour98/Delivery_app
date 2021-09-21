import 'package:courier_pro/constant/constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Language_page extends StatefulWidget {
  @override
  _Language_pageState createState() => _Language_pageState();
}

String dropdownValue = 'English';

class _Language_pageState extends State<Language_page> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 300),
        child: ListView(
          children: <Widget>[
            Center(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Select Language  ||  اختر اللغة ',
                        style: blackExtraLargeTextStyle)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  width * 0.1, 0, width * 0.1, 0),
              child: new Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                elevation: 10,
                child: Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.all(
                          Radius.circular(20.0),
                        )),
                    width: width / 1.2,
                    child: Padding(
                      padding:
                      EdgeInsets.fromLTRB(height * 0.03, 0, 0, 0),
                      child: MyStatefulWidget(),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      underline: Container(
        height: 0,
        color: Colors.white,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
        SharedPreferences.getInstance().then((SharedPreferences sp) {
          if (dropdownValue == "English") {
            setState(() {
              sp.setString('Lang', 'EN');
              sp.setBool('auth', true);
              //  context.locale = Locale('en', 'JO');

              EasyLocalization.of(context).setLocale(Locale("en", "QA"));
            });
          } else {
            setState(() {
              sp.setString('Lang', 'AR');
              //  context.locale = Locale('ar', 'JO');
              sp.setBool('auth', true);

              EasyLocalization.of(context).setLocale(Locale("ar", "QA"));
            });
          }
        });
      },
      items: <String>['English', 'عربية']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
