import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class EDUCATION extends StatefulWidget {
  @override
  _EDUCATIONState createState() => _EDUCATIONState();
}

class _EDUCATIONState extends State<EDUCATION> {
  final formKey = new GlobalKey<FormState>();
  var _name1;
  var _institutename1;
  var _year1;
  var _specs1;
  var _gpa1;
   String _myActivityResult; //accessing dropdown value project status
  /////accesing vaiables new/.....
  final iname1= new TextEditingController();
  final iinstitutename1= new TextEditingController();
  final iyear1= new TextEditingController();
   final ispecs1= new TextEditingController();
  final igpa1= new TextEditingController();
    String _myActivity;
      void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
    // final formKey = new GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
         final hname = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network("https://img.icons8.com/windows/32/000000/flying-motarboard.png"),
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
            'Degree',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
     final hinstitutename = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network("https://img.icons8.com/windows/32/000000/student-center.png"),
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
            'Institute',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  final hyear = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network("https://img.icons8.com/metro/26/000000/minus-1year.png"),
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
            'Year ',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
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
            'Status',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
     final hspecs = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network("https://img.icons8.com/windows/32/000000/graduation-scroll.png"),
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
            'Specialization ',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
     final hgpa = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network("https://img.icons8.com/metro/26/000000/percentage.png"),
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
            'GPA/ %',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
    final iname = Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
          child: TextFormField(
            controller: iname1,
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
        final iinstitutename = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: iinstitutename1,
        decoration: InputDecoration(labelText: 'Name ',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)
        ),
        // maxLines: 5,
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
      final iyear = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: iyear1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'year-(yyyy)',
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
     final ispecs = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: ispecs1,
        // keyboardType: TextInputType.number,
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
     final igpa = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: igpa1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText: 'in percentage',
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

    return Scaffold(
       appBar: AppBar(
        title: Text("Education Details"),
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
            // Navigator.push(context,MaterialPageRoute(builder: (context){
                  //   return new EDITINFO();

                  // }));
        }),
      ),
        body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          hname,
          iname,
          hinstitutename,
          iinstitutename,
          hyear,
          iyear,
          dropdownname,
            Container(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: Colors.white,

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
                          "display": "Full Time",
                          "value": "Full Time",
                        },
                        {
                          "display": "Part Time",
                          "value": "Part Time",
                        },

                      ],
                      textField: 'display',
                      valueField: 'value',
                    ),
                  ),

                ],
              ),
            ),
          ),
          hspecs,
          ispecs,
          hgpa,
          igpa,

          SizedBox(
            height:50 ,
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  onPressed: () {
                    // Navigator.push(context,MaterialPageRoute(builder: (context){
                    //   return new EDITINFO();

                    // }));
                    // Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  padding: EdgeInsets.all(15),
                  color: Colors.blue,
                  child:Row(children: <Widget>[Icon(Icons.cancel, color:Colors.white),Text('Cancel',
                      style: TextStyle(color: Colors.white, fontSize:15.0))],),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
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


                          _name1=iname1.text;
                          _institutename1=iinstitutename1.text;
                          _year1=iyear1.text;
                          _specs1=ispecs1.text;
                          _gpa1=igpa1.text;
                          
                          
                          


                    });



                  },



                  padding: EdgeInsets.all(15),
                  color: Colors.blue,
                  child:Row(children: <Widget>[Icon(Icons.save,color:Colors.white), Text('Save',
                      style: TextStyle(color: Colors.white, fontSize: 15.0))],),
                ),
              ),
            ],
          ),



          // Container(
          //       padding: EdgeInsets.all(16),
          //       child: Text('$_name1,$_institutename1,$_year1,$_myActivity,$_specs1,$_gpa1'),

          //     ),


        ],
        ),
    );
  }
}




//           // Container(
//           //       padding: EdgeInsets.all(16),
//           //       child: Text('$_jkval,   $_myActivity,    $_projectinfo,    $_assignedto,      $_description'),

//           //     ),

//           // Container(
//           //   padding: EdgeInsets.all(16),
//           //   child: Text(_myActivity),

//           // )
//         ],
//       ),
//     );
//   }
// } 