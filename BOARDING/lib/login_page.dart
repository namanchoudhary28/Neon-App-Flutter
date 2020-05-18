import 'package:flutter/material.dart';
import 'package:BOARDING/profile_page.dart';



class LoginPage extends StatefulWidget {
  static String tag='login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  String _username,_email,_password= "";
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
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter your email address';
        }
        return null;
      },
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
      ),
    );

    final password = TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter password';
        }
        return null;
      },
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
      ),
    );

    final loginB=Padding(
      padding: EdgeInsets.symmetric(vertical:10.0),
      child:RaisedButton(

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),

        ),
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context){
              return new HomePage();


            }));
          // Navigator.of(context).pushNamed(HomePage.tag);
        },
        padding: EdgeInsets.all(12),
        color:Colors.blue,
        child: Text('Login', style:TextStyle(color:Colors.white,fontSize: 16.0)
      ),
      ),
    );

    final forgot=Container(
      child:Row(
          mainAxisAlignment: MainAxisAlignment.end,
        children:<Widget>[

          FlatButton(
      child: Text(
        'Forgot your Password?',
        style:TextStyle(color:Colors.purple,fontSize: 15)
      ),
          ),
    ],
    ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child:ListView(
          shrinkWrap: true,
          padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
          children: <Widget>[
            logo,
            Container(
              child:Text('Email address'),
            ),
            email,
            SizedBox(height: 30,),
            Container(
              child:Text('Password'),
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