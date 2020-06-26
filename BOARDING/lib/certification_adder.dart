import 'package:flutter/material.dart';
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

class CertificationLoadingScreen extends StatefulWidget {
  final String title;
  final String organization;
  final String certification_type;
  final String year;
  final String certificate;

  const CertificationLoadingScreen(this.title, this.organization,
      this.certification_type, this.year, this.certificate);

  @override
  _CertificationLoadingScreenState createState() =>
      _CertificationLoadingScreenState();
}

class _CertificationLoadingScreenState
    extends State<CertificationLoadingScreen> {
  String msg = "Certificate is being added. please wait...";

  Future<String> addcertification(String title, String organization,
      String certificate_type, String year, String certificate) async {
    var token = await storage.read(key: 'jwt');

    var res =
        await http.post('http://192.168.1.9:8000/certification', headers: {
      'Accept': 'application/json',
      'Authorization': 'Token $token',
    }, body: {
      "title": title,
      "organization": organization,
      "certificate_type": certificate_type,
      "year": year,
      "certificate": certificate
    });

    Fluttertoast.showToast(
        msg: 'Certificate Added',
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
    //Future <String> f = addhobbies(widget.hobbies);

    Future<String> res = addcertification(widget.title, widget.organization,
        widget.certification_type, widget.year, widget.certificate);
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
                Text(msg, style: TextStyle(color: Colors.white, fontSize: 20.0))
              ]),
        ));
  }
}
