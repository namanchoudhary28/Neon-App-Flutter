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
import 'package:BOARDING/hobby_class.dart';
import 'dart:convert';

class SkillLoadingScreen extends StatefulWidget {
 final List<Map<String,String>> skills;

  const SkillLoadingScreen(this.skills);

  @override
  _SkillLoadingScreenState createState() => _SkillLoadingScreenState();
}

class _SkillLoadingScreenState extends State<SkillLoadingScreen> {
  String msg ="Your Skills are being added. please wait...";

  Future<String> addskills(List<Map<String,String>> skills) async {
    var token = await storage.read(key: 'jwt');

  
   
    var res = await http.post(
        'http://192.168.1.9:8000/skills',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Token $token',
        },
        body:
            jsonEncode(<String, List<Map<String, String>>>{"skills": skills}));
    print(res.body);

    Fluttertoast.showToast(
        msg: 'New Skills are added',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 14.0
    );


    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoadData()),);
      return "success";
  }
  @override
  void initState(){
  
    //Future <String> f = addhobbies(widget.hobbies);
    
      print(widget.skills);
      Future <String> res = addskills(widget.skills);
      
      

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body:Container(
             
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children : <Widget>[
                Container(
           width: double.infinity,

          ),
          Loading(indicator: BallPulseIndicator(),size: 100.0),
          Text(msg,style:TextStyle(color:Colors.white,fontSize: 20.0))
          ]
          
         
        ),
      )
    );
        
  }
}