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

class ProjectLoadingScreen extends StatefulWidget {
  final int decider;
  final String name;
  final String start;
  final String end;
  final String status;
  final String des;
   final String client_name;
  final String client_location;
  final String client_industry;
  final String location_of_project_execution;
  final String teamsize;
  final String case_study_submitted;
  final String role;


  const ProjectLoadingScreen(this.decider,this.name,this.start,this.end,this.status,this.des,this.client_name,this.client_location,this.client_industry,this.location_of_project_execution,this.teamsize,this.case_study_submitted,this.role);

  @override
  _ProjectLoadingScreenState createState() => _ProjectLoadingScreenState();
}

class _ProjectLoadingScreenState extends State<ProjectLoadingScreen> {
  String msg ="Your project is being added. please wait...";

  Future<String> addproject(String info,String start, String end, String status,String des, String client_name,String client_location,String location_of_project_execution,String client_industry,String role, String teamsize,String case_study_submitted ) async {
    var token = await storage.read(key: 'jwt');
    var res;

  
    if(widget.decider==1) {
      res = await http.post(
          'http://192.168.1.9:8000/project/0',
          headers: {

            'Accept': 'application/json',
            'Authorization': 'Token $token',
          },
          body: {
            "info": info,
            "starts": start,
            "ends": end,
            "status": status,
            "description": des,
            "client_name": client_name,
            "client_location": client_location,
            "location_of_project_execution": location_of_project_execution,
            "Industry_of_the_client": client_industry,
            "Role": role,
            "team_size": teamsize,
            "case_study_submitted": case_study_submitted
          }

      );
    }
    else{
       res = await http.put(
          'http://192.168.1.9:8000/project/0',
          headers: {

            'Accept': 'application/json',
            'Authorization': 'Token $token',
          },
          body: {
            "info": info,
            "starts": start,
            "ends": end,
            "status": status,
            "description": des,
            "client_name": client_name,
            "client_location": client_location,
            "location_of_project_execution": location_of_project_execution,
            "Industry_of_the_client": client_industry,
            "Role": role,
            "team_size": teamsize,
            "case_study_submitted": case_study_submitted
          }

      );
    }
        print(res.body);
    

    Fluttertoast.showToast(
        msg: 'new project added',
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
    
            Future <String> res = addproject(widget.name,widget.start,widget.end,widget.status,widget.des,widget.client_name,widget.client_location,widget.location_of_project_execution,widget.client_industry,widget.role,widget.teamsize,widget.case_study_submitted);
      
      

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