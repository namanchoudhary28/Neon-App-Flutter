// import 'package:add/add_badge.dart';
import 'package:flutter/material.dart';
// import 'package:add/login_page.dart';



void main() => runApp(MyApp9());

class MyApp9 extends StatelessWidget {
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
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _name;      //accesing title
  var image;      //accesing image folder location
  var _description; //description
  final titlecon= new TextEditingController();
  final descriptioncon= new TextEditingController();
  String _selected;
  String _selected2;
  // var image;      //accesing image folder location
  var name;       //accessing name of hobby


  List<Map> _myJson = [
    {"id": '1', "image": "assets/banks/Dancing.png", "name": "Dancing"},
    {"id": '2', "image": "assets/banks/Singing.png", "name": "Singing"},
    {"id": '3', "image": "assets/banks/Cycling.png", "name": "Cycling"},
    {"id": '4', "image": "assets/banks/Drawing.png", "name": "Drawing"},
    {
      "id": '5',
      "image": "assets/banks/Cooking.png",
      "name": "Cooking"
    },
    {"id": '6', "image": "assets/banks/Surfing.png", "name": "Surfing"},
    {
      "id": '7',
      "image": "assets/banks/Writing.png",
      "name": "Writing"
    },
    {"id": '8', "image": "assets/banks/Reading.png", "name": "Reading"},
    {"id": '9', "image": "assets/banks/Archery.png", "name": "Archery"},
    {
      "id": '10',
      "image": "assets/banks/Camping.png",
      "name": "Camping"
    },
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
     final titleheading = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network('https://img.icons8.com/carbon-copy/40/000000/tag-window.png'),
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
    final titlename =Padding(
      padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 10.0),
      child: TextFormField(

        controller: titlecon,
        decoration: InputDecoration(labelText: 'title',
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

              // return new BADGE();

              // }));
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Select ',
            style: TextStyle(
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
            child: Image.network(
                'https://img.icons8.com/wired/30/000000/pencil.png'),
            onTap: () {
              //      Navigator.push(context,MaterialPageRoute(builder: (context){

              // return new BADGE();

              // }));
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Description ',
            style: TextStyle(
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
      appBar: AppBar(
        title: Text('Add Badge'),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          titleheading,
           SizedBox(
            height: 20,
          ),
          titlename,
          SizedBox(
            height: 10,
          ),
          hobbytag,
          SizedBox(
          height:20,
        ),
         Container(
          padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
          decoration: BoxDecoration(
              border: Border.all(width: 10, color: Colors.blue[200]),
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
        SizedBox(
          height:20,
        ),
        descriptionheading,
        SizedBox(
          height:20,
        ),
        descriptioninfo,
        SizedBox(height:20),
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
                      _name=titlecon.text;
                      _description=descriptioncon.text;
                      // _jkval = _jk;
                      // _projectinfo = projectinfocon.text;
                      // _assignedto = assignedtocon.text;
                      // _description = descriptioncon.text;
                    });
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
          //   color: Colors.blue,
          //   height: 100,
          //       padding: EdgeInsets.all(16),
          //       child: Text('$_description,   $_name'),

          //     ),
        ],
      ),
    );
  }
}
