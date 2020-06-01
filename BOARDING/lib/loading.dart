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

  Future<String> deletehobby(String title) async{
     var token = await storage.read(key: 'jwt');
    
 
     var res =await http.delete('http://10.0.2.2:8000/api/deletehobby/'+title, headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    },

   

    ).then((value) =>
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuccessPopup(),),
      )
    );
    
    return "sucess";

    

    
     
    
  }
  @override
  void initState(){
    Future <String> f = deletehobby(widget.params[0]);
    

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
          Text("please wait deleting your hobby...",style:TextStyle(color:Colors.white,fontSize: 20.0))
          ]
          
         
        ),
      )
    );
        
  }
}