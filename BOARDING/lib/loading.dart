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

class LoadingScreen extends StatefulWidget {
  final String item;
  final List<String> params;

  const LoadingScreen(this.item, this.params);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  String msg;

  Future<String> deletehobby(String name, String title) async {
    var token = await storage.read(key: 'jwt');


    var res = await http.delete(
        'http://10.0.2.2:8000/$name/' + title, headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    });
     print(res.body);
    Fluttertoast.showToast(
        msg: name + ' is now deleted!',
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
  }
  @override
  void initState(){
    msg = 'Please wait deleting your ' + widget.item + '....';
    Future<String> f = deletehobby(widget.item, widget.params[0]);
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