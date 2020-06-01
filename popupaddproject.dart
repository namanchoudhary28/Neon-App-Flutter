                  onPressed: (){
                    showModalBottomSheet(context: context,
                     builder: (BuildContext context){
                       return   Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical:20.0),
                child:RaisedButton(
                  

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90.0),


                  ),
                  onPressed: (){
                    
                    Navigator.push(context,MaterialPageRoute(builder: (context){
                      return new EXISTINGPRO();


                    }));
                    // Navigator.push(context,MaterialPageRoute(builder: (context){
                    //   return new loading();


                    // }));
                    // Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),

                  color:Colors.blue,
                  child: Text('Add to an existing project', style:TextStyle(color:Colors.white,fontSize: 20.0)
                  ),
                ),
              ),
              // SizedBox(
              //   height: 2,
              // ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child:RaisedButton(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(90.0),

                  ),



                  onPressed: (){

                    // Navigator.push(context,MaterialPageRoute(builder: (context){
                    //   return new EXISTINGPRO();


                    // }));
                    // Navigator.of(context).pushNamed(HomePage.tag);
                  },
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  color:Colors.blue,
                  // onPressed: () {
                    // setState(() {
                    //   name=titlecon.text;
                    
                    //   phoneno=phonecon.text;
                 

                    // });
                    // print('something 1');
                    // List<String>commu = [_phoneno,_whatsappno,_skypeno,_linkedin,_twitter,_facebook];
                    // submitNew(_name, _location,_about,commu);
                    // print('something2');
                    // Navigator.push(context,MaterialPageRoute(builder: (context){
                    // return HomePage();


                    // }));

                  // },
                  child: Text('   Create a new project   ', style:TextStyle(color:Colors.white,fontSize: 20.0)
                  ),

                ),

              ),
              // Text("your name is $_name and your location is $_location "),


            ],
          );

                    },
                    );
                  //   Navigator.push(context,MaterialPageRoute(builder: (context){
                  //     return new loading();


                  //   }));
                  //   // Navigator.of(context).pushNamed(HomePage.tag);
                  },