//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:link/link.dart';
import 'package:BOARDING/login_page.dart';
import 'package:BOARDING/edit_info.dart';
import 'package:BOARDING/date_time_picker_widget2.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
//import 'package:BOARDING/grid_hobby.dart';
import 'package:BOARDING/addproject.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';




class HomePage extends StatefulWidget {
  static String tag='home-page';
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  static String tag = 'home-page';

  List list_about,list_hobby,list_achievements,list_projects,list_skills;
  bool got=false;


  Future<String> getData() async{
      var token=await storage.read(key:'jwt');
      print(token);
      var response1=await http.get(
          'http://10.0.2.2:8000/api/getuserinfo',
          headers: {
            'Accept':'application/json',
            'Authorization':'Token $token',
          }
      );


        var response2=await http.get(
            'http://10.0.2.2:8000/api/gethobby',
            headers: {
              'Accept':'application/json',
              'Authorization':'Token $token',
            }
        );

      var response3=await http.get(
          'http://10.0.2.2:8000/api/getproject',
          headers: {
            'Accept':'application/json',
            'Authorization':'Token $token',
          }
      );

      var response4=await http.get(
          'http://10.0.2.2:8000/api/getachievement',
          headers: {
            'Accept':'application/json',
            'Authorization':'Token $token',
          }
      );
      var response5=await http.get(
      'http://10.0.2.2:8000/api/getskill',
          headers: {
            'Accept':'application/json',
            'Authorization':'Token $token',
          }
      );


      this.setState(() {
      list_about=jsonDecode(response1.body);
      list_hobby=jsonDecode(response2.body);
      list_projects=jsonDecode(response3.body);
      list_achievements=jsonDecode(response4.body);
      list_skills=jsonDecode(response5.body);
      got=true;
    });

    //print(list_projects);
    return 'Success';
  }

  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    final achievementaboutme = TextField(
      decoration: InputDecoration(
          labelText: "Write your description here",
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
      maxLines: 6,
    );
    final achievementname = TextFormField(
      decoration: InputDecoration(
          labelText: 'Title',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)),
      // maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      // onSaved: (String value) {
      //   _name = value;
      // },
    );
    final profile_picture = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
                'https://www.postplanner.com/hs-fs/hub/513577/file-2886416984-png/blog-files/facebook-profile-pic-vs-cover-photo-sq.png?width=250&height=250&name=facebook-profile-pic-vs-cover-photo-sq.png'),
          ),
        ),
      ),
    );


    final name=
      Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text((() {
              if (got=true){
                return list_about[0]['name'];}
              return 'Loading';
      }()),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            InkWell(
              child: Image.network(
                  'https://img.icons8.com/windows/32/000000/edit.png'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new EDITINFO(); //Function from edit_info.dart
                }));
              },
            ),
          ],
        ),
      );


    final city = Center(
      child:Text((() {
        if (got=true){
          return list_about[0]['location'];}
        return 'Loading';
      }()),
        style: TextStyle(
          color: Colors.orangeAccent,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );

    final social_icons = Padding(
      padding: EdgeInsets.all(5),
      child: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Link(
                child: Image.network(
                  'https://img.icons8.com/android/24/000000/phone.png',
                  scale: 1.1,
                ),
                url: 'https://www.google.com',
                onError: _showErrorSnackBar,
              ),
              Link(
                child: Image.network(
                  'https://img.icons8.com/color/48/000000/facebook-new.png',
                  scale: 1.2,
                ),
                url: 'https://www.facebook.com',
                onError: _showErrorSnackBar,
              ),
              Image.network(
                'https://img.icons8.com/color/48/000000/twitter.png',
                scale: 1.2,
              ),
              Image.network(
                'https://img.icons8.com/color/48/000000/whatsapp.png',
                scale: 1.2,
              ),
              Image.network(
                'https://img.icons8.com/ultraviolet/40/000000/send-mass-email.png',
                scale: 1.2,
              ),
              Image.network(
                'https://img.icons8.com/color/48/000000/skype.png',
                scale: 1.4,
              ),
              Image.network(
                'https://img.icons8.com/color/48/000000/linkedin.png',
                scale: 1.2,
              ),
            ],
          ),
        ),
      ),
    );

    final about = Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Center(
        child:Text((() {
          if (got=true){
            return list_about[0]['aboutme'];}
          return 'Loading';
        }()),
          textAlign: TextAlign.center,
          style: TextStyle(
            //color: Colors.orangeAccent,,
            fontSize: 16,
          ),
        ),
      ),
    );

    final hobby = Container(
      height: 170,
      color: Colors.cyan[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'HOBBIES AND INTERESTS',
                  style: TextStyle(
                    fontSize: 17.0,
                    letterSpacing: 1.7,
                  ),
                ),
              ),
              SizedBox(width: (MediaQuery.of(context).size.width) - 325),
              InkWell(
                child: Image.network(
                    'https://img.icons8.com/windows/32/000000/edit.png'),

                /// Pop Up form to add hobbies and interests
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => Wrap(children: [
                      Container(
                        child: Align(
                          heightFactor: 2,
                          alignment: Alignment(-0.9, 0),
                          child: Text(
                            "Add Achievement",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      achievementname,
                      Container(height: 20),
                      Container(
                        child: Align(
                          heightFactor: 1,
                          alignment: Alignment(-0.9, 0),
                          child: Text(
                            "Date",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // DateTimePickerWidget2(),
                      Container(
                        child: Align(
                          heightFactor: 2,
                          alignment: Alignment(-0.7, 0),
                          child: DateTimePickerWidget2(),
                        ),
                      ),
                      //  Container(height:20),
                      Container(
                        child: Align(
                          heightFactor: 1,
                          alignment: Alignment(-0.9, 0),
                          child: Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      achievementaboutme,

                      Container(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return new HomePage();
                                }));
                                // Navigator.of(context).pushNamed(HomePage.tag);
                              },
                              padding: EdgeInsets.all(20),
                              color: Colors.blue,
                              child: Text('      Cancel        ',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0)),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              ),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return new HomePage();
                                }));
                                // Navigator.of(context).pushNamed(HomePage.tag);
                              },
                              padding: EdgeInsets.all(20),
                              color: Colors.blue,
                              child: Text('Save Changes',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0)),
                            ),
                          ),
                        ],
                      )
                    ]),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );

    final skills = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        DefaultTabController(
          length: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                child: TabBar(
                    labelStyle: TextStyle(fontSize: 14),
                    labelColor: Colors.blue,
                    tabs: [
                      Tab(
                        text: "TOP SKILLS",
                      ),
                      Tab(text: "PERSONALITY TRAITS"),
                    ]),
              ),
              Container(
                height: 300,
                child: TabBarView(
                  children: [
                    Container(
                      child: Column(
                        children: <Widget>[
                          for (Map<String,dynamic> item in list_skills) MySkills('https://img.icons8.com/color/48/000000/python.png', item['proficiency']),
                          /*MySkills('https://img.icons8.com/color/48/000000/python.png', 74),
                          MySkills('https://img.icons8.com/color/48/000000/python.png', 23),
                          MySkills('https://img.icons8.com/color/48/000000/python.png', 91),
                          MySkills('https://img.icons8.com/color/48/000000/python.png', 84),*/


                        ],
                      ),
                    ),
                    Container(
                      child: Text("Personality Traits Here!"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );

    final projects = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 0, 10),
          child: Row(
            children: <Widget>[
              Text(
                'PROJECTS',
                style: TextStyle(fontSize: 17, letterSpacing: 1.7),
              ),
              SizedBox(width: (MediaQuery.of(context).size.width) - 175),
              InkWell(
                child: Image.network(
                    'https://img.icons8.com/windows/32/000000/edit.png'),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return new MyApp();
                  }));
                },
              ),
            ],
          ),
        ),
        Container(
          height: 170,
          padding: EdgeInsets.fromLTRB(16, 5, 16, 0),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              for (Map<String,dynamic> item in list_projects) MyProjects(item['info'], item['starts']),

              //MyProjects('Booking 2', '1 May 2020'),
              //MyProjects('Booking 3', '1 May 2021'),
            ],
          ),
        ),
      ],
    ); // MyProjects function is defined at the end. Usage Syntax: MyProjects(heading,subheading)

    final badges = Container(
      height: 170,
      color: Colors.cyan[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'BADGES',
                  style: TextStyle(
                    fontSize: 17.0,
                    letterSpacing: 1.7,
                  ),
                ),
              ),
              SizedBox(width: (MediaQuery.of(context).size.width) - 165),
              Link(
                child: Image.network(
                    'https://img.icons8.com/windows/32/000000/edit.png'),
                url: 'Edit URL',
                onError: _showErrorSnackBar,
              ),
            ],
          ),
        ],
      ),
    );

    final achievemnets = Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Text(
                  'ACHIEVEMENTS',
                  style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 1.7,
                  ),
                )),
            SizedBox(width: (MediaQuery.of(context).size.width) - 235),
            Link(
              child: Image.network(
                  'https://img.icons8.com/windows/32/000000/edit.png'),
              url: 'Edit URL',
              onError: _showErrorSnackBar,
            ),
          ],
        ),
        Container(
          width: (MediaQuery.of(context).size.width),
          padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
          child: Column(
            children: <Widget>[
              for (Map<String,dynamic> item in list_achievements) _MyAchievemnts(context,item['date'], item['title'],'Testing_Text'),
              //_MyAchievemnts(context, 'May 10', 'Testing', 'Testin text'),
              //_MyAchievemnts(context, 'May 11', 'Testing2',
               //   'Grammaticality Wise men speak because they have something to say; Fools because they have to say something'),
            ],
          ),
        ),
      ],
    );

    final body=
      ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          profile_picture,
          SizedBox(
            height: 10,
          ),
          name,
          city,
          social_icons,
          SizedBox(
            height: 10,
          ),
          about,
          SizedBox(
            height: 40,
          ),
          hobby,
          SizedBox(
            height: 40,
          ),
          skills,
          projects,
          SizedBox(
            height: 30,
          ),
          badges,
          SizedBox(
            height: 30,
          ),
          achievemnets,
        ],
      );

    return Scaffold(
      body: SafeArea(
        child: body,
      ),
    );
  }




  ///Functions called above. Sorry for non uniformity in the type returned.
  Padding MySkills(String image,int percentage,){
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 5, 6),
      child: new LinearPercentIndicator(
        width: MediaQuery.of(context).size.width - 120,
        lineHeight: 3.0,
        leading: new Image.network(
            image),
        trailing: Text(
          percentage.toString()+'%',
          style: TextStyle(color: Colors.blue),
        ),
        animation: true,
        animationDuration: 1000,
        percent: percentage*0.01,
        backgroundColor: Colors.grey[300],
        progressColor: Colors.blue,
      ),
    );
  }

  Container MyProjects(String heading, String subHeading) {
    return Container(
      width: 250,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.blue,
        child: Wrap(
          children: <Widget>[
            ListTile(
              title: Text(heading, style: TextStyle(color: Colors.white)),
              subtitle: Text(subHeading,
                  style: TextStyle(color: Colors.lightBlueAccent)),
            ),
          ],
        ),
      ),
    );
  }

  Row _MyAchievemnts(context, String date, String heading, String subHeading) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          date,
          style: TextStyle(fontSize: 17),
        ),
        Container(
          height: 100,
          width: screenWidth(context) - 150,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            color: Colors.red[200],
            child: Wrap(
              children: <Widget>[
                ListTile(
                  title: Text(heading, style: TextStyle(color: Colors.black)),
                  subtitle:
                      Text(subHeading, style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


  void _showErrorSnackBar() {
    Scaffold(
      body: SnackBar(
        content: Text('Oops... the URL couldn\'t be opened!'),
      ),
    );
  }
}

Size screenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

double screenHeight(BuildContext context) {
  return screenSize(context).height;
}

double screenWidth(BuildContext context) {
  return screenSize(context).width;
}
