import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';
import 'package:provider/provider.dart';
import 'package:BOARDING/signup.dart';
import 'package:BOARDING/login_page.dart';
import 'package:BOARDING/dropdown.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:grouped_buttons/grouped_buttons.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final projectname = Padding(
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
            'Project Info',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        
        ],
      ),
    );
        final projectinfo = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
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
 final assignedname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
            InkWell(
            child: Image.network('https://img.icons8.com/windows/30/000000/add-user-group-man-man.png'),
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
            'Assigned To',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        
        ],
      ),
    );
        final assignedinfo = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
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
 final descriptionname = Padding(
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
            'Description',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        
        ],
      ),
    );
        final descriptioninfo = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
      decoration: InputDecoration(labelText: 'write here',
          contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)
      ),
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
    print('yo');
    final dropdownname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
            InkWell(
            child: Image.network('https://img.icons8.com/ios-glyphs/32/000000/tags.png'),
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
            'Project Status',
            style: TextStyle(
              fontSize: 20,
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
            child: Image.network('https://img.icons8.com/ios-glyphs/30/000000/inspection.png'),
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
            'Checklist',
            style: TextStyle(
              fontSize: 20,
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
            child: Image.network('https://img.icons8.com/ios-glyphs/30/000000/upload.png'),
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
            'Upload',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Add Project"),
      ),

      body:

      ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          projectname,
          projectinfo,
          assignedname,
          assignedinfo,
          dropdownname,
          Container(
            height: 225,
            child: MyHomePage(),
          ),
         

        // Container(
        //   padding: const EdgeInsets.only(left: 14.0, top: 14.0),
        //   child: Text("Basic RadioButtonGroup",
        //     style: TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 20.0
        //     ),
        //   ),
        // ),

        RadioButtonGroup(
          labels: [
            "External",
            "Internal",
          ],
          labelStyle: TextStyle( fontSize: 20),
          disabled: [
     

          ],
          onChange: (String label, int index) => print("label: $label index: $index"),
          onSelected: (String label) => print(label),
        ),
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
                padding: EdgeInsets.symmetric(vertical:20.0),
                child:RaisedButton(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),


                  ),
                  onPressed: (){
                    // Navigator.push(context,MaterialPageRoute(builder: (context){
                    //   return new EDITINFO();


                    // }));
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
                    // Navigator.push(context,MaterialPageRoute(builder: (context){
                    //   return new EDITINFO();


                    // }));
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