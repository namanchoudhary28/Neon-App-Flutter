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

class HobbyLoadingScreen extends StatefulWidget {
 final List<Map<String,String>> hobbies;

  const HobbyLoadingScreen(this.hobbies);

  @override
  _HobbyLoadingScreenState createState() => _HobbyLoadingScreenState();
}

class _HobbyLoadingScreenState extends State<HobbyLoadingScreen> {
  String msg ="Your hobbies are being added. please wait...";

  Future<String> addhobbies(List<Map<String,String>> hobbies) async {
    var token = await storage.read(key: 'jwt');

  var body = jsonEncode(<String,List<Map<String,String>>>{
       "hobbies" : hobbies


     }
    );
    print(body);
    var res = await http.post(
        'http://10.0.2.2:8000/hobbies', headers: {
          'Content-Type' : 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Token $token',

    },
     body:jsonEncode(<String,List<Map<String,String>>>{
       "hobbies" : hobbies


     }
    ));
    print(res.body);

    Fluttertoast.showToast(
        msg: 'hobbies are added',
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
    
      print(widget.hobbies);
      Future <String> res = addhobbies(widget.hobbies);
      
      

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