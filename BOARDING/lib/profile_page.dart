//import 'dart:html';

import 'package:BOARDING/ADDSKILLN/multi_form.dart';
import 'package:BOARDING/add_skill.dart';
import 'package:BOARDING/bottom_navigation.dart';
import 'package:BOARDING/drawer.dart';
import 'package:BOARDING/pdf_content.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:link/link.dart';
import 'package:BOARDING/login_page.dart';
import 'package:BOARDING/edit_info.dart';
import 'package:BOARDING/edit_achievement.dart';
import 'package:BOARDING/add_hobby.dart';
import 'package:flutter/rendering.dart';
import 'dart:math';

import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:BOARDING/addproject.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:BOARDING/delete_popup.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:BOARDING/projectinfo.dart';
import 'package:BOARDING/main_loading_screen.dart';
import 'package:BOARDING/loading_login.dart';
import 'package:BOARDING/skills.dart';

class HomePage extends StatefulWidget {
  final List list_about;
  final List list_hobby;
  final List list_projects;
  final List list_achievements;
  //final List list_badges;
  final List list_communications;
  final List list_skills;
  final List list_blogs;
  final List list_education;
  final List list_certifications;

  const HomePage(
      this.list_about,
      this.list_hobby,
      this.list_projects,
      this.list_achievements,
      this.list_communications,
      //this.list_badges,
      this.list_skills,
      this.list_blogs,
      this.list_education,
      this.list_certifications);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int i;
  void initState() {
    i = 0;
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
    );
    final profile_picture = Hero(
        tag: 'hero',
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('assets/icons/profile.jpg'),
            ),
          ),
        ));

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
            child: Icon(Icons.edit),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new EDITINFO(
                    widget.list_about[0]['name'],
                    widget.list_about[0]['aboutme'],
                    widget.list_about[0]['location'],
                    widget.list_communications); //Function from edit_info.dart
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
              for (Map<String, dynamic> item in widget.list_communications)
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
      height: 220,
      width: (MediaQuery.of(context).size.width),
      color: Colors.cyan[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
          ),
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
                  SizedBox(width: (MediaQuery.of(context).size.width) - 330),
                  InkWell(
                      child: Icon(Icons.add),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HobbyForm()),
                        );
                      }),
                ],
              ),
            ],
          ),
          Container(
            height: 160,
            padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                for (Map<String, dynamic> item in widget.list_hobby)
                  MyHobbies(item['name'], item['image_url']),
              ],
            ),
          ),
        ],
      ),
    );

    Image skill_image_returner(String name) {
      try {
        return Image(
          image: AssetImage('assets/skills/$name.png'),
          height: 30.0,
          width: 30.0,
        );
      } on Exception {
        return Image(
          image: AssetImage('assets/skills/DEFAULT.png'),
          height: 30.0,
          width: 30.0,
        );
      }
    }

    Container skill_card(double percent, String competancy, String name) {
      double g = percent * 100;
      int percentage = g.toInt();
      String circle_text = percentage.toString() + '%';
      return Container(
        padding: EdgeInsets.all(10.0),
        height: 80.0,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  skill_image_returner(name),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    name[0].toUpperCase() +
                        name.substring(1).toLowerCase() +
                        ',' +
                        ' ' +
                        competancy,
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'sans-serif',
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width - 150,
                    animation: true,
                    lineHeight: 6.0,
                    animationDuration: 2500,
                    percent: percent,
                    center: Text(
                      circle_text,
                      style: TextStyle(color: Colors.white, fontSize: 5.0),
                    ),
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    List<Widget> skill_card_returner() {
      List<Widget> skill_cards = List<Widget>();
      var competancies = {
        'Beginner': 25,
        'Intermediate': 50,
        'Advanced': 75,
        'Pro': 100
      };
      List list_skills = widget.list_skills;
      int num;
      if (list_skills.length <= 2) {
        num = list_skills.length;
      } else {
        num = 2;
      }

      for (int i = 0; i < num; i++) {
        int percent = competancies[list_skills[i]['competancy']];
        double fraction = percent / 100;
        skill_cards.add(skill_card(fraction, list_skills[i]['competancy'],
            list_skills[i]['name'].toUpperCase()));
      }
      return skill_cards;
    }

    final list_of_all_cards = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: skill_card_returner(),
    );

    final skill_heading = Padding(
      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "SKILLS",
            style: TextStyle(
              fontSize: 17.0,
              letterSpacing: 1.7,
            ),
          ),
          InkWell(
            child: Icon(Icons.add),
            /*
            Icon(
            Icons.add_box,
            color: Colors.lightBlueAccent[700],
            size: 40.0,
          ),*/
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MultiForm()),
              );
            },
          )
        ],
      ),
    );

    final line = Container(
      width: 200.0,
      child: Divider(
        color: Colors.white,
        thickness: 4.0,
      ),
    );

    final view_more_button = Container(
        width: 150.0,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SkillsDisplay(widget.list_skills)),
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            color: Colors.white,
            textColor: Colors.blue,
            hoverColor: Colors.blue,
            splashColor: Colors.blue,
            child: Row(
              children: <Widget>[
                Text(
                  "View more",
                  style: TextStyle(color: Colors.black),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ));
    List<Widget> skills_children_returner() {
      if (widget.list_skills.length <= 2) {
        return [SizedBox(height: 10.0), list_of_all_cards];
      } else {
        return [SizedBox(height: 10.0), list_of_all_cards, view_more_button];
      }
    }

    final skills = Container(
      color: Colors.cyan[50],
      height: 450.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: skills_children_returner(),
      ),
    );
    final personality_traits = Container();
    final tabs = Column(
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
                    labelStyle: TextStyle(fontSize: 17),
                    labelColor: Colors.black,
                    tabs: [
                      Tab(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text("TOP SKILLS"),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: InkWell(
                                  child: Icon(Icons.add),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MultiForm()),
                                    );
                                  },
                                ),
                              )
                            ]),
                      ),
                      Tab(text: "PERSONALITY TRAITS"),
                    ]),
              ),
              Container(
                height: 240,
                child: TabBarView(
                  children: [
                    skills,
                    Container(
                      height: 100.0,
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

    final projects = Container(
        height: 210.0,
        child: Column(
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
                  SizedBox(width: (MediaQuery.of(context).size.width) - 170),
                  InkWell(
                    child: Icon(Icons.add),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return new MyApp(
                            '', '', '', '', '', '', '', '', '', '', '', '','','','',false,'');
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
                    MyProjects(
                        item['id'],
                        item['info'],
                        item['starts'],
                        item['ends'],
                        item['description'],
                        item['status'],
                        item['client_name'],
                        item['client_location'],
                        item['location_of_project_execution'],
                        item['Industry_of_the_client'],
                        item['Role'],
                        item['team_size'],
                        item['case_study_submitted'],
                        item['project_description'],
                        item['project_details'],
                        item['proposed_solution'],
                        item['multi_vendor'],
                      item['benefits'],),
                ],
              ),
            ),
            Container(
              width: double.infinity,
            ),
          ],
        )); // MyProjects function is defined at the end.

    final badges = Container(
      height: 200,
      width: (MediaQuery.of(context).size.width),
      color: Colors.cyan[50],
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
                  //SizedBox(width: (MediaQuery.of(context).size.width) - 350),
                ],
              ),
            ],
          ),
          Container(
            height: 140,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  MyBadges('All Day Everyday', 'assets/badges/always_available',
                      '100% Attendance'),
                  MyBadges('Employee of the Month',
                      'assets/badges/employee_month', '100% Attendance'),
                  MyBadges('Spotlight Award', 'assets/badges/voyager',
                      '100% Attendance'),
                ]
                /*
                for (Map<String, dynamic> item in widget.list_badges)
                  MyBadges(
                      item['title'], item['image_url'], item['description']),
              ],*/
                ),
          ),
        ],
      ),
    );

    final achievemnets = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
                child: Text(
                  'ACHIEVEMENTS',
                  style: TextStyle(
                    fontSize: 17,
                    letterSpacing: 1.7,
                  ),
                )),
            SizedBox(width: (MediaQuery.of(context).size.width) - 235),
            InkWell(
              child: Icon(Icons.add),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new EDIT_ACHIEVEMENT('', '');
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
              //_MyAchievemnts(context, 'May 11', 'Testing2', 'Txt'),
            ],
          ),
        ),
        Container(width: double.infinity),
      ],
    );

    final body = Stack(
      children: <Widget>[
        ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            profile_picture,
            SizedBox(
              height: 4,
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
            tabs,
            SizedBox(
              height: 40,
            ),
            projects,
            SizedBox(
              height: 30,
            ),
            badges,
            SizedBox(
              height: 30,
            ),
            achievemnets,
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
        new Positioned(
            child: Align(
          alignment: Alignment.bottomCenter,
          child: BottomNavigation(),
        )),
      ],
    );

    return Scaffold(
      appBar: ScrollAppBar(
        controller: ScrollController(),
        title: Text("Neon"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.picture_as_pdf,
              color: Colors.white,
            ),
            color: Colors.blue,
            onPressed: () {
              reportView(context, widget.list_about, widget.list_communications,
                  widget.list_skills);
            },
          )
        ],
      ),
      body: SafeArea(
        child: body,
      ),
      drawer: MainDrawer(
          widget.list_blogs, widget.list_education, widget.list_certifications),
    );
  }

  ///Functions called above. Sorry for non uniformity in the type returned.
  Container MySkills(
    String image,
    String competancy,
  ) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 15, 5, 6),
        child: new LinearPercentIndicator(
          width: MediaQuery.of(context).size.width - 120,
          lineHeight: 3.0,
          leading: new Image.asset(image),
          trailing: Text(
            "B",
            style: TextStyle(color: Colors.blue),
          ),
          animation: true,
          animationDuration: 1000,
          percent: 0.8,
          backgroundColor: Colors.grey[300],
          progressColor: Colors.blue,
        ),
      ),
    );
  }

  Column MyHobbies(String name, String hobby_image_url) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 4, 2, 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  elevation: 5,
                  //color: Colors.blue,
                  child: Wrap(
                    children: <Widget>[
                      Image(
                        image: AssetImage('assets/banks/$name.png'),
                        height: 80.0,
                        width: 80.0,
                      )
                    ],
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Align(alignment: Alignment.center, child: Text(name)),
        ),
      ],
    );
  }

  Column MyBadges(String title, String image_url, String description) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 2, 4),
          child: Container(
            height: 92,
            width: 92,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 4, 0, 0),
              child: Column(
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
                      elevation: 4,
                      child: Wrap(
                        children: <Widget>[
                          Image(
                            image: AssetImage('$image_url.png'),
                            height: 80.0,
                            width: 80.0,
                          ),
                          //Text(title),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Align(alignment: Alignment.center, child: Text(title)),
        ),
      ],
    );
  }

  Container MyProjects(
      int id,
      String name,
      String _start,
      String _end,
      String description,
      String status,
      String client_name,
      String client_location,
      String location_of_project_execution,
      String Industry_of_the_client,
      String Role,
      String team_size,
      String case_study_submitted,	String project_description,String project_details, String proposed_solution,bool multi_vendor, String benefits) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.blue,
        child: Wrap(
          children: <Widget>[
            ListTile(
              title: Text(name + '\n' + status,
                  style: TextStyle(color: Colors.white)),
              subtitle: Text(_start + ' - ' + _end,
                  style: TextStyle(color: Colors.lightBlueAccent)),
            ),
            Container(
              height: 30.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 2),
                child: Text(description, style: TextStyle(color: Colors.white)),
              ),
            ),
            Row(
              children: <Widget>[
                RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => projectinfo(
                                name,
                                _start,
                                _end,
                                description,
                                status,
                                client_name,
                                client_location,
                                location_of_project_execution,
                                Industry_of_the_client,
                                Role,
                                team_size,	project_description, project_details,  proposed_solution, multi_vendor,  benefits)));
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
                  child: Icon(Icons.edit, color: Colors.white),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MyApp(
                          id.toString(),
                          name,
                          _start,
                          _end,
                          description,
                          status,
                          client_name,
                          client_location,
                          location_of_project_execution,
                          Industry_of_the_client,
                          Role,
                          team_size,project_description,project_details,proposed_solution,multi_vendor,benefits);
                    }));
                  },
                ),
                InkWell(
                  child: Icon(Icons.delete, color: Colors.white),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              deletepopup('project', [id.toString()])),
                    );
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
    List<Color> colors = [
      Colors.red[100],
      Colors.pinkAccent[50],
      Colors.deepOrange[100],
      Colors.orange[100],
      Colors.amber[100],
      Colors.cyan[100]
    ];
    Color c = colors[new Random().nextInt(colors.length)];

    var months = {
      "01": "Jan",
      "02": "Feb",
      "03": "Mar",
      "04": "April",
      "05": "May",
      "06": "June",
      "07": "July",
      "08": "Aug",
      "09": "Sep",
      "10": "Oct",
      "11": "Nov",
      "12": "Dec"
    };
    print(date);
    //print(months[date.substring(5, 7)]);
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.8))),
      //margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
          Widget>[
        SizedBox(
          width: 0.7,
        ),
        Column(
          children: <Widget>[
            Text(date.substring(0, 3)),
            SizedBox(height: 10.0),
            Text(
              date.substring(date.length - 2, date.length),
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
        Container(
          height: 135,
          width: screenWidth(context) - 140,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 4,
            color: c,
            child: Wrap(
              children: <Widget>[
                ListTile(
                  title: Text(heading, style: TextStyle(color: Colors.black)),
                  subtitle:
                      Text(subHeading, style: TextStyle(color: Colors.black)),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        child: Icon(Icons.edit),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return new EDIT_ACHIEVEMENT(heading, subHeading);
                          }));
                        },
                      ),
                      SizedBox(width: 15.0),
                      InkWell(
                        child: Icon(Icons.delete),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    deletepopup('achievements', [heading])),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  ///Call this function to show error messages.
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

Container communication(String medium) {
  return Container(
    height: 40.0,
    width: 40.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
          image: AssetImage('assets/social_icons/$medium.png'),
          fit: BoxFit.fill),
    ),
  );
}
