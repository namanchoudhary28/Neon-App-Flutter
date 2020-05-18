import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:BOARDING/login_page.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';
  @override
  Widget build(BuildContext context) {
    final profile_picture=Hero(
      tag:'hero',
      child:Padding(
        padding: EdgeInsets.all(10),
        child: CircleAvatar(
          radius:50,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage('https://www.postplanner.com/hs-fs/hub/513577/file-2886416984-png/blog-files/facebook-profile-pic-vs-cover-photo-sq.png?width=250&height=250&name=facebook-profile-pic-vs-cover-photo-sq.png'),
        ),
      ),
    );

    final name=Padding(
      padding: EdgeInsets.all(8),
      child:Center(
        child: Text(
          'The One',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );

    final city= Center(
        child: Text(
          'Delhi, IN',
          style: TextStyle(
            color: Colors.orangeAccent,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
    );

    final social_icons=Padding(
      padding: EdgeInsets.all(5),
      child:Center(
        child: Container(
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network('https://img.icons8.com/android/24/000000/phone.png',scale: 1.1,),
            Image.network('https://img.icons8.com/color/48/000000/facebook-new.png',scale: 1.2,),
            Image.network('https://img.icons8.com/color/48/000000/twitter.png',scale: 1.2,),
            Image.network('https://img.icons8.com/color/48/000000/whatsapp.png',scale: 1.2,),
            Image.network('https://img.icons8.com/ultraviolet/40/000000/send-mass-email.png',scale: 1.2,),
            Image.network('https://img.icons8.com/color/48/000000/skype.png',scale: 1.4,),
            Image.network('https://img.icons8.com/color/48/000000/linkedin.png',scale: 1.2,),
          ],
        ),
        ),
        ),
      );

    final about= Padding(
      padding:EdgeInsets.fromLTRB(20, 0, 20, 0),
      child:Center(
      child: Text(
        'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
        textAlign: TextAlign.center,
        style: TextStyle(
          //color: Colors.orangeAccent,,
          fontSize: 16,
        ),
      ),
      ),
    );

    final hobby=Container(
      height: 170,
      color: Colors.cyan[100],
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'HOBBIES AND INTERESTS',
              style: TextStyle(
              fontSize: 17.0,
              letterSpacing:1.7,
              ),
            ),
          ),
        ],
      ),
    );

  /*  final skills=Container(
      height: 100,
        child:TabBarView(
          children: [
            Text('TOP SKILLS'),
            Text('PERSONALITY TRAITS'),
          ],
        )
    );*/




    final body=Container(
      child:Column(
        children: <Widget>[
          SizedBox(
            height:40,
          ),
          profile_picture,
          SizedBox(
            height:10,
          ),
          name,
          city,
       social_icons,
          SizedBox(
            height:10,
          ),
          about,
          SizedBox(
            height:40,
          ),
            hobby,
          //skills,
        ],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
