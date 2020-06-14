import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:BOARDING/login_page.dart';
import 'package:BOARDING/success_popup.dart';
import 'package:BOARDING/loading_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:BOARDING/main_loading_screen.dart';
import 'dart:io';

class LoadingScreenEdit extends StatefulWidget {
  final String name;
  final String aboutme;
  final String location;
  final List<String> communication;

  LoadingScreenEdit(this.name, this.aboutme, this.location, this.communication);

  @override
  _LoadingScreenEditState createState() => _LoadingScreenEditState();
}

class _LoadingScreenEditState extends State<LoadingScreenEdit> {
  String msg;

  Future<String> edit(String _name, String _location, String _about,
      List<String> communications) async {
    List list_info;
    List<String> mediums = [
      'phone',
      'whatsapp',
      'skype',
      'linkedin',
      'twitter',
      'facebook'
    ];
    var token = await storage.read(key: 'jwt');
    print(_name);

    var response1 = await http.put(
      'http://192.168.1.9:8000/userinfo',
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Token $token',
      },
      body: {
        'name': _name,
        'location': _location,
        'aboutme': _about,
      },
    );
    print(response1.body);
    var responsecommu;
    for (int i = 0; i < mediums.length; i++) {
      if (communications[i] != '') {
        print(communications[i]);
        responsecommu = await http.post(
          'http://192.168.1.9:8000/communications',
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Token $token',
          },
          body: {
            'medium': mediums[i],
            'medium_url': communications[i],
          },
        );
        print(responsecommu.body);
        print("This is response for adding new communication methods");
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoadData()),
    );
  }

  @override
  void initState() {
    msg = 'Please Wait! Updating your info...';

    /*
   for(int i=0;i<widget.communication.length;i++){
      String medium=  widget.communication[i]['medium'];
      if(medium=='phone'){
        phonecon.text = widget.communication[i]['medium_url'];
      }
      if(medium=='whatsapp'){
        whatsappnocon.text = widget.communication[i]['medium_url'];
      }
      if(medium=='skype'){
        skypenocon.text = widget.communication[i]['medium_url'];
      }
      if(medium=='facebook'){
        facebookcon.text = widget.communication[i]['medium_url'];
      }
      if(medium=='twitter'){
        twittercon.text = widget.communication[i]['medium_url'];
      }
      if(medium=='linkedin'){
        linkedincon.text = widget.communication[i]['medium_url'];
      }*/
    print(widget.name);
    Future<String> f = edit(
        widget.name, widget.aboutme, widget.location, widget.communication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          height: 400,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: double.infinity,
                ),
                Loading(indicator: BallPulseIndicator(), size: 100.0),
                Text(msg,
                    style: TextStyle(color: Colors.white, fontSize: 20.0)),
              ]),
        ));
  }
}
