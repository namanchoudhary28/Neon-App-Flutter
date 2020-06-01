//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:link/link.dart';
import 'package:BOARDING/login_page.dart';
import 'package:BOARDING/edit_info.dart';
import 'package:BOARDING/edit_achievement.dart';
import 'package:BOARDING/add_hobby.dart';

import 'package:BOARDING/date_time_picker_widget2.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
//import 'package:BOARDING/grid_hobby.dart';
import 'package:BOARDING/addproject.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:BOARDING/delete_popup.dart';

import 'package:BOARDING/projectinfo.dart';
import 'package:BOARDING/main_loading_screen.dart';
import 'package:BOARDING/loading_login.dart';
class HomePage extends StatefulWidget {
  final List list_about;
  final List list_hobby;
  final List list_projects;
  final List list_achievements;
  final List list_badges;
  final List list_communications;
  final List list_skills;
  const HomePage(this.list_about,this.list_hobby,this.list_projects,this.list_achievements,this.list_communications,this.list_badges,this.list_skills);
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

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
            backgroundImage:AssetImage('assets/icons/profile.jpg'),
        ),
      ),
    )
    );

    final name = Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            widget.list_about[0]['name'],
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          InkWell(
            child: Image(
                image: AssetImage('assets/icons/edit.png'),
                height:30,
                width:30,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new EDITINFO(widget.list_about[0]['name'],widget.list_about[0]['aboutme'],widget.list_about[0]['location'],widget.list_communications); //Function from edit_info.dart
              }));
            },
          ),
        ],
      ),
    );

    final city = Center(
      child: Text(
        widget.list_about[0]['location'],
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
              for(Map<String,dynamic> item in widget.list_communications)
               communication(item['medium']),

            ],
          ),
        ),
      ),
    );

    final about = Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Center(
        child: Text(
         widget.list_about[0]['aboutme'],
          textAlign: TextAlign.center,
          style: TextStyle(
            //color: Colors.orangeAccent,,
            fontSize: 16,
          ),
        ),
      ),
    );

    final hobby = Container(
      height: 400,
      width: (MediaQuery.of(context).size.width) ,
      color: Colors.cyan[100],
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
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
                    SizedBox(width: (MediaQuery.of(context).size.width) - 350),
                    InkWell(
                      child: Image(
                        image: AssetImage('assets/icons/add.png'),
                        height: 40.0,
                        width: 40.0,
                      ),

                      onTap: () {
                         
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return new EDIT_HOBBY(); //Function from edit_info.dart
                        }));
                         

                      },
                    ),
                  ],
                ),
              ],
          ),
      Container(
        height: 300,
        padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            for (Map<String, dynamic> item in widget.list_hobby)
              MyHobbies(item['name'], item['hobby_image_url']),

            //MyProjects('Booking 2', '1 May 2020'),
            //MyProjects('Booking 3', '1 May 2021'),
          ],
        ),
      ),
        ],
      ),);



    final skills = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,

      children: <Widget>[
         Container(
          width: double.infinity,
         ),
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
                height: 200,
                child: TabBarView(
                  children: [
                    Container(
                      child: Column(
                        children: <Widget>[
                          for (Map<String, dynamic> item in widget.list_skills)
                            MySkills(
                                'assets/icons/python.png',
                                item['proficiency']),
                          /*MySkills('https://img.icons8.com/color/48/000000/python.png', 74),
                          MySkills('https://img.icons8.com/color/48/000000/python.png', 23),
                          MySkills('https://img.icons8.com/color/48/000000/python.png', 91),
                          MySkills('https://img.icons8.com/color/48/000000/python.png', 84),*/
                        ],
                      ),
                    ),
                    Container(
                      height: 100.0,
                      child: Text("Personality Traits Here!"),
                    )
                  ],
                ),
              ),
              
              Container(
                  height: 100.0,
                  child: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/icons/add.png'),
                        height: 40.0,
                        width: 40.0,
                      ),
                      Image(
                        image: AssetImage('assets/icons/edit.png'),
                        height: 40.0,
                        width: 40.0,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                  )),
            ],
          ),
        ),
        Container(
          width: 150.0,
          child : FlatButton(
            color:Colors.white,
            textColor: Colors.blue,
            onPressed: (){

            },
            child:Row(
                 children: <Widget>[
                   Text("VIEW MORE"),
                   Icon(
                     Icons.arrow_forward_ios

                   ),
                  
                 ], 
            ),
        ),
        ),
      ],
    );

    final projects = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
                child: Image(
                  image: AssetImage('assets/icons/add.png'),
                  height: 40.0,
                  width: 40.0,
                ),
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
              for (Map<String, dynamic> item in widget.list_projects)
                MyProjects(item['info'], item['starts']),

              //MyProjects('Booking 2', '1 May 2020'),
              //MyProjects('Booking 3', '1 May 2021'),
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          width: 150.0,
          child : FlatButton(
            color:Colors.white,
            textColor: Colors.blue,
            onPressed: (){

            },
            child:Row(
                 children: <Widget>[
                   Text("VIEW MORE"),
                   Icon(
                     Icons.arrow_forward_ios

                   ),
                  
                 ], 
            ),
        ),
        ),
        
        Container(
          width: double.infinity,
        ),
      ],
    ); // MyProjects function is defined at the end. Usage Syntax: MyProjects(heading,subheading)

    final badges = Container(
      height: 400,
      width: (MediaQuery.of(context).size.width) ,
      color: Colors.cyan[100],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  SizedBox(width: (MediaQuery.of(context).size.width) - 350),
                  InkWell(
                    child: Image(
                      image: AssetImage('assets/icons/add.png'),
                      height: 40.0,
                      width: 40.0,
                    ),

                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                            return new EDIT_HOBBY(); //Function from edit_info.dart
                          }));
                    },
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 300,
            padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                for (Map<String, dynamic> item in widget.list_badges)
                  MyBadges(item['title'], item['image_url'],item['description']),


              ],
            ),
          ),
        ],
      ),);

    final achievemnets = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
            InkWell(
              child: Image(
                image: AssetImage('assets/icons/add.png'),
                height: 40.0,
                width: 40.0,
              ),

              /// Pop Up form to add achievements
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new EDIT_ACHIEVEMENT('','');
                }));
              },
            ),
          ],
        ),
        Container(
          width: (MediaQuery.of(context).size.width),
          padding: EdgeInsets.fromLTRB(16, 5, 16, 5),
          child: Column(
            children: <Widget>[
              for (Map<String, dynamic> item in widget.list_achievements)
                _MyAchievemnts(
                    context, item['date'], item['title'], item['description']),
              //_MyAchievemnts(context, 'May 10', 'Testing', 'Testin text'),
              //_MyAchievemnts(context, 'May 11', 'Testing2',
              //   'Grammaticality Wise men speak because they have something to say; Fools because they have to say something'),
            ],
          ),
        ),
        Container(
            width:double.infinity
        ),
        Container(
          width: 150.0,
          child : FlatButton(
            color:Colors.white,
            textColor: Colors.blue,
            onPressed: (){

            },
            child:Row(
                 children: <Widget>[
                   Text("VIEW MORE"),
                   Icon(
                     Icons.arrow_forward_ios

                   ),
                  
                 ], 
            ),
        ),
        )
        
      ],
    );

    final body = ListView(
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
  Padding MySkills(
    String image,
    int percentage,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 15, 5, 6),
      child: new LinearPercentIndicator(
        width: MediaQuery.of(context).size.width - 120,
        lineHeight: 3.0,
        leading: new Image.asset(image),
        trailing: Text(
          percentage.toString() + '%',
          style: TextStyle(color: Colors.blue),
        ),
        animation: true,
        animationDuration: 1000,
        percent: percentage * 0.01,
        backgroundColor: Colors.grey[300],
        progressColor: Colors.blue,
      ),
    );
  }

  Padding MyHobbies(String name, String hobby_image_url) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 250,
        width:250,
        
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
             children: <Widget>[
               Container(
                   width: double.infinity, 
               ),
                  Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          //color: Colors.blue,
          child: Wrap(
            children: <Widget>[
                  Image(
                    image: AssetImage('assets/banks/$name.png'),
                    height: 90.0,
                    width: 90.0,
                  ),
             
                ],
              )
          ),
          Text(
            name,
            
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                      child: Image(
                        image: AssetImage('assets/icons/edit.png'),
                        height: 40.0,
                        width: 40.0,
                      ),

                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return new EDIT_HOBBY(); //Function from edit_info.dart
                        }));
                      }
                    ),
                    InkWell(
                      child: Image(
                        image: AssetImage('assets/icons/delete.png'),
                        height: 40.0,
                        width: 40.0,
                      ),

                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return new deletepopup('hobby',[name,hobby_image_url]); //Function from edit_info.dart
                        }));
                      },
                    )

              
            ],
          ),
             ],
        ),
        ),
    );
  }

  Padding MyBadges(String title, String image_url, String description) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4,8,2,4),
      child: Container(
        
         height: 250,
        width:250,
        
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,4,0,0),
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,

              children: <Widget>[
                Container(
                  width: double.infinity,
                ),
                     Card(
              shape: CircleBorder(
                //borderRadius: BorderRadius.circular(55.0),
              ),
              //color: Colors.blue,
              child: Wrap(
                children: <Widget>[
                  Image(
                    image: AssetImage('assets/badges/$image_url.png'),
                    height: 90.0,
                    width: 90.0,
                  ),
                  //Text(title),
                ],
              )
          ),
          Text(title),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              InkWell(
                      child: Image(
                        image: AssetImage('assets/icons/edit.png'),
                        height: 40.0,
                        width: 40.0,
                      ),

                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return new EDIT_HOBBY(); //Function from edit_info.dart
                        }));
                      }
                    ),
                    InkWell(
                      child: Image(
                        image: AssetImage('assets/icons/delete.png'),
                        height: 40.0,
                        width: 40.0,
                      ),

                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return new EDIT_HOBBY(); //Function from edit_info.dart
                        }));
                      },
                    )

              
            ],
          )

              ],
          ),
           
        ),

      ),
    );
  }



  Container MyProjects(String heading, String subHeading) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
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
            SizedBox(
              height: 100.0,
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                      Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context)=>projectinfo()),
                      );
                  },
                  child: Row(
                    children: <Widget>[
                      Text("View more"),
                      Image(
                        image: NetworkImage(
                            'https://img.icons8.com/cute-clipart/64/000000/circled-chevron-down.png'),
                        height: 20.0,
                        width: 20.0,
                      )
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      side: BorderSide(color: Colors.blue)),
                ),
                InkWell(
              child: Image(
                image: AssetImage('assets/icons/edit.png'),
                height: 40.0,
                width: 40.0,
              ),

              /// Pop Up form to add achievements
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new EDIT_ACHIEVEMENT(heading,subHeading);
                }));
              },
            ),
            InkWell(
              child: Image(
                image: AssetImage('assets/icons/delete.png'),
                height: 40.0,
                width: 40.0,
              ),

              /// Pop Up form to add achievements
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new EDIT_ACHIEVEMENT(heading,subHeading);
                }));
              },
            ),


              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            )
          ],
        ),
      ),
    );
  }

  Container _MyAchievemnts(
      context, String date, String heading, String subHeading) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.8))),
      margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 15.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              date,
              style: TextStyle(fontSize: 17),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: 135,
              width: screenWidth(context) - 150,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.red[200],
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                      title:
                          Text(heading, style: TextStyle(color: Colors.black)),
                      subtitle: Text(subHeading,
                          style: TextStyle(color: Colors.black)),
                          
                    ),
                    Padding(
                      padding : EdgeInsets.all(20.0),
                      child:Row(
                      mainAxisAlignment:MainAxisAlignment.end,
                      

                      children: <Widget>[
                          InkWell(
              child: Image(
                image: AssetImage('assets/icons/edit.png'),
                height: 30.0,
                width: 30.0,
              ),

              /// Pop Up form to add achievements
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new EDIT_ACHIEVEMENT(heading,subHeading);
                }));
              },
            ),
            SizedBox(
               width:15.0
                 
            ),
            InkWell(
              child: Image(
                image: AssetImage('assets/icons/delete.png'),
                height: 30.0,
                width:30.0,
              ),

              /// Pop Up form to add achievements
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new EDIT_ACHIEVEMENT(heading,subHeading);
                }));
              },
            ),
                      ],
                    ) ,
                    )
                    ,
                    
                  ],
                ),
              ),
            ),
          ]),
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
Image communication(String medium){
  return Image(
    image:AssetImage('assets/images/$medium.png'),
    height: 30.0,
    width:30.0,
    
  );
}
