
import 'package:BOARDING/login_page.dart';
import 'package:BOARDING/main_loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/line_scale_pulse_out_indicator.dart';
import 'package:loading/loading.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'dart:convert';
import 'package:giffy_dialog/giffy_dialog.dart'; 
import 'package:http/http.dart' as http;
final storage = FlutterSecureStorage();
class LoginLoader extends StatefulWidget {
  final String username;
  final String password;
  const LoginLoader(this.username,this.password);
  @override
  _LoginLoaderState createState() => _LoginLoaderState();
}

class _LoginLoaderState extends State<LoginLoader> {

  Future<String> attemptLogIn(String username, String password) async {
    /*Map data={
      'username': username,
      'password': password,
    };*/
    //String body=json.encode(data);
   List list_token;
    http.Response res = await http.post(
        'http://192.168.1.9:8000/login',
      headers: {
        'Accept': 'application/json',
      },
      body: {
        'username': username,
        'password': password,
      },
    );
    print(res.body);
    //print(res.statusCode);
    if (res.statusCode == 200) {
      list_token = json.decode(res.body);
      //print(list_token[0]['Key']);
      storage.write(key: "jwt", value: list_token[0]['Key']);
       Navigator.push(
          context,
          MaterialPageRoute(builder: (context)=>LoadData()),
       );


      return list_token[0]['Key'];
    }else return showDialog(
                      context: context,
                      builder: (_) => NetworkGiffyDialog(
                        
                            // key: keys[1],
                            image: Image.network(
                              "https://raw.githubusercontent.com/Shashank02051997/FancyGifDialog-Android/master/GIF's/gif14.gif",
                              fit: BoxFit.cover,
                            ),
                            entryAnimation: EntryAnimation.TOP_LEFT,
                            title: Text(
                              'Login Failed',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22.0, fontWeight: FontWeight.w600),
                            ),
                            description: Text(
                              'Your password or email is incorrect.               Please try again',
                              textAlign: TextAlign.center,
                            ),
                            onOkButtonPressed: () {
                              Navigator.push(

                                context,
                                MaterialPageRoute(builder: (context) =>LoginPage() )


                              );
                            },
                            onCancelButtonPressed: (){
                              Navigator.push(

                                context,
                                MaterialPageRoute(builder: (context) =>LoginPage() )


                              );
                            },
                          ));
  }
  @override
  void initState(){
    Future<String> f = this.attemptLogIn(widget.username, widget.password);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child : Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
          Container(
                 padding: EdgeInsets.all(20.0),
                 child: Text(
          
            "Logging in....",
            textAlign: TextAlign.center,
            style:TextStyle(
                    fontSize: 20.0,
                    color:Colors.white, 
            ),
          ),
          ),
          Loading(
             indicator: LineScalePulseOutIndicator(),
             size:50.0,
          ),

            
          ],

        )
      )
    );
  }
}