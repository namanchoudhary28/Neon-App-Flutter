import 'package:flutter/material.dart';
import 'package:add/add_badge.dart';


class EXISTINGPRO extends StatefulWidget {
  @override
  _EXISTINGPROState createState() => _EXISTINGPROState();
}

class _EXISTINGPROState extends State<EXISTINGPRO> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
        title: Text("Existing Projects"),
      ),
      body:       ListView(

        scrollDirection: Axis.vertical,
        children: <Widget>[
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child:RaisedButton(
                  

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90.0),


                  ),
                  onPressed: (){
                    // Navigator.push(context,MaterialPageRoute(builder: (context){
                    //   return new loading();


                    // }));
                    // Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                  color:Colors.blue,
                  child: Text('Name of Project  1 ', style:TextStyle(color:Colors.white,fontSize: 20.0)
                  ),
                ),
              ),
              // SizedBox(
              //   width: 2,
              // ),
              InkWell(
                          child: Image.network('https://img.icons8.com/material-sharp/40/000000/add.png'),
                          onTap: (){
                            //      Navigator.push(context,MaterialPageRoute(builder: (context){

                            // return new MyApp();


                            // }));


                          },
                        ),

                        
              // Text("your name is $_name and your location is $_location "),


            ],
          ),
                     Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 1, 20),
                child:RaisedButton(
                  

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90.0),


                  ),
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return new MyApp9();


                    }));
                    // Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                  color:Colors.blue,
                  child: Text('Name of Project  2 ', style:TextStyle(color:Colors.white,fontSize: 20.0)
                  ),
                ),
              ),
              // SizedBox(
              //   width: 2,
              // ),
              InkWell(
                          child: Image.network('https://img.icons8.com/material-sharp/40/000000/add.png'),
                          onTap: (){
                            //      Navigator.push(context,MaterialPageRoute(builder: (context){

                            // return new MyApp();


                            // }));


                          },
                        ),

                        
              // Text("your name is $_name and your location is $_location "),


            ],
          ),
                     Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child:RaisedButton(
                  

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90.0),


                  ),
                  onPressed: (){
                    // Navigator.push(context,MaterialPageRoute(builder: (context){
                    //   return new loading();


                    // }));
                    // Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                  color:Colors.blue,
                  child: Text('Name of Project  3 ', style:TextStyle(color:Colors.white,fontSize: 20.0)
                  ),
                ),
              ),
              // SizedBox(
              //   width: 2,
              // ),
              InkWell(
                          child: Image.network('https://img.icons8.com/material-sharp/40/000000/add.png'),
                          onTap: (){
                            //      Navigator.push(context,MaterialPageRoute(builder: (context){

                            // return new MyApp();


                            // }));


                          },
                        ),

                        
              // Text("your name is $_name and your location is $_location "),


            ],
          ),
                     Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child:RaisedButton(
                  

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90.0),


                  ),
                  onPressed: (){
                    // Navigator.push(context,MaterialPageRoute(builder: (context){
                    //   return new loading();


                    // }));
                    // Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                  color:Colors.blue,
                  child: Text('Name of Project  4 ', style:TextStyle(color:Colors.white,fontSize: 20.0)
                  ),
                ),
              ),
              // SizedBox(
              //   width: 2,
              // ),
              InkWell(
                          child: Image.network('https://img.icons8.com/material-sharp/40/000000/add.png'),
                          onTap: (){
                            //      Navigator.push(context,MaterialPageRoute(builder: (context){

                            // return new MyApp();


                            // }));


                          },
                        ),

                        
              // Text("your name is $_name and your location is $_location "),


            ],
          ),
                     Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child:RaisedButton(
                  

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90.0),


                  ),
                  onPressed: (){
                    // Navigator.push(context,MaterialPageRoute(builder: (context){
                    //   return new loading();


                    // }));
                    // Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                  color:Colors.blue,
                  child: Text('Name of Project  5 ', style:TextStyle(color:Colors.white,fontSize: 20.0)
                  ),
                ),
              ),
              // SizedBox(
              //   width: 2,
              // ),
              InkWell(
                          child: Image.network('https://img.icons8.com/material-sharp/40/000000/add.png'),
                          onTap: (){
                            //      Navigator.push(context,MaterialPageRoute(builder: (context){

                            // return new MyApp();


                            // }));


                          },
                        ),

                        
              // Text("your name is $_name and your location is $_location "),


            ],
          ),
        ],
      )
    );
  }
}