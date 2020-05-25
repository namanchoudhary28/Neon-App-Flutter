import 'package:BOARDING/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:provider/provider.dart';
import 'package:BOARDING/signup.dart';
import 'package:BOARDING/login_page.dart';

class EDITINFO extends StatefulWidget {
  @override
  _EDITINFOState createState() => _EDITINFOState();
  
}

class _EDITINFOState extends State<EDITINFO> {
   var _name;          //accesing name 
   var _location;     //accesing location
   var _about;        //acessing about me
   var _phoneno;      //acessing phone no
   var _whatsappno;  //acessing whatsappno
   var _skypeno;      //acessing skype no
   var _linkedin;   //acessing linkedin
   var _twitter;    //acessing twitter
   var _facebook;   //acessing facebook
  final namecon= new TextEditingController();

  final locationcon= new TextEditingController();
  final aboutcon= new TextEditingController();
  final phonecon= new TextEditingController();
  final whatsappnocon= new TextEditingController();
  final skypenocon= new TextEditingController();
  final linkedincon= new TextEditingController();
  final twittercon= new TextEditingController();
  final facebookcon= new TextEditingController();


    
  @override
  Widget build(BuildContext context) {

        final basicname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network('https://img.icons8.com/metro/24/000000/info.png'),
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
            'BASIC',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              
              
            ),
          ),

        ],
      ),
    );
    
    
     final name = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: namecon,
        decoration: InputDecoration(labelText: 'Name',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)
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
      ),
    );
     final location = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: locationcon,
        decoration: InputDecoration(labelText: 'Location',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)
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
      ),
    );
     final communicationname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network('https://img.icons8.com/material/24/000000/phone--v1.png'),
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
            'COMMUNICATION',
            style: TextStyle(
             fontWeight: FontWeight.bold,
              fontSize: 18,
              
            ),
          ),

        ],
      ),
    );
    final phone =Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: phonecon,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'Phone No',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)
        ),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'Phone no is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
    final whatsapp =Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: whatsappnocon,
        keyboardType: TextInputType.number,

        decoration: InputDecoration(labelText: 'Whatsapp',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)
        ),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'whatsapp no is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
    final skype =Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: skypenocon,
        decoration: InputDecoration(labelText: 'Skype',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)
        ),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'skype id is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
   
    final linkedin =Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: linkedincon,
        decoration: InputDecoration(labelText: 'Linkedin',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)
        ),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'linkdin id is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
    final twitter =Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: twittercon,
        decoration: InputDecoration(labelText: 'Twitter',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)
        ),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'twitter link is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
    final facebook =Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: facebookcon,
        decoration: InputDecoration(labelText: 'Facebook',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)
        ),
        // maxLength: 10,
        validator: (String value) {
          if (value.isEmpty) {
            return 'facebook id is Required';
          }

          return null;
        },
        // onSaved: (String value) {
        //   _name = value;
        // },
      ),
    );
    final aboutname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network('https://img.icons8.com/android/24/000000/pencil.png'),
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
            'ABOUT ME',
            style: TextStyle(
               fontWeight: FontWeight.bold,
              fontSize: 18,
              
            ),
          ),

        ],
      ),
    );
    final aboutme= TextField(
      controller: aboutcon,

      decoration: InputDecoration(
          labelText: "About",

          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)

      ),
      maxLines: 6,


    );Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: facebookcon,
        decoration: InputDecoration(labelText: 'write here',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)
        ),
        // maxLength: 10,
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

    var checkBoxvalue=false;


        return Scaffold(
          appBar: AppBar(title: Text("Edit Info"),
          ),
    
          body:
    
          ListView(
            
            scrollDirection: Axis.vertical,
            children: <Widget>[
              basicname,
              

              name,
              SizedBox(
                height: 20,
              ),
              location,
              SizedBox(
                height : 20,
              ),
              communicationname,
      
              phone,
              whatsapp,
              skype,
              linkedin,
              twitter,
              facebook,
               SizedBox(
                height : 20,
              ),
            
              aboutname,
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
                      
                      
                      
                      // onPressed: (){
    
                      //   // Navigator.push(context,MaterialPageRoute(builder: (context){
                      //   //   return new HomePage();
    
    
                      //   // }));
                      //   // Navigator.of(context).pushNamed(HomePage.tag);
                      // },
                      padding: EdgeInsets.all(20),
                      color:Colors.blue,
                      onPressed: () { 
                        setState(() {
                          _name=namecon.text;
                          _location=locationcon.text;
                          _about=aboutcon.text;
                          _phoneno=phonecon.text;
                          _whatsappno=whatsappnocon.text;
                          _skypeno=skypenocon.text;
                          _linkedin=linkedincon.text;
                          _twitter=twittercon.text;
                          _facebook=facebookcon.text;
                          
                        });
                        
                       },
                      child: Text('Save Changes', style:TextStyle(color:Colors.white,fontSize: 20.0)
                      ),
                      
                    ),
                    
                  ),
                  // Text("your name is $_name and your location is $_location "),


            ],
          ),
          
          // Container(
          //   height: 500,
          //   width: 100,
          //   color: Colors.blue,
          //   child: Text("your name is $_phoneno and your location is $_location  ,$_phoneno,$_about, $_whatsappno,$_skypeno,$_linkedin,$_twitter,$_facebook"),
            

          // ),
          
     









        ],
      ),


    );

  }
}


