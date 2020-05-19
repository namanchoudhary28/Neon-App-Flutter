import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
// import 'package:BOARDING/login_page.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';




  @override
  Widget build(BuildContext context) {
    final profile_picture = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(10),
        child: CircleAvatar(
          radius: 50,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(
              'https://www.postplanner.com/hs-fs/hub/513577/file-2886416984-png/blog-files/facebook-profile-pic-vs-cover-photo-sq.png?width=250&height=250&name=facebook-profile-pic-vs-cover-photo-sq.png'),
        ),
      ),
    );

    final name = Padding(
      padding: EdgeInsets.all(8),
      child: Center(
        child: Text(
          'The One',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );

    final city = Center(
      child: Text(
        'Delhi, IN',
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
              Image.network(
                'https://img.icons8.com/android/24/000000/phone.png',
                scale: 1.1,
              ),
              Image.network(
                'https://img.icons8.com/color/48/000000/facebook-new.png',
                scale: 1.2,
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

    final hobby = Container(
      height: 170,
      color: Colors.cyan[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
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
        ],
      ),
    );

    final skills =  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
        DefaultTabController(
        length: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              child: TabBar(
                  labelStyle: TextStyle(fontSize:14),
                  labelColor: Colors.blue,
                  tabs: [
                    Tab(
                      text: "TOP SKILLS",
                    ),
                    Tab(
                        text: "PERSONALITY TRAITS"),
                  ]),
            ),
            Container(
              height: 300,
              child: TabBarView(
                children: [
                  Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 3),
                          child: new LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width - 120,
                            lineHeight: 5.0,
                            leading: new Image.network(
                                'https://img.icons8.com/color/48/000000/python.png'),
                            trailing: Text(
                              '50%',
                              style: TextStyle(color: Colors.blue),
                            ),
                            animation: true,
                            animationDuration: 1000,
                            percent: 0.5,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 3),
                          child: new LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width - 120,
                            lineHeight: 5.0,
                            leading: new Image.network(
                                'https://img.icons8.com/color/48/000000/python.png'),
                            trailing: Text(
                              '75%',
                              style: TextStyle(color: Colors.blue),
                            ),
                            animation: true,
                            animationDuration: 1000,
                            percent: 0.75,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 3),
                          child: new LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width - 120,
                            lineHeight: 5.0,
                            leading: new Image.network(
                                'https://img.icons8.com/color/48/000000/python.png'),
                            trailing: Text(
                              '90%',
                              style: TextStyle(color: Colors.blue),
                            ),
                            animation: true,
                            animationDuration: 1000,
                            percent: 0.9,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.blue,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 3),
                          child: new LinearPercentIndicator(
                            width: MediaQuery.of(context).size.width - 120,
                            lineHeight: 5.0,
                            leading: new Image.network(
                                'https://img.icons8.com/color/48/000000/python.png'),
                            trailing: Text(
                              '30%',
                              style: TextStyle(color: Colors.blue),
                            ),
                            animation: true,
                            animationDuration: 1000,
                            percent: 0.3,
                            backgroundColor: Colors.grey,
                            progressColor: Colors.blue,
                          ),
                        ),
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

    final projects= Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:<Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0,0,0,10),
        child: Text('PROJECTS',style: TextStyle(fontSize: 15),),
      ),
      Container(
      height: 170,
        padding:EdgeInsets.fromLTRB(16, 5, 16, 0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          MyProjects('Booking 1', '20 May 2020'),
          MyProjects('Booking 2', '1 May 2020'),
          MyProjects('Booking 3', '1 May 2021'),
        ],
      ),
    ),],)
    ;   // MyProjects function is defined at the end. Usage Syntax: MyProjects(heading,subheading)

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
      ],
    );

    return Scaffold(
      body: SafeArea(
        child:body,
    ),
    );
    
    
    
  }
  Container MyProjects(String heading, String subHeading){
    return Container(
            width:250,
            child:Card(
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.blue,
              child:Wrap(
                children: <Widget>[
                  ListTile(
                    title:Text(heading,style: TextStyle(color: Colors.white)),
                    subtitle: Text(subHeading,style: TextStyle(color: Colors.lightBlueAccent)),
                  ),
                ],
              ),
            ),
    );
  }
}
