import 'package:BOARDING/main_loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:BOARDING/login_page.dart';
import 'package:BOARDING/profile_page.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:BOARDING/loading_login.dart';

//void main() => runApp(MyApp());
/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}*/

class EDIT_HOBBY extends StatefulWidget {
  @override
  EDIT_HOBBYState createState() => EDIT_HOBBYState();
}

class EDIT_HOBBYState extends State<EDIT_HOBBY> {
  String _selected;
  String _selected2;
  var image;      //accessing image folder location
  var name;       //accessing name of hobby

  Future<String> submitNew(String image, String name) async {

    List list_info;
    var token=await storage.read(key:'jwt');

    var response1=await http.post(
      'http://10.0.2.2:8000/api/addhobby',
      headers: {
        'Accept':'application/json',
        'Authorization':'Token $token',
      },
      body:{
        'name': name,
        'hobby_image_url': image,
      },
    );
    print(response1.body);
  }


  List<Map> _myJson = [
    {"id": '1', "image": "assets/banks/Dancing.png", "name": "Dancing"},
    {"id": '2', "image": "assets/banks/Singing.png", "name": "Singing"},
    {"id": '3', "image": "assets/banks/Cycling.png", "name": "Cycling"},
    {"id": '4', "image": "assets/banks/Drawing.png", "name": "Drawing"},
    {"id": '5', "image": "assets/banks/Cooking.png", "name": "Cooking"},
    {"id": '6', "image": "assets/banks/Surfing.png", "name": "Surfing"},
    {"id": '7', "image": "assets/banks/Writing.png", "name": "Writing"},
    {"id": '8', "image": "assets/banks/Reading.png", "name": "Reading"},
    {"id": '9', "image": "assets/banks/Archery.png", "name": "Archery"},
    {"id": '10', "image": "assets/banks/Camping.png", "name": "Camping"},
    // {"id": '11', "image": "assets/banks/rhb-now.png", "name": "RHB NOW"},
    // {
    //   "id": '12',
    //   "image": "assets/banks/standardchartered.png",
    //   "name": "Standard Chartered"
    // },
    // {
    //   "id": '13',
    //   "image": "assets/banks/uob.png",
    //   "name": "United Oversea Bank"
    // },
    // {"id": '14', "image": "assets/banks/ocbc.png", "name": "OCBC Bank"},
  ];

  @override
  Widget build(BuildContext context) {
    final hobbytag = Padding(
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
            'Select Hobby',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Hobby'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          hobbytag,
          Container(
            padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
            decoration: BoxDecoration(
                border: Border.all(width: 20, color: Colors.blue[200]),
                borderRadius: BorderRadius.circular(50)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        isDense: true,
                        hint: new Text("Select an option"),
                        value: _selected,
                        onChanged: (String newValue) {
                          setState(() {
                            _selected = newValue;
                            _selected2 = newValue.substring(13,20);

                          });

                          print(_selected);
                          print(_selected2);
                        },
                        items: _myJson.map((Map map) {
                          return new DropdownMenuItem<String>(
                            value: map["image"].toString(),
                            // value: _mySelection,
                            child: Row(
                              children: <Widget>[
                                Image.asset(
                                  map["image"],
                                  height: 120,
                                  width: 100,
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(map["name"])),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height:330),
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
                      image=_selected;
                      name=_selected2;
                      // _jkval = _jk;
                      // _projectinfo = projectinfocon.text;
                      // _assignedto = assignedtocon.text;
                      // _description = descriptioncon.text;
                    });

                    submitNew(image, name);
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return LoadData();
                    }));
                    // print(_myActivityResult);

                    // submitProjects(_projectinfo, _description, _myActivityResult);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return new HomePage();
                    // }));
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
          //       child: Text('$image,   $name'),

          //     ),
        ],
      ),
    );
  }
}