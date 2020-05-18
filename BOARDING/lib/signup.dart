import 'package:flutter/material.dart';
// import 'package:myapp/login_page.dart';
// import 'login_page.dart';



class Signup extends StatefulWidget {
  static String tag ='signup-page';
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    final logo=Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 70.0,
        child: Image.asset('assets/1.png',),
      ),

    );
    final user = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      // initialValue: 'naman@iitbhilai.ac.in',
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: 'naman@iitbhilai.ac.in',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final password = TextFormField(
      // keyboardType: TextInputType.emailAddress,
      autofocus: false,
      // initialValue: '123',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final SigfnupButton = Padding(
      padding: EdgeInsets.symmetric(vertical :16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        onPressed:(){
          // Navigator.of(context).pushNamed(LoginPage.tag);

        } ,
        padding: EdgeInsets.all(12),
        color: Colors.green,
        child: Text('Sign up',style: TextStyle(
          color:Colors.white,
          fontSize: 17.0

        ),
        ),

      ),

    );
    final forgotlabel = FlatButton(
      child: Text('Already have account? log in',
      style: TextStyle(color: Colors.purple,fontSize:15),
      ),
      onPressed: (){
        // Navigator.push
        // (
        //   context,
        //   MaterialPageRoute(builder: (context)
        //   {
        //     return new LoginPage();
        //   })
        // );


      },
      


    );
     return Scaffold(backgroundColor: Colors.white,
    body: Center(child: ListView(
      shrinkWrap: true,
      padding: EdgeInsets.only(left:24.0,right:24.0),
      children: <Widget>[
        logo,
        SizedBox(height: 50.0),
        user,
        SizedBox(height: 15.0),
        email,
        SizedBox(height: 15.0),
        password,
        SizedBox(height: 24.0),
        SigfnupButton,
        forgotlabel
      
      ],

    ),
    ),
    );


  }
}