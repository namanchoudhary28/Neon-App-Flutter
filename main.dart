import 'package:flutter/material.dart';
// import 'package:BOARDING/add_badge.dart';

// import 'package:add/add_badge.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Add Skill'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var name;         //accesing skill name
  var phoneno;      //accessing skill percentage
  final titlecon= new TextEditingController();
  final phonecon= new TextEditingController();
  

 

  @override
  Widget build(BuildContext context) {
    final titleheading = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network('https://img.icons8.com/ios-filled/40/000000/development-skill.png'),
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
            'SKILL',
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
        decoration: InputDecoration(labelText: 'skill name',
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
        final proficiency = Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.le,
        children: <Widget>[
          InkWell(
            child: Image.network('https://img.icons8.com/ios-filled/32/000000/percentage.png'),
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
            'Proficiency',
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
        decoration: InputDecoration(labelText: 'in percentage %',
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

    return Scaffold(
      appBar: AppBar(
    
        title: Text(widget.title),
      ),
      body:       ListView(

        scrollDirection: Axis.vertical,
        children: <Widget>[
          titleheading,


          // titlename,
          SizedBox(
            height: 20,
          ),
          titlename,
          SizedBox(
            height : 20,
          ),
          proficiency,

          phone,
          // whatsapp,
          // skype,
          // linkedin,
          // twitter,
          // facebook,
          // SizedBox(
          //   height : 20,
          // ),

          // aboutname,
          // aboutme,
          SizedBox(
            height : 200,
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
                    //   return new MyApp9();


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
                      name=titlecon.text;
                    
                      phoneno=phonecon.text;
                 

                    });
                    // print('something 1');
                    // List<String>commu = [_phoneno,_whatsappno,_skypeno,_linkedin,_twitter,_facebook];
                    // submitNew(_name, _location,_about,commu);
                    // print('something2');
                    // Navigator.push(context,MaterialPageRoute(builder: (context){
                    // return HomePage();


                    // }));

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
