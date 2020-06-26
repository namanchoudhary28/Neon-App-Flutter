import 'package:BOARDING/certification_adder.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class CERTIFICATE extends StatefulWidget {
  @override
  _CERTIFICATEState createState() => _CERTIFICATEState();
}

class _CERTIFICATEState extends State<CERTIFICATE> {
  final formKey = new GlobalKey<FormState>();
  var _ititle1;
  var _iorganisation1;
  var _year1;
  var _ilink1;
  String _myActivityResult;
  /////accesing vaiables new/.....
  final ititle1 = new TextEditingController();
  final iyear1 = new TextEditingController();
  final iorganisation1 = new TextEditingController();
  final ilink1 = new TextEditingController();
  String _myActivity;
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  @override
  Widget build(BuildContext context) {
    final hyear = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network(
                "https://img.icons8.com/metro/26/000000/minus-1year.png"),
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
            'Item Type',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
    final htitile = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network(
                'https://img.icons8.com/windows/32/000000/title.png'),
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
            'Title ',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
    final horganisation = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network(
                "https://img.icons8.com/windows/32/000000/organization.png"),
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
            'Organisation',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
    final hlink = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network(
                'https://img.icons8.com/android/24/000000/link.png'),
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
            'Link of Certificate ',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
    final ititle = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: ititle1,
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
    final iorganisation = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: iorganisation1,
        decoration: InputDecoration(
            labelText: 'Platform/organisation',
            contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0)),
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
    final ilink = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: ilink1,
        decoration: InputDecoration(
            labelText: 'Link to the Certification',
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
    final iyear = Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(
        controller: iyear1,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'year-(yyyy)',
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Licences & Certifications Details"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigator.push(context,MaterialPageRoute(builder: (context){
              //   return new EDITINFO();

              // }));
            }),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          htitile,
          ititle,
          horganisation,
          iorganisation,
          hlink,
          ilink,
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
                      titleText: 'Certificate type',
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
                          "display": "Professional",
                          "value": "Professional",
                        },
                        {
                          "display": "Other",
                          "value": "Other",
                        }
                      ],
                      textField: 'display',
                      valueField: 'value',
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0),
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
                    child: Row(children: <Widget>[
                      Icon(Icons.cancel, color: Colors.white),
                      Text('Cancel',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
                    ])),
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
                      _ititle1 = ititle1.text;
                      _iorganisation1 = iorganisation1.text;
                      _ilink1 = ilink1.text;
                      _year1 = iyear1.text;
                      _myActivityResult = _myActivity;

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CertificationLoadingScreen(
                                  _ititle1,
                                  _iorganisation1,
                                  _myActivityResult,
                                  _year1,
                                  _ilink1)));
                    });
                  },

                  padding: EdgeInsets.all(15),
                  color: Colors.blue,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.save, color: Colors.white),
                      Text('Save',
                          style: TextStyle(color: Colors.white, fontSize: 15.0))
                    ],
                  ),
                ),
              ),
            ],
          ),
          //   Container(
          //   padding: EdgeInsets.all(16),
          //   child: Text('$_ititle1,   $_ilink1,    $_myActivityResult,$_year1,   $_iorganisation1, ',),

          // ),
        ],
      ),
    );
  }
}
