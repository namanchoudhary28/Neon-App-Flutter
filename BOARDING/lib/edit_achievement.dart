import 'package:flutter/material.dart';
import 'package:BOARDING/date_time_picker_widget2.dart';
import 'package:BOARDING/profile_page.dart';
import 'package:BOARDING/nouse.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
// import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';


// import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

// import 'package:date_field/date_field.dart';

// import 'package:date_picker_number/date_picker_number.dart';
// import 'package:date_picker_number/date_picker_number_settings.dart';





class EDIT_ACHIEVEMENT extends StatefulWidget {
  @override
  _EDIT_ACHIEVEMENTState createState() => _EDIT_ACHIEVEMENTState();
}

class _EDIT_ACHIEVEMENTState extends State<EDIT_ACHIEVEMENT> {
    DateTime _selectedDateTime = DateTime.now();

  

  @override
  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
  }
 

  var _title;       //accessing title
 
  var _description;     //accessing description
 

  final titlecon= new TextEditingController();
  

  final descriptioncon= new TextEditingController();
  @override
  Widget build(BuildContext context) {
    //////........................DATE.........................//////////
    ///
    ///
    var _dates;
    final String formattedDate = DateFormat.yMd().format(_selectedDateTime);        //accesing date
    final selectedText = Text('You selected: $formattedDate');

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
       appBar: AppBar(title: Text("Add Achievment"),
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
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                                                _dates=selectedText;
                                                _title=titlecon.text;
                                                _description=descriptioncon.text;
                                                // _dat=datecon.text;
                                              //   this.selectedDate = selectedDate;
                                              //   this.selectedDate = DateTime(
                                              //   selectedDate.year,
                                              //   selectedDate.month,
                                              //   selectedDate.day,
                                              //   // selectedTime.hour,
                                              //   // selectedTime.minute,
                                              // );
                                                // _about=aboutcon.text;
                                                // _phoneno=phonecon.text;
                                                // _whatsappno=whatsappnocon.text;
                                                // _skypeno=skypenocon.text;
                                                // _linkedin=linkedincon.text;
                                                // _twitter=twittercon.text;
                                                // _facebook=facebookcon.text;
                                                
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
                                //   height: 40,
                                //   color: Colors.blue,
                                //   child: Text("$formattedDate,$_title,$_description")
                                  
                      
                                  
                                // ),
                                // Container(
                                //   height: 50,
                                //   color: Colors.blue,
                                //   child:Text("$_dat"),
                                  
                      
                                  
                                // ),
                      
                      
                      
                      
                      
                      
                                  ],
                      
                      
                                ),
                          );
                            
                        
                        }
                        // _pickDate() async{
                      
                        //   DateTime date = await showDatePicker(context: context, 
                        //   firstDate: DateTime(DateTime.now().year+5), 
                        //   lastDate: DateTime(DateTime.now().year-5),
                        //   initialDate: pickedDate, 
                      
                        //   );
                        //   if (date !=null)
                        //   setState(() {
                        //     pickedDate=date;
                        //   });
                      
                        // }
                      
                        //  _pickDate() async{
                      
                        //   DateTime date = await showDatePicker(context: context, 
                        //   firstDate: DateTime(DateTime.now().year+5), 
                        //   lastDate: DateTime(DateTime.now().year-5),
                        //   initialDate: pickedDate, 
                      
                        //   );
                        //   if (date !=null)
                        //   setState(() {
                        //     pickedDate=date;
                        //   });
                      
                        // }
}


