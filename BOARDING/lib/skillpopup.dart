import 'package:flutter/material.dart';

class skillspopup extends StatefulWidget {
  @override
  _skillspopupState createState() => _skillspopupState();
}

class _skillspopupState extends State<skillspopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("SKILLS USED", style: TextStyle(fontSize: 15.0)),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("close"))
      ],
      content: Column(
        children: <Widget>[
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
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://img.icons8.com/color/48/000000/html-5.png'),
                    ),
                    Text("HTML")
                  ])),
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
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://img.icons8.com/color/48/000000/html-5.png'),
                    ),
                    Text("JAVASCRIPT")
                  ])),
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
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://img.icons8.com/color/48/000000/html-5.png'),
                    ),
                    Text("PYTHON")
                  ])),
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
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          'https://img.icons8.com/color/48/000000/html-5.png'),
                    ),
                    Text("FLUTTER")
                  ])),
        ],
      ),
    );
  }
}
