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

class EducationLoadingScreen extends StatefulWidget {
  final String degree;
  final String institute;
  final String year;
  final String status;
  final String specialization;
  final String cgpa;


  const EducationLoadingScreen(this.degree,this.institute,this.year,this.status,this.specialization,this.cgpa);

  @override
  _EducationLoadingScreenState createState() => _EducationLoadingScreenState();
}

class _EducationLoadingScreenState extends State<EducationLoadingScreen> {
  String msg ="Education details are being updated. please wait...";

  Future<String> addeducation(String degree, String institute,String year,String cgpa,String status,String specialization) async {
    var token = await storage.read(key: 'jwt');

  
    
    var res = await http.post(
        'http://192.168.1.9:8000/education', headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    }, body: {
      "degree": degree,
      "institute": institute,
      "year": year,
      "specialization": specialization,
      "gpa" : cgpa,
            "status" : status
        }
    );

    Fluttertoast.showToast(
        msg: 'Education details updated',
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
    
      
      Future <String> res = addeducation(widget.degree,widget.institute,widget.year,widget.cgpa,widget.status,widget.specialization);

      
      
      

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