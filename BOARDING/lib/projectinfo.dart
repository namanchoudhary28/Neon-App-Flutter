import 'package:flutter/material.dart';
import 'package:BOARDING/collabpopup.dart';
import 'package:BOARDING/skillpopup.dart';

class projectinfo extends StatefulWidget {
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
  final String project_description;
  final String project_details;
  final String proposed_solution;
  final bool multi_vendor;
  final String benefits;
  // final String case_study_submitted;
  final String role;
  const projectinfo(
      this.name,
      this.start,
      this.end,
      this.des,
      this.status,
      this.client_name,
      this.client_location,
      this.location_of_project_execution,
      this.client_industry,
      this.role,
      this.teamsize,
      this.project_description,this.project_details, this.proposed_solution,this.multi_vendor,this.benefits
  );
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
                    widget.name,
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
                        child: Text(widget.start.substring(8, 10)),
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
                        child: Text(widget.start.substring(5, 7)),
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
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(widget.start.substring(0, 4))),
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
                        child: Text(widget.end.substring(8, 10)),
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
                        child: Text(widget.end.substring(5, 7)),
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
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(widget.end.substring(0, 4))),
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
                height: 20.0,
              ),
              Container(
                width: 380.0,
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.bubble_chart,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Status :",
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          "Completed",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),

              Container(
                width: 380.0,
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.bubble_chart,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Client Name :",
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          widget.client_name,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 380.0,
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.bubble_chart,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Client Location :",
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          widget.client_location,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 380.0,
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.bubble_chart,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Project Description :",
                              style:
                              TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          widget.project_description,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 380.0,
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.bubble_chart,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Project Details :",
                              style:
                              TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          widget.project_details,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 380.0,
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.bubble_chart,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Proposed Solution :",
                              style:
                              TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          widget.proposed_solution,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 380.0,
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.bubble_chart,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Multi Vendor :",
                              style:
                              TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          widget.multi_vendor.toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 380.0,
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.bubble_chart,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Benefits :",
                              style:
                              TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          widget.benefits,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 380.0,
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.bubble_chart,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Project Location :",
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          widget.location_of_project_execution,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 380.0,
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.bubble_chart,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Client Industry :",
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          widget.client_industry,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 380.0,
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.bubble_chart,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Role :",
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          widget.role,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: 380.0,
                child: Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(5.0, 15.0, 5.0, 15.0),
                    child: Row(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.bubble_chart,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 10.0),
                            Text(
                              "Team Size :",
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          widget.teamsize,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
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
                  widget.des,
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
                    MaterialPageRoute(builder: (context) => collabpopup()),
                  );
                },
                child: Text("View Collaborators",
                    style: TextStyle(color: Colors.white)),
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
                    MaterialPageRoute(builder: (context) => skillspopup()),
                  );
                },
                child:
                    Text("View Skills", style: TextStyle(color: Colors.white)),
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
