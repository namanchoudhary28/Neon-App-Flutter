import 'package:BOARDING/edit_loading.dart';
import 'package:BOARDING/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:provider/provider.dart';
import 'package:BOARDING/signup.dart';
import 'package:BOARDING/login_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:BOARDING/main_loading_screen.dart';
import 'package:BOARDING/loading_login.dart';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';

class EDITINFO extends StatefulWidget {
  final String name;
  final String aboutme;
  final String location;
  final List communication;

  const EDITINFO(this.name, this.aboutme, this.location, this.communication);

  @override
  _EDITINFOState createState() => _EDITINFOState();
}

class _EDITINFOState extends State<EDITINFO> {
  var _name; //accesing name
  var _location; //accesing location
  var _about; //acessing about me
  var _phoneno; //acessing phone no
  var _whatsappno; //acessing whatsappno
  var _skypeno; //acessing skype no
  var _linkedin; //acessing linkedin
  var _twitter; //acessing twitter
  var _facebook; //acessing facebook
  final namecon = new TextEditingController();

  final locationcon = new TextEditingController();
  final aboutcon = new TextEditingController();
  final phonecon = new TextEditingController();
  final whatsappnocon = new TextEditingController();
  final skypenocon = new TextEditingController();
  final linkedincon = new TextEditingController();
  final twittercon = new TextEditingController();
  final facebookcon = new TextEditingController();

  @override
  void initState() {
    namecon.text = widget.name;
    aboutcon.text = widget.aboutme;
    locationcon.text = widget.location;
    for (int i = 0; i < widget.communication.length; i++) {
      String medium = widget.communication[i]['medium'];
      if (medium == 'phone') {
        phonecon.text = widget.communication[i]['medium_url'];
      }
      if (medium == 'whatsapp') {
        whatsappnocon.text = widget.communication[i]['medium_url'];
      }
      if (medium == 'skype') {
        skypenocon.text = widget.communication[i]['medium_url'];
      }
      if (medium == 'facebook') {
        facebookcon.text = widget.communication[i]['medium_url'];
      }
      if (medium == 'twitter') {
        twittercon.text = widget.communication[i]['medium_url'];
      }
      if (medium == 'linkedin') {
        linkedincon.text = widget.communication[i]['medium_url'];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final basicname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network(
                'https://img.icons8.com/metro/24/000000/info.png'),
            onTap: () {
              //      Navigator.push(context,MaterialPageRoute(builder: (context){

              // return new MyApp();

              // }));
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'BASIC',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );

    final name = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: namecon,
        decoration: InputDecoration(
            labelText: 'Name',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
    final location = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: locationcon,
        decoration: InputDecoration(
            labelText: 'Location',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Location is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
    final communicationname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network(
                'https://img.icons8.com/material/24/000000/phone--v1.png'),
            onTap: () {
              //      Navigator.push(context,MaterialPageRoute(builder: (context){

              // return new MyApp();

              // }));
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'COMMUNICATION',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
    final phone = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: phonecon,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Phone No',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Phone no is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
    final whatsapp = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: whatsappnocon,
        keyboardType: TextInputType.number,

        decoration: InputDecoration(
            labelText: 'Whatsapp',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'whatsapp no is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
    final skype = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: skypenocon,
        decoration: InputDecoration(
            labelText: 'Skype',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'skype id is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );

    final linkedin = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: linkedincon,
        decoration: InputDecoration(
            labelText: 'Linkedin',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'linkdin id is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
    final twitter = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: twittercon,
        decoration: InputDecoration(
            labelText: 'Twitter',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'twitter link is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
    final facebook = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: facebookcon,
        decoration: InputDecoration(
            labelText: 'Facebook',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'facebook id is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
    final aboutname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network(
                'https://img.icons8.com/android/24/000000/pencil.png'),
            onTap: () {
              //      Navigator.push(context,MaterialPageRoute(builder: (context){

              // return new MyApp();

              // }));
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'ABOUT ME',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
    final aboutme = TextField(
      controller: aboutcon,
      decoration: InputDecoration(
          labelText: "About",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
      maxLines: 6,
    );
    Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: facebookcon,
        decoration: InputDecoration(
            labelText: 'write here',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)),
        // maxLength: 10,
        maxLines: 5,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );

    var checkBoxvalue = false;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Info"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          basicname,

          name,
          SizedBox(
            height: 20,
          ),
          location,
          SizedBox(
            height: 20,
          ),
          communicationname,

          phone,
          whatsapp,
          skype,
          linkedin,
          twitter,
          facebook,
          SizedBox(
            height: 20,
          ),

          aboutname,
          aboutme,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  padding: EdgeInsets.all(15),
                  color: Colors.blue,
                  child: Row(children: <Widget>[
                    Icon(Icons.cancel, color: Colors.white),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text('Cancel',
                        style: TextStyle(color: Colors.white, fontSize: 15.0)),
                  ]),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),

                    // onPressed: (){

                    //   // Navigator.push(context,MaterialPageRoute(builder: (context){
                    //   //   return new HomePage();

                    //   // }));
                    //   // Navigator.of(context).pushNamed(HomePage.tag);
                    // },
                    padding: EdgeInsets.all(15),
                    color: Colors.blue,
                    onPressed: () {
                      setState(() {
                        _name = namecon.text;
                        _location = locationcon.text;
                        _about = aboutcon.text;
                        _phoneno = phonecon.text;
                        _whatsappno = whatsappnocon.text;
                        _skypeno = skypenocon.text;
                        _linkedin = linkedincon.text;
                        _twitter = twittercon.text;
                        _facebook = facebookcon.text;
                      });
                      List<String> commu = [
                        _phoneno,
                        _whatsappno,
                        _skypeno,
                        _linkedin,
                        _twitter,
                        _facebook
                      ];
                      print(_name);

                      /*Fluttertoast.showToast(
                        msg: 'Your info is being edited...',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 3,
                        backgroundColor: Colors.grey,
                        textColor: Colors.white,
                        fontSize: 14.0
                    );*/

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoadingScreenEdit(
                            _name, _location, _about, commu);
                      }));
                    },
                    child: Row(children: <Widget>[
                      Icon(Icons.save, color: Colors.white),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('Save',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
                    ])),
              ),
              // Text("your name is $_name and your location is $_location "),
            ],
          ),

        ],
      ),
    );
  }
}