// class EDITINFO extends StatelessWidget {
//   @override
  // Widget build(BuildContext context) {

  //   // final name= TextFormField(
  //   //   // keyboardType: TextInputType.emailAddress,
  //   //   validator: (value) {
  //   //     if (value.isEmpty) {
  //   //       return 'Please enter your email address';
  //   //     }
  //   //     return null;
  //   //   },
  //   //   autofocus: false,
  //   //   decoration: InputDecoration(
  //   //       hintText: 'Name',
  //   //       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
  //   //   ),
  //   // );
  //   var _name;
  //   var _location;
  //   final namecon= new TextEditingController();
  //   final locationcon= new TextEditingController();
  //   final name =TextFormField(
  //     controller: namecon,
  //     decoration: InputDecoration(labelText: 'Name',
  //         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
  //     ),
  //     // maxLength: 10,
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return 'Name is Required';
  //       }

  //       return null;
  //     },
  //     // onSaved: (String value) {
  //     //   _name = value;
  //     // },
  //   );
  //   final location =TextFormField(
  //     controller: locationcon,
  //     decoration: InputDecoration(labelText: 'Location',
  //         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)
  //     ),
  //     // maxLength: 10,
  //     validator: (String value) {
  //       if (value.isEmpty) {
  //         return 'Location is Required';
  //       }

  //       return null;
  //     },
  //     // onSaved: (String value) {
  //     //   _name = value;
  //     // },
  //   );
  //   final aboutme= TextField(

  //     decoration: InputDecoration(
  //         labelText: "About",

  //         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0)

  //     ),
  //     maxLines: 6,


  //   );

  //   var checkBoxvalue=false;


  //       return Scaffold(
  //         appBar: AppBar(title: Text("Edit Info"),
  //         ),
    
  //         body:
    
  //         ListView(
  //           scrollDirection: Axis.vertical,
  //           children: <Widget>[
  //             Container(
  //               child: Align(
  //                 heightFactor: 4,
  //                 alignment: Alignment(-0.9, 0),
  //                 child: Text("Basic",
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.bold,
    
  //                   ),
    
  //                 ),
  //               ),
  //             ),
  //             name,
  //             SizedBox(
  //               height: 20,
  //             ),
  //             location,
  //             SizedBox(
  //               height : 20,
  //             ),
  //             Container(
  //               child: Align(
  //                 heightFactor: 2,
  //                 alignment: Alignment(-0.9, 0),
  //                 child: Text("COMMUNICATION",
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.bold,
    
  //                   ),
    
  //                 ),
    
    
    
    
  //               ),
  //             ),
  //             Row(
  //                 children: <Widget>[
  //                   Checkbox(value: true,
  //                       onChanged: (bool value){
    
    
  //                       }
  //                   ),
  //                   Text("nnn"),
    
    
    
    
  //                 ]
    
  //             ),
  //             Row(
  //                 children: <Widget>[
  //                   Checkbox(value: true,
  //                       onChanged: (bool value){
    
    
  //                       }
  //                   ),
  //                   Text("nnn"),
    
    
    
    
  //                 ]
    
  //             ),
  //             Row(
  //                 children: <Widget>[
  //                   Checkbox(value: true,
  //                       onChanged: (bool value){
    
    
  //                       }
  //                   ),
  //                   Text("nnn"),
    
    
    
    
  //                 ]
    
  //             ),
  //             Row(
  //                 children: <Widget>[
  //                   Checkbox(value: true,
  //                       onChanged: (bool value){
    
    
  //                       }
  //                   ),
  //                   Text("nnn"),
    
    
    
    
  //                 ]
    
  //             ),
  //             Row(
  //                 children: <Widget>[
  //                   Checkbox(value: true,
  //                       onChanged: (bool value){
    
    
  //                       }
  //                   ),
  //                   Text("nnn"),
    
    
    
    
  //                 ]
    
  //             ),
  //             Row(
  //                 children: <Widget>[
  //                   Checkbox(value: true,
  //                       onChanged: (bool value){
    
    
  //                       }
  //                   ),
  //                   Text("nnn"),
    
    
    
    
  //                 ]
    
  //             ),
  //             Container(
  //               child: Align(
  //                 heightFactor: 2,
  //                 alignment: Alignment(-0.9, 0),
  //                 child: Text("About Me",
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     fontWeight: FontWeight.bold,
    
  //                   ),
    
  //                 ),
    
    
    
    
  //               ),
  //             ),
  //             aboutme,
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               children: <Widget>[
  //                 Padding(
  //                   padding: EdgeInsets.symmetric(vertical:20.0),
  //                   child:RaisedButton(
    
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(24.0),
    
    
  //                     ),
  //                     onPressed: (){
  //                       Navigator.push(context,MaterialPageRoute(builder: (context){
  //                         return new HomePage();
    
    
  //                       }));
  //                       // Navigator.of(context).pushNamed(HomePage.tag);
  //                     },
  //                     padding: EdgeInsets.all(20),
    
  //                     color:Colors.blue,
  //                     child: Text('      Cancel        ', style:TextStyle(color:Colors.white,fontSize: 20.0)
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: 10,
  //                 ),
  //                 Padding(
  //                   padding: EdgeInsets.symmetric(vertical:20.0),
  //                   child:RaisedButton(
    
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(24.0),
    
  //                     ),
                      
                      
  //                     // onPressed: (){
    
  //                     //   // Navigator.push(context,MaterialPageRoute(builder: (context){
  //                     //   //   return new HomePage();
    
    
  //                     //   // }));
  //                     //   // Navigator.of(context).pushNamed(HomePage.tag);
  //                     // },
  //                     padding: EdgeInsets.all(20),
  //                     color:Colors.blue,
  //                     onPressed: () { 
                        
  //                      },
  //                     child: Text('Save Changes', style:TextStyle(color:Colors.white,fontSize: 20.0)
  //                     ),
                      
  //                   ),
                    
  //                 ),
  //                 Text("your name is $_name and your location is $_location "),


  //           ],
  //         )










  //       ],
  //     ),


  //   );

  // }
// }