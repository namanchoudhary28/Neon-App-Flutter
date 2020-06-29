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

class LoadingScreenEditAchievement extends StatefulWidget {
  final int decider;
  final String date;
  final String title;
  final String description;
  final String title_old;

  LoadingScreenEditAchievement(this.decider,this.date, this.title, this.description,this.title_old);

  @override
  _LoadingScreenEditAchievementState createState() => _LoadingScreenEditAchievementState();
}

class _LoadingScreenEditAchievementState extends State<LoadingScreenEditAchievement> {
 String msg;

  Future<String> submitAchievements(int decider,String _dates, String _title,String _description,String title_old) async {
    var token = await storage.read(key: 'jwt');
    var response1;
    
    
    
    if(decider==1){
      response1 = await http.post(
        'http://10.0.2.2:8000/achievements',
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Token $token',
        },
        body: {
          'date': _dates,
          'title': _title,
          'description': _description
          //'status':_myActivityResult,
        },
      );
    }
    else{
      String url = 'http://10.0.2.2:8000/achievements/' +
          title_old;
      response1 = await http.put(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Token $token',
        },
        body: {
          'date': _dates,
          'title': _title,
          'description': _description
          //'status':_myActivityResult,

        },
      );


    }
    print(response1.body);



    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoadData()),
    );
  }

  @override
  void initState() {
     msg = widget.decider==1?"Please Wait!\n Adding your achievement..." : "Please Wait!\nUpdating your achievement";
   

    //print(widget.name);
    Future<String> f = submitAchievements(
        widget.decider, widget.date, widget.title, widget.description,widget.title_old);
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
