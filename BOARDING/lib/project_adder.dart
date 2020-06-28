import 'package:flutter/material.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:BOARDING/login_page.dart';
import 'package:BOARDING/success_popup.dart';
import 'package:BOARDING/loading_login.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:BOARDING/main_loading_screen.dart';
import 'package:BOARDING/hobby_class.dart';
import 'dart:convert';

class ProjectLoadingScreen extends StatefulWidget {
  final int decider;
  final String name;
  final String start;
  final String end;
  final String status;
  final String des;
  final String client_name;
  final String client_location;
  final String client_industry;
  final String location_of_project_execution;
  final String teamsize;
  //final String case_study_submitted;
  final String role;
  final String project_description;
  final String project_details;
  final String proposed_solution;
  final bool multi_vendor;
  final String benefits;
  final String id;

  const ProjectLoadingScreen(
      this.id,
      this.decider,
      this.name,
      this.start,
      this.end,
      this.status,
      this.des,
      this.client_name,
      this.client_location,
      this.client_industry,
      this.location_of_project_execution,
      this.teamsize,
      this.role,
      this.project_description,
      this.project_details,
      this.proposed_solution,
      this.multi_vendor,
      this.benefits,
      );

  @override
  _ProjectLoadingScreenState createState() => _ProjectLoadingScreenState();
}

class _ProjectLoadingScreenState extends State<ProjectLoadingScreen> {
  String msg1;
  String msg2;

  Future<String> addproject(
      String id,
      String info,
      String start,
      String end,
      String status,
      String des,
      String client_name,
      String client_location,
      String location_of_project_execution,
      String client_industry,
      String role,
      String teamsize,
      String project_description,
      String project_details,
      String proposed_solution,
      bool multi_vendor,
      String benefits,
      String msg) async {
    var token = await storage.read(key: 'jwt');
    var res;

    if (widget.decider == 1) {
      res = await http.post('http://192.168.1.9:8000/project/0', headers: {
        'Accept': 'application/json',
        'Authorization': 'Token $token',
      }, body: {
        "info": info,
        "starts": start,
        "ends": end,
        "status": status,
        "description": des,
        "client_name": client_name,
        "client_location": client_location,
        "location_of_project_execution": location_of_project_execution,
        "Industry_of_the_client": client_industry,
        "Role": role,
        "team_size": teamsize,
        "project_description":project_description,
        "project_details":project_details,
        "proposed_solution":proposed_solution,
        "multi_vendor":multi_vendor,
        "benefits":benefits,



      });
    } else {
      res = await http.put('http://192.168.1.9:8000/project', headers: {
        'Accept': 'application/json',
        'Authorization': 'Token $token',
      }, body: {
        "info": info,
        "starts": start,
        "ends": end,
        "status": status,
        "description": des,
        "client_name": client_name,
        "client_location": client_location,
        "location_of_project_execution": location_of_project_execution,
        "Industry_of_the_client": client_industry,
        "Role": role,
        "project_description":project_description,
        "project_details":project_details,
        "proposed_solution":proposed_solution,
        "multi_vendor":multi_vendor,
        "benefits":benefits,
        "team_size": teamsize,
        "id": id
      });
    }
    print(res.body);

    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 14.0);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoadData()),
    );
    return "success";
  }

  @override
  void initState() {
    if (widget.decider == 1) {
      msg1 = "Your project is being added. please wait...";
      msg2 = "New project added";
    } else {
      msg1 = "Your project is being updated. please wait...";
      msg2 = "Project updated";
    }

    //Future <String> f = addhobbies(widget.hobbies);

    Future<String> res = addproject(
        widget.id,
        widget.name,
        widget.start,
        widget.end,
        widget.status,
        widget.des,
        widget.client_name,
        widget.client_location,
        widget.location_of_project_execution,
        widget.client_industry,
        widget.role,
        widget.teamsize,widget.project_description,widget.project_details,widget.proposed_solution,widget.multi_vendor,widget.benefits,
        msg2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                ),
                Loading(indicator: BallPulseIndicator(), size: 100.0),
                Text(msg1,
                    style: TextStyle(color: Colors.white, fontSize: 20.0))
              ]),
        ));
  }
}
