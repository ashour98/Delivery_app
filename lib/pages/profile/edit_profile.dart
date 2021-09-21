import 'dart:async';
import 'dart:io';
import 'package:courier_pro/FireBase/Store.dart';
import 'package:courier_pro/Model/userinfo.dart';
import 'package:courier_pro/constant/constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';






class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  List<userinfo> User=[] ;
  bool loading=true;


  Future<void> getdata() async {
      User = await Store.GetUser();
      try{
        if(User != null){
          _name = User.last.fullname;
          imageUrl = User.last.photo;
          _phone= User.last.Phone;
          _email= User.last.Email;
          _newPassword= User.last.Password;
        }
      }
    catch (e){
        print(e);
    }
  }

  String _name ;
  String _phone ;
  String _email ;
  String _newPassword;
  String _ConfirmPassword;
  File _image;
  var imageUrl;

  Future getImage() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);


    setState(() {
      if (image != null) {
        _image = image;
      }

      else {
        print('No image selected.');
      }
    });
  }
  Future TakePhoto() async {
    final camera = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      if(camera != null){
        _image = camera;
      }
      else {
        print('No image selected.');
      }
    });
  }

  Future uploadPic(BuildContext context)async{
    String FileName = basename(_image.path);
    StorageReference fireBaseStorageRef=FirebaseStorage.instance.ref().child(FileName);
    StorageUploadTask uploadtask =fireBaseStorageRef.putFile(_image);
    StorageTaskSnapshot taskSnapshot = await uploadtask.onComplete;
    taskSnapshot.ref.getDownloadURL().then((value) => {
      print('doneeeeeeee $value'),
      imageUrl =value
    });


  }



  var nameController = TextEditingController();
  var NewPassController = TextEditingController();
  var ConPassController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
     loading =true;
    getdata().then((value) {
      setState(() {
        loading = false;
        print(_name);
        print(imageUrl);
      });
    });
    _name = nameController.text ;
    _phone = phoneController.text ;
    _email = emailController.text  ;
    _newPassword = NewPassController.text  ;
    _ConfirmPassword = ConPassController.text  ;
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    changeFullName() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 210.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Change Full Name",
                    style: blackHeadingTextStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: nameController,
                    style: blackBottonTextStyle,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Full Name',
                      hintStyle: greySmallTextStyle,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Cancel',
                            style: blackBottonTextStyle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _name = nameController.text;
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Okay',
                            style: whiteBottonTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    changePassword() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 300.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Change Your Password",
                    style: blackHeadingTextStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Signika Negative',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Old Password',
                      hintStyle: greySmallTextStyle,
                    ),
                  ),
                  TextField(
                    controller: NewPassController,
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Signika Negative',
                    ),
                    decoration: InputDecoration(
                      hintText: 'New Password',
                      hintStyle: greySmallTextStyle,
                    ),
                  ),
                  TextField(
                    controller: ConPassController,
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Signika Negative',
                    ),
                    decoration: InputDecoration(
                      hintText: 'Confirm New Password',
                      hintStyle: greySmallTextStyle,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Cancel',
                            style: blackBottonTextStyle,
                          ),
                        ),
                      ),
                   InkWell(
                          onTap: () {
                            if(NewPassController.text == ConPassController.text) {
                              _newPassword= NewPassController.text;
                              Navigator.pop(context);
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password not correct'),));
                            }
                            },
                          child: Container(
                            width: (width / 3.5),
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              'Okay',
                              style: whiteBottonTextStyle,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    changePhoneNumber() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 200.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Change Phone Number",
                    style: blackHeadingTextStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: phoneController,
                    style: blackHeadingTextStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Phone Number',
                      hintStyle: greySmallTextStyle,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Cancel',
                            style: blackBottonTextStyle,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _phone = phoneController.text;
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Okay',
                            style: whiteBottonTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    changeEmail() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          // return object of type Dialog
          return Dialog(
            elevation: 0.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Container(
              height: 200.0,
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Change Email",
                    style: blackHeadingTextStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: emailController,
                    style: blackHeadingTextStyle,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email Address',
                      hintStyle: greySmallTextStyle,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text('Cancel', style: blackBottonTextStyle),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _email = emailController.text;
                            Navigator.pop(context);
                          });
                        },
                        child: Container(
                          width: (width / 3.5),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Text(
                            'Okay',
                            style: whiteBottonTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return loading ? Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    )
    :Scaffold(
      backgroundColor: scaffoldBgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: blackColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          InkWell(
            onTap: () {
              uploadPic(context).then((value) {
                Timer(Duration(seconds: 3), () {
                  print("Yeah, this line is printed after 3 seconds");
                  setState(() {
                    print(imageUrl);
                    print("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
                    print(imageUrl);
                    Store.AddUser(userinfo(
                        fullname: _name,
                        Password: _newPassword,
                        Phone: _phone,
                        Email: _email,
                        photo: imageUrl
                    ));
                    Navigator.pop(context);
                  });
                });


                // ignore: unnecessary_statements

              });

            },
            child: Container(
              padding: EdgeInsets.all(fixPadding),
              alignment: Alignment.center,
              child: Text(
                'Save',
                style: blueSmallTextStyle,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
          children: <Widget>[
      FutureBuilder<List<userinfo>>(
          future: Store.GetUser(),
        builder: (context, index) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Profile Image Start
              InkWell(
                onTap: () {
                  _selectOptionBottomSheet(context);
                },
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  margin: EdgeInsets.all(fixPadding * 4.0),
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(width: 2.0, color: whiteColor),
                    image: DecorationImage(
                      image: (imageUrl==null||imageUrl==""||imageUrl=="null") ? (_image !=null ? FileImage(_image) : AssetImage('assets/user.jpg')) : _image !=null ? FileImage(_image): NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    height: 22.0,
                    width: 22.0,
                    margin: EdgeInsets.all(fixPadding / 2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.0),
                      border: Border.all(
                          width: 1.0, color: whiteColor.withOpacity(0.7)),
                      color: Colors.orange,
                    ),
                    child: Icon(Icons.add, color: whiteColor, size: 15.0),
                  ),
                ),
              ),
              // Profile Image End
              // Full Name Start
              InkWell(
                onTap: changeFullName,
                child: getTile('Full Name', _name, context),
              ),
              // Full Name End
              // Password Start
              InkWell(
                onTap: changePassword,
                child: getTile('Password', _newPassword, context),
              ),
              // Password End
              // Phone Start
              InkWell(
                onTap: changePhoneNumber,
                child: getTile('Phone', _phone, context),
              ),
              // Phone End
              // Email Start
              InkWell(
                onTap: changeEmail,
                child: getTile('Email', _email, context),
              ),
              // Email End
            ],
          );
        }),
          ],
        ),
    );
  }

  getTile(String title, String value, context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
          right: fixPadding, left: fixPadding, bottom: fixPadding * 1.5),
      padding: EdgeInsets.only(
        right: fixPadding,
        left: fixPadding,
        top: fixPadding * 2.0,
        bottom: fixPadding * 2.0,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 1.5,
            spreadRadius: 1.5,
            color: Colors.grey[200],
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: width - 80.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: (width - 80.0) / 2.4,
                  child: Text(
                    title,
                    style: greyNormalTextStyle,
                  ),
                ),
                Container(
                  width: (width - 80.0) / 2.0,
                  child: Text(
                    value,
                    style: blackHeadingTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16.0,
            color: Colors.grey.withOpacity(0.6),
          ),
        ],
      ),
    );
  }

  // Bottom Sheet for Select Options (Camera or Gallery) Start Here
  void _selectOptionBottomSheet(context) {
    double width = MediaQuery.of(context).size.width;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: whiteColor,
            child: new Wrap(
              children: <Widget>[
                Container(
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: width,
                          padding: EdgeInsets.all(10.0),
                          child: Text(
                            'Choose Option',
                            textAlign: TextAlign.center,
                            style: blackHeadingTextStyle,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            TakePhoto();
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: width,
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.camera_alt,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text('Camera', style: inputTextStyle),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            getImage();
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: width,
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.photo_album,
                                  color: Colors.black.withOpacity(0.7),
                                  size: 18.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Upload from Gallery',
                                  style: inputTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
  // Bottom Sheet for Select Options (Camera or Gallery) Ends Here
}
