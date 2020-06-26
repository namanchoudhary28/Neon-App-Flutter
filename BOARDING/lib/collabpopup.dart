import 'package:flutter/material.dart';

class collabpopup extends StatefulWidget {
  @override
  _collabpopupState createState() => _collabpopupState();
}

class _collabpopupState extends State<collabpopup> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text("Collaborators"),
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
                      Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://img.freepik.com/free-vector/businessman-profile-cartoon_18591-58479.jpg?size=338&ext=jpg")),
                          )),
                      Text("User's name")
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
                      Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://img.freepik.com/free-vector/businessman-profile-cartoon_18591-58479.jpg?size=338&ext=jpg")),
                          )),
                      Text("User's name")
                    ]))
          ],
        ));
  }
}
