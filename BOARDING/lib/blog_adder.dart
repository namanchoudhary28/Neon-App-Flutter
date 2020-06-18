import 'package:flutter/material.dart';
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

class BlogLoadingScreen extends StatefulWidget {
  final String title;
  final String description;
  final String link;
  final String blog_site;


  const BlogLoadingScreen(this.title,this.description,this.link,this.blog_site);

  @override
  _BlogLoadingScreenState createState() => _BlogLoadingScreenState();
}

class _BlogLoadingScreenState extends State<BlogLoadingScreen> {
  String msg ="Your Blog is being added. please wait...";

  Future<String> addblog(String title,String description,String link,String blog_site) async {
    var token = await storage.read(key: 'jwt');

  
    
    var res = await http.post(
        'http://192.168.1.9:8000/blog',
        headers: {
          
          'Accept': 'application/json',
          'Authorization': 'Token $token',
        },
        body: {
            "title" : title,
            "description" : description,
            "link" : link,
            "blog_site" : blog_site
        }
    );

    Fluttertoast.showToast(
        msg: 'Blog Added',
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
    
      
      Future <String> res = addblog(widget.title,widget.description,widget.link,widget.blog_site);


      
      
      

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

