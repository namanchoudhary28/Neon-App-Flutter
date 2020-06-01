import 'package:BOARDING/main_loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:provider/provider.dart';
import 'package:BOARDING/signup.dart';
import 'package:BOARDING/login_page.dart';
import 'package:BOARDING/profile_page.dart';
// import 'package:BOARDING/dropdown.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:BOARDING/loading_login.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _projectinfo; //accessing projectinfo
  var _assignedto; //accessing assignedto
  String _myActivityResult; //accessing dropdown value project status
  var _jkval; //accessing radio button value

  var _description; //accessing description

  final projectinfocon = new TextEditingController();

  final assignedtocon = new TextEditingController();
  final descriptioncon = new TextEditingController();
  String _jk = "";
  String _myActivity;
  // String _myActivityResult;         //accessing Dropdown value
  Future<String> submitProjects(
      String _projectinfo, String _description, String _myActivityResult) async {
    var token = await storage.read(key: 'jwt');

    var response1 = await http.post(
      'http://10.0.2.2:8000/api/addproject',
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Token $token',
      },
      body: {
        'info':_projectinfo,
        'description': _description,
        'status':_myActivityResult,
        'starts':'2020-09-06',
        'ends':'2017-06-07',
      },
    );
    print(response1.body);
  }

  void _pilihjk(String value) {
    setState(() {
      _jk = value;
    });
  }

  final formKey = new GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final projectname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network(
                'https://img.icons8.com/windows/32/000000/edit.png'),
            onTap: () {
              //      Navigator.push(context,MaterialPageRoute(builder: (context){

              // return new MyApp();

              // }));
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Project Info',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
    final projectinfo = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: projectinfocon,
        decoration: InputDecoration(
            labelText: 'Name',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)),
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
      ),
    );
    final assignedname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network(
                'https://img.icons8.com/windows/30/000000/add-user-group-man-man.png'),
            onTap: () {
              //      Navigator.push(context,MaterialPageRoute(builder: (context){

              // return new MyApp();

              // }));
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Assigned To',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
    final assignedinfo = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: assignedtocon,
        decoration: InputDecoration(
            labelText: 'Name',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)),
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
      ),
    );
    final descriptionname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network(
                'https://img.icons8.com/windows/32/000000/edit.png'),
            onTap: () {
              //      Navigator.push(context,MaterialPageRoute(builder: (context){

              // return new MyApp();

              // }));
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
    final descriptioninfo = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: descriptioncon,
        decoration: InputDecoration(
            labelText: 'write here',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)),
        maxLines: 5,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Name is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );

    final dropdownname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network(
                'https://img.icons8.com/ios-glyphs/32/000000/tags.png'),
            onTap: () {
              //      Navigator.push(context,MaterialPageRoute(builder: (context){

              // return new MyApp();

              // }));
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Project Status',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
    final checklistname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network(
                'https://img.icons8.com/ios-glyphs/30/000000/inspection.png'),
            onTap: () {
              //      Navigator.push(context,MaterialPageRoute(builder: (context){

              // return new MyApp();

              // }));
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Checklist',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
    final uploadname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network(
                'https://img.icons8.com/ios-glyphs/30/000000/upload.png'),
            onTap: () {
              //      Navigator.push(context,MaterialPageRoute(builder: (context){

              // return new MyApp();

              // }));
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Upload',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Project"),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          projectname,
          projectinfo,
          assignedname,
          assignedinfo,
          dropdownname,
          Container(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(16),
                    child: DropDownFormField(
                      titleText: 'Status',
                      hintText: 'Please choose one',
                      value: _myActivity,
                      onSaved: (value) {
                        setState(() {
                          _myActivity = value;
                        });
                      },
                      onChanged: (value) {
                        setState(() {
                          _myActivity = value;
                        });
                      },
                      dataSource: [
                        {
                          "display": "Ongoing",
                          "value": "Ongoing",
                        },
                        {
                          "display": "Completed",
                          "value": "Completed",
                        },
                        {
                          "display": "Pending",
                          "value": "Pending",
                        },
                      ],
                      textField: 'display',
                      valueField: 'value',
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: RaisedButton(
                      child: Text('Save'),
                      onPressed: _saveForm,
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(16),
                  //   child: Text(_myActivityResult),
                  // )
                ],
              ),
            ),
          ),
          // Container(
          //   height: 225,
          //   child: MyHomePage(),
          // ),

          // Container(
          //   padding: const EdgeInsets.only(left: 14.0, top: 14.0),
          //   child: Text("Basic RadioButtonGroup",
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       fontSize: 20.0
          //     ),
          //   ),
          // ),
          new RadioListTile(
            value: "External",
            title: new Text("External"),
            groupValue: _jk,
            onChanged: (String value) {
              _pilihjk(value);
            },
            activeColor: Colors.blue,
          ),
          new RadioListTile(
            value: "Internal",
            title: new Text("Internal"),
            groupValue: _jk,
            onChanged: (String value) {
              _pilihjk(value);
            },
            activeColor: Colors.blue,
          ),
          // RadioButtonGroup(

          //   labels: [
          //     "External",
          //     "Internal",
          //   ],
          //   labelStyle: TextStyle( fontSize: 20),
          //   disabled: [

          //   ],
          //   onChange: (String label, int index) => print("label: $label index: $index"),
          //   onSelected: (String label) => print(label),

          // ),
          // Text($label),
          SizedBox(
            height: 20,
          ),

          descriptionname,
          descriptioninfo,
          checklistname,
          uploadname,
          SizedBox(
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
                    // Navigator.push(context,MaterialPageRoute(builder: (context){
                    //   return new EDITINFO();

                    // }));
                    // Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  padding: EdgeInsets.all(20),
                  color: Colors.blue,
                  child: Text('      Cancel        ',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
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
                  // onPressed: _saveForm(),
                  //       Container(
                  //   padding: EdgeInsets.all(8),
                  //   child: RaisedButton(
                  //     child: Text('Save'),
                  //     onPressed: _saveForm,
                  //   ),
                  // ),
                  onPressed: () {
                    setState(() {
                      _jkval = _jk;
                      _projectinfo = projectinfocon.text;
                      _assignedto = assignedtocon.text;
                      _description = descriptioncon.text;
                    });
                    print(_myActivityResult);

                    submitProjects(_projectinfo, _description, _myActivityResult);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return LoadData();
                    }));
                  },

                  // _jkval=_jk;

                  // Navigator.push(context,MaterialPageRoute(builder: (context){
                  //   return new EDITINFO();

                  // }));
                  // Navigator.of(context).pushNamed(HomePage.tag);

                  padding: EdgeInsets.all(20),
                  color: Colors.blue,
                  child: Text('Save Changes',
                      style: TextStyle(color: Colors.white, fontSize: 20.0)),
                ),
              ),
            ],
          ),
          // Container(
          //       padding: EdgeInsets.all(16),
          //       child: Text('$_jkval,   $_myActivity,    $_projectinfo,    $_assignedto,      $_description'),

          //     ),

          // Container(
          //   padding: EdgeInsets.all(16),
          //   child: Text(_myActivity),

          // )
        ],
      ),
    );
  }
}
