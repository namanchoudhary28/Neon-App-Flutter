import 'package:flutter/material.dart';
import 'package:BOARDING/collabpopup.dart';
import 'package:BOARDING/skillpopup.dart';

class projectinfo extends StatefulWidget {
  @override
  _projectinfoState createState() => _projectinfoState();
}

class _projectinfoState extends State<projectinfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project info"),
      ),
      body: ListView(scrollDirection: Axis.vertical, children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: double.infinity,
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
                padding: EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 15.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    border: Border.all(
                      color: Colors.blue,
                      width: 1,
                    )),
                child: Text(
                  "Neon Application",
                  style: TextStyle(
                    fontFamily: "sans-serif",
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Image(
                        image: NetworkImage(
                            'https://img.icons8.com/ultraviolet/40/000000/start.png'),
                        height: 25.0,
                        width: 25.0,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text("STARTS")
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.blue,
                    width: 0.8,
                  ))),
                  padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.blue,
                      width: 0.8,
                    ))),
                    padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                    child: Row(
                      children: <Widget>[
                        Image(
                          image: NetworkImage(
                              'https://img.icons8.com/flat_round/64/000000/end--v1.png'),
                          height: 25.0,
                          width: 25.0,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text("ENDS")
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      height: 35.0,
                      width: 35.0,
                      child: Text("20"),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.blue,
                          width: 0.8,
                        ),
                      ),
                    ),
                    Container(
                      height: 35.0,
                      width: 35.0,
                      child: Text("09"),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.blue,
                          width: 0.8,
                        ),
                      ),
                    ),
                    Container(
                      height: 35.0,
                      width: 70.0,
                      child: Text("2020"),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.blue,
                          width: 0.8,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: 35.0,
                      width: 35.0,
                      child: Text("20"),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.blue,
                          width: 0.8,
                        ),
                      ),
                    ),
                    Container(
                      height: 35.0,
                      width: 35.0,
                      child: Text("09"),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.blue,
                          width: 0.8,
                        ),
                      ),
                    ),
                    Container(
                      height: 35.0,
                      width: 70.0,
                      child: Text("2020"),
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Colors.blue,
                          width: 0.8,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Status :",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Image(
                  image: NetworkImage(
                      'https://img.icons8.com/fluent/50/000000/arrow.png'),
                ),
                Text(
                  "FINISHED",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            Container(
              width: 350.0,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.blue,
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
              child: Text(
                "this is the description of the project. it will be 200 words long. here u will know what this project is all about. read on to see technologies used in this project",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>collabpopup()),
                 );
              },
              child: Text("View Collaborators", style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            RaisedButton(
              onPressed: () {
                
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>skillspopup()),
                );
              },
              child: Text("View Skills",
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            )
          ],
        )
      ]));
  }
}




