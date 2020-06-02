import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:BOARDING/login_page.dart';
import 'package:BOARDING/success_popup.dart';
import 'package:BOARDING/loading_login.dart';

class LoadingScreen extends StatefulWidget {
  final String item;
  final List<String> params;
  const LoadingScreen(this.item,this.params);
  
  
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String msg;

  Future<String> deletehobby(String name,String title) async{
     var token = await storage.read(key: 'jwt');
    
 
     var res =await http.delete('http://10.0.2.2:8000/api/delete$name/'+title, headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    },

   

    ).then((value) =>
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuccessPopup(widget.item),),
      )
    );
    
    return "sucess";

    

    
     
    
  }
  @override
  void initState(){
    msg = 'please wait deleting your '+ widget.item+'....';
    Future <String> f = deletehobby(widget.item,widget.params[0]);
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body:Container(
        height: 400,
        
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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