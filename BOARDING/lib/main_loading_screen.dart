import 'package:flutter/material.dart';

import 'package:loading/indicator/ball_spin_fade_loader_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:loading/loading.dart';
import 'package:BOARDING/login_page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:BOARDING/profile_page.dart';
import 'package:BOARDING/loading_login.dart';


class LoadData extends StatefulWidget {
  @override
  _LoadDataState createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {
   static String tag = 'home-page';

  List list_about, list_hobby, list_achievements, list_projects, list_skills,list_communications/*, list_badges*/,list_blogs,list_education,list_certifications;
  bool got = false;
  Future<String> getData() async {
    var token = await storage.read(key: 'jwt');

    var response1 =
        await http.get('http://10.0.2.2:8000/userinfo', headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    });
    
    var response2 =
    await http.get('http://10.0.2.2:8000/hobbies', headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    });
   

    var response3 =
    await http.get('http://10.0.2.2:8000/project/0', headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    });

    var response4 =
    await http.get('http://10.0.2.2:8000/achievements', headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    });
    var response5 =
    await http.get('http://10.0.2.2:8000/skills', headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    });
    var response6 =
    await http.get('http://10.0.2.2:8000/communications', headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    });
    var response7 =
    await http.get('http://10.0.2.2:8000/blog', headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    });
    var response8 =
    await http.get('http://10.0.2.2:8000/education', headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    });
    var response9 =
    await http.get('http://10.0.2.2:8000/certification', headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    });
    
/*
    var response7 =
    await http.get('http://192.168.1.9:8000/badge', headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    });*/


   list_about = jsonDecode(response1.body);
    list_hobby = jsonDecode(response2.body);
    list_projects = jsonDecode(response3.body);
    list_achievements = jsonDecode(response4.body);
    list_skills = jsonDecode(response5.body);
    list_communications = jsonDecode(response6.body);
    list_blogs  = jsonDecode(response7.body);
    list_education = jsonDecode(response8.body);
    list_certifications = jsonDecode(response9.body);


    //list_badges=jsonDecode(response7.body);
   print(list_about);

    Navigator.push(
          context,
        MaterialPageRoute(builder: (context) =>
            HomePage(list_about,list_hobby, list_projects, list_achievements,
                list_communications,/* list_badges, */list_skills,list_blogs,list_education,list_certifications))
      );



     
    

    //print(list_projects);
    return 'Success';
  }
  @override
  void initState(){
     Future<String>s=  this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(child:Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: <Widget>[
          Container(
            width: double.infinity,
          ),
          Container(
            width: 200.0,
            child: Text(
            "PLEASE WAIT",
            textAlign: TextAlign.center,
            style:TextStyle(
                    fontSize: 20.0,
                    color:Colors.white, 
            ),
          ),
            padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border:Border(
                  bottom: BorderSide(
                      color: Colors.white,
                      width : 1.0,
                  ),
                ),
              ),   
          ),
          
          SizedBox(
                 height: 20.0,
          ),
          Container(
                 padding: EdgeInsets.all(20.0),
                 child: Text(
          
            "loading...achievements,projects,hobbies,badges and more. this may take a while...",
            textAlign: TextAlign.center,
            style:TextStyle(
                    fontSize: 15.0,
                    color:Colors.white, 
            ),
          ),
          ),
         

          
         Loading(
           indicator: BallSpinFadeLoaderIndicator(),
           size:50.0
         )

        
       
          
          



          
        ],
      ),
        
    )
    );
  }
}