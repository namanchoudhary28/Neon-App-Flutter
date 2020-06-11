import 'package:flutter/material.dart';
import 'package:BOARDING/profile_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:BOARDING/main_loading_screen.dart';
import 'package:BOARDING/loading_login.dart';







class LoginPage extends StatefulWidget {
  static String tag='login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {


  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  List list_token;

  

    @override
    Widget build(BuildContext context) {
      final logo = Hero(
        tag: 'hero',
        child: Container(
          width: double.infinity,
          height: 150.0,
          child: Image(
            image: AssetImage('assets/images/man.png'),
            

          )
        ),
      );

      final email = TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: _usernameController,
        /*  validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your email address';
        }
        return null;
      },*/
        autofocus: false,
        decoration: InputDecoration(
            hintText: 'Username',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
        ),
      );

      final password = TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: _passwordController,
        /*  validator: (value) {
        if (value.isEmpty) {
          return 'Please enter password';
        }
        return null;
      },*/
        autofocus: false,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
        ),
      );

      final loginB = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: RaisedButton(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.0),

          ),
          onPressed: ()  {
            var username = _usernameController.text;
            var password = _passwordController.text;

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context)=>LoginLoader(username,password)),

            );
            /* Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) {return new HomePage();}));*/
            

          },
          padding: EdgeInsets.all(12),
          color: Colors.blue,
          child: Text(
              'Login', style: TextStyle(color: Colors.white, fontSize: 16.0)
          ),
        ),
      );


      final forgot = Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[

            FlatButton(
              child: Text(
                  'Forgot your Password?',
                  style: TextStyle(color: Colors.purple, fontSize: 15)
              ),
            ),
          ],
        ),
      );

      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(30, 0, 24, 0),
            children: <Widget>[
              logo,
              SizedBox(
                height: 75.0,
              ),
              Container(
                child: Text('Username',style: TextStyle(
                  fontFamily: 'sans-serif',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800
                ),),
              ),
              email,
              SizedBox(height: 30,),
              Container(
                child: Text('Password',style: TextStyle(
                  fontFamily: 'sans-serif',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800
                )),
              ),
              password,
              forgot,
              SizedBox(height: 20,),
              loginB,

            ],
          ),
        ),
      );
    }

  }
