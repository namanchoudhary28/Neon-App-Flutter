import 'package:flutter/material.dart';
import 'package:BOARDING/profile_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

final storage = FlutterSecureStorage();





class LoginPage extends StatefulWidget {
  static String tag='login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {


  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  List list_token;

  Future<String> attemptLogIn(String username, String password) async {
    /*Map data={
      'username': username,
      'password': password,
    };*/
    //String body=json.encode(data);

    http.Response res = await http.post(
        'http://10.0.2.2:8000/api/login',
        headers: {'Accept': 'application/json',},
        body: {
          'username': username,
          'password': password,
        },
    );
    //print(res.body);
    //print(res.statusCode);
    if (res.statusCode == 200) {
      list_token = json.decode(res.body);
      //print(list_token[0]['Key']);
      return list_token[0]['Key'];
    }else return null;
  }

    @override
    Widget build(BuildContext context) {
      final logo = Hero(
        tag: 'hero',
        child: Container(
          width: double.infinity,
          height: 350.0,
          child: Image.asset('assets/images/login.png'),
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
            hintText: 'Email',
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
          onPressed: () async {
            var username = _usernameController.text;
            var password = _passwordController.text;
            /* Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) {return new HomePage();}));*/
            print('something1');
            var jwt = await attemptLogIn(username, password);
            print('something2');


            if (jwt != null) {
              storage.write(key: "jwt", value: jwt);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return new HomePage();
                      }
                  )
              );
            } else {
              print("An Error Occurred");
            }
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
            padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
            children: <Widget>[
              logo,
              Container(
                child: Text('Email address'),
              ),
              email,
              SizedBox(height: 30,),
              Container(
                child: Text('Password'),
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
    void _performLogin() {
      String username = _usernameController.text;
      String password = _passwordController.text;

      print(username);
    }
  }
