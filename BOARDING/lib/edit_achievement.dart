import 'package:BOARDING/main_loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:BOARDING/profile_page.dart';
import 'package:BOARDING/profile_page.dart';
import 'package:BOARDING/login_page.dart';
//import 'package:BOARDING/nouse.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
// import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:BOARDING/loading_login.dart';
import 'package:BOARDING/edit_achievement_loading.dart';

import 'package:fluttertoast/fluttertoast.dart';

class EDIT_ACHIEVEMENT extends StatefulWidget {
  
  final String title;
  final String description;
  const EDIT_ACHIEVEMENT(this.title,this.description);
  @override
  _EDIT_ACHIEVEMENTState createState() => _EDIT_ACHIEVEMENTState();
}

class _EDIT_ACHIEVEMENTState extends State<EDIT_ACHIEVEMENT> {
  DateTime _selectedDateTime = DateTime.now();
  String heading;
/*
  Future<String> submitAchievements(int decider,String _dates, String _title,String _description) async {
    var token = await storage.read(key: 'jwt');
    var response1;
    if(decider==1){
     response1 = await http.post(
       'http://192.168.1.9:8000/achievements',
       headers: {
         'Accept': 'application/json',
         'Authorization': 'Token $token',
       },
       body: {
         'date': _dates,
         'title': _title,
         'description': _description
         //'status':_myActivityResult,
       },
      );
    }
    else{
      String url = 'http://192.168.1.9:8000/achievements/' +
          widget.title;
      response1 = await http.put(
        url,
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Token $token',
        },
        body: {
          'date': _dates,
          'title': _title,
          'description': _description
        //'status':_myActivityResult,

      },
    );

       
    }
    print(response1.body);
    //print('success');
    
  }

*/

  @override
  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
  }

  String title_old='';
  var _title;       //accessing title

  var _description;
  int decider;     //accessing description
  final titlecon= new TextEditingController();
  final descriptioncon= new TextEditingController();
  @override
  void initState(){

      
    titlecon.text = widget.title;
    descriptioncon.text = widget.description;
    if(widget.title==''){
      print(widget.title);
      decider=1;
      heading  = "Add Achievement";
    }
    else{
      decider=0;
      heading = "Update Achievement";
    }

  }

  @override
  Widget build(BuildContext context) {
    //////........................DATE.........................//////////

    var _dates;
    //print(_selectedDateTime);

    var test1 = DateFormat.MMMMd().format(_selectedDateTime);
    String _selected = test1.toString();
    String to_dates = _selected;

    //print(_selected.substring(0,10));
    //final String formattedDate = DateFormat.yMd().format(_selectedDateTime);        //accesing date
    //final selectedText = Text('You selected: $formattedDate');

    final birthdayTile = new Material(
      color: Colors.transparent,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text('Project Date',
              style: TextStyle(
                color: CupertinoColors.systemBlue,
                fontSize: 15.0,
              )),
          const Padding(
            padding: EdgeInsets.only(bottom: 5.0),
          ),
          CupertinoDateTextBox(
              initialValue: _selectedDateTime,
              onDateChange: onBirthdayChange,
              hintText: DateFormat.yMd().format(_selectedDateTime)),
        ],
      ),
    );






    ////.............................DATE........................///////
    final titleheading = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network('https://img.icons8.com/windows/32/000000/title.png'),
            onTap: (){
              //      Navigator.push(context,MaterialPageRoute(builder: (context){

              // return new MyApp();


              // }));


            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'TITLE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,

            ),
          ),

        ],
      ),
    );
    final achievementname =Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(

        controller: titlecon,
        decoration: InputDecoration(labelText: 'Title',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)
        ),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Title id is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
    final dateheading = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network('https://img.icons8.com/metro/26/000000/date-to.png'),
            onTap: (){
              //      Navigator.push(context,MaterialPageRoute(builder: (context){

              // return new MyApp();


              // }));


            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'DATE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,

            ),
          ),

        ],
      ),
    );
    final descriptionheading = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network('https://img.icons8.com/windows/32/000000/edit.png'),
            onTap: (){
              //      Navigator.push(context,MaterialPageRoute(builder: (context){

              // return new MyApp();


              // }));


            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'DESCRIPTION',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,

            ),
          ),

        ],
      ),
    );
    final descriptioninfo =Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: descriptioncon,
        maxLines: 6,
        // controller: facebookcon,
        decoration: InputDecoration(labelText: 'write your description here',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)
        ),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Title id is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
    return Scaffold(
      appBar: AppBar(title: Text(heading),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          titleheading,
          achievementname,

          SizedBox(
            height: 20,
          ),
          Container(







          ),
          dateheading,
          Container(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(children: <Widget>[
                  // selectedText,
                  const SizedBox(height: 15.0),
                  birthdayTile
                ])),
          ),


          // Container(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: <Widget>[
          //       ListTile(
          //         title:Text( "Date: ${pickedDate.year},${pickedDate.month},${pickedDate.day}"

          //         ),
          //         trailing: Icon(Icons.keyboard_arrow_down),
          //         onTap: _pickDate,
          //                             )
          //                           ]
          //                         ),

          //                       ),
          // Container(
          //   height: 100,
          //           child: Align(
          //             heightFactor: 2,
          //             alignment: Alignment(-0.7, 0),
          //             child: BasicDateField(),
          //           ),
          //   ),
          SizedBox(
            height: 20,
          ),
          descriptionheading,
          descriptioninfo,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical:15.0),
                child:RaisedButton(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),


                  ),
                  onPressed: (){
                    Navigator.pop(context);
                    // Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  padding: EdgeInsets.all(15),

                  color:Colors.blue,
                  child:Row(children: <Widget>[Icon(Icons.cancel,color: Colors.white,), SizedBox(width:5.0),Text('Cancel', style:TextStyle(color:Colors.white,fontSize: 15.0))])
                  
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical:15.0),
                child:RaisedButton(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),

                  ),



                  // onPressed: (){

                  //   // Navigator.push(context,MaterialPageRoute(builder: (context){
                  //   //   return new HomePage();


                  //   // }));
                  //   // Navigator.of(context).pushNamed(HomePage.tag);
                  // },
                  padding: EdgeInsets.all(15),
                  color:Colors.blue,
                  onPressed: () {
                    setState(() {
                      _dates = to_dates;
                      _title = titlecon.text;
                      _description = descriptioncon.text;
                      title_old=widget.title;
                    });
                    print(decider);
                    print(_title);

                    //submitAchievements(decider, _dates, _title, _description);



                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) {
                      return LoadingScreenEditAchievement(decider,_dates,_title,_description,title_old);
                    }));
                  },


                  child: Row(children: <Widget>[ Icon(Icons.save,color:Colors.white), SizedBox(width:5.0),  Text('Save', style:TextStyle(color:Colors.white,fontSize: 15.0))]),
                  ),

                ),

            
              // Text("your name is $_name and your location is $_location "),


            ],
          ),







        ],


      ),
    );


  }


}
