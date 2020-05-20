import 'package:BOARDING/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:provider/provider.dart';
import 'package:BOARDING/signup.dart';
import 'package:BOARDING/login_page.dart';


class EDITINFO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // final name= TextFormField(
    //   // keyboardType: TextInputType.emailAddress,
    //   validator: (value) {
    //     if (value.isEmpty) {
    //       return 'Please enter your email address';
    //     }
    //     return null;
    //   },
    //   autofocus: false,
    //   decoration: InputDecoration(
    //       hintText: 'Name',
    //       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
    //   ),
    // );
    final name =TextFormField(
      decoration: InputDecoration(labelText: 'Name',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
      ),
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
    );
    final location =TextFormField(
      decoration: InputDecoration(labelText: 'Location',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
      ),
      // maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Location is Required';
        }

        return null;
      },
      // onSaved: (String value) {
      //   _name = value;
      // },
    );
    final aboutme= TextField(

      decoration: InputDecoration(
          labelText: "About",

          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)

      ),
      maxLines: 6,


    );

    var checkBoxvalue=false;
    return Scaffold(
      appBar: AppBar(title: Text("Edit Info"),
      ),

      body:

      ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            child: Align(
              heightFactor: 4,
              alignment: Alignment(-0.9, 0),
              child: Text("Basic",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),

              ),




            ),
          ),
          name,
          SizedBox(
            height: 20,
          ),
          location,
          SizedBox(
            height : 20,
          ),
          Container(
            child: Align(
              heightFactor: 2,
              alignment: Alignment(-0.9, 0),
              child: Text("COMMUNICATION",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),

              ),




            ),
          ),
          Row(
              children: <Widget>[
                Checkbox(value: true,
                    onChanged: (bool value){


                    }
                ),
                Text("nnn"),




              ]

          ),
          Row(
              children: <Widget>[
                Checkbox(value: true,
                    onChanged: (bool value){


                    }
                ),
                Text("nnn"),




              ]

          ),
          Row(
              children: <Widget>[
                Checkbox(value: true,
                    onChanged: (bool value){


                    }
                ),
                Text("nnn"),




              ]

          ),
          Row(
              children: <Widget>[
                Checkbox(value: true,
                    onChanged: (bool value){


                    }
                ),
                Text("nnn"),




              ]

          ),
          Row(
              children: <Widget>[
                Checkbox(value: true,
                    onChanged: (bool value){


                    }
                ),
                Text("nnn"),




              ]

          ),
          Row(
              children: <Widget>[
                Checkbox(value: true,
                    onChanged: (bool value){


                    }
                ),
                Text("nnn"),




              ]

          ),
          Container(
            child: Align(
              heightFactor: 2,
              alignment: Alignment(-0.9, 0),
              child: Text("About Me",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,

                ),

              ),




            ),
          ),
          aboutme,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical:20.0),
                child:RaisedButton(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),


                  ),
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return new HomePage();


                    }));
                    // Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  padding: EdgeInsets.all(20),

                  color:Colors.blue,
                  child: Text('      Cancel        ', style:TextStyle(color:Colors.white,fontSize: 20.0)
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical:20.0),
                child:RaisedButton(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),

                  ),
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return new HomePage();


                    }));
                    // Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  padding: EdgeInsets.all(20),
                  color:Colors.blue,
                  child: Text('Save Changes', style:TextStyle(color:Colors.white,fontSize: 20.0)
                  ),
                ),
              ),


            ],
          )










        ],
      ),


    );

  }
}