import 'package:BOARDING/main_loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:BOARDING/profile_page.dart';

class SuccessPopup extends StatefulWidget {

  final String item;
  const SuccessPopup(this.item);
  @override
  _SuccessPopupState createState() => _SuccessPopupState();
}

class _SuccessPopupState extends State<SuccessPopup> {
  String item;
  @override
  void initState(){
    item= widget.item;
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      
    
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),

          )
      ),
      content: Container(
        height: 250.0,
        
         
        child:Container(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,


            
            children: <Widget>[
              Container(width:double.infinity),
              Center(child: Text("$item is deleted successfully",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'sans-serif',
                      fontSize: 20.0,
                    

                    ),

              ) ),
              
              SizedBox(
                height: 30.0,
              ),
              Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                 Container(
                  width: double.infinity,
                 ),
                 Image(
                       image: AssetImage('assets/icons/tick.png'),
                       
                     ),
                     Container(
                       width: 200.0,
                       child: RaisedButton(
                   onPressed: (){
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => LoadData()),
                     );


                   },
                   color:Colors.blue,
                   padding: EdgeInsets.all(10.0),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(10.0),

                   ),


                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: <Widget>[
                       Text("Go back",style:TextStyle(fontSize:20.0,color:Colors.white)),
                       Icon(
                         Icons.arrow_forward,
                         color:Colors.white,
                       )
                     ],
                   ),

                 ),
                     )
                 


              
                 

               ],
              ),
              
            ],
        )
        ),
      ),
    );
  }
}