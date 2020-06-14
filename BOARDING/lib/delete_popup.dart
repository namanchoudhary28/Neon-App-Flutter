import 'package:flutter/material.dart';
import 'package:BOARDING/loading.dart';

class deletepopup extends StatefulWidget {
  final String item;
  final List<String>params;
  const deletepopup(this.item,this.params);
  @override
  _deletepopupState createState() => _deletepopupState();
}

class _deletepopupState extends State<deletepopup> {
  String item;
   
 @override
 void initState(){
   item =  widget.item;
 }
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      
    
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
        bottomRight: Radius.circular(30.0),
        bottomLeft: Radius.circular(30.0),
      )),
      content: Container(
        height: MediaQuery
            .of(context)
            .size
            .height - 350,
        width: 200,


        child: Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,


              children: <Widget>[
                Container(width: double.infinity),

                Container(
                  height: 120,
                  child: Center(
                      child: Text("Are u sure u want to delete this $item ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'sans-serif',
                          fontSize: 20.0,


                        ),

                      )),
                ),

                SizedBox(
                  height: 30.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Ink(
                      decoration: ShapeDecoration(
                        color: Colors.green[700],
                       shape: CircleBorder(),
                   ),
                   child: IconButton(
                     icon: Image(
                       image: AssetImage('assets/icons/tick.png'),
                       height: 35.0,
                       width: 35.0,
                     ),
                     onPressed: (){

                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context)=>LoadingScreen(widget.item,widget.params)
                     ),
                     );
                     },
                   ),
                 ),
                 Ink(
                   decoration: ShapeDecoration(
                       color:Colors.red[700],
                       shape: CircleBorder(),
                   ),
                   child: IconButton(
                     icon: Image(
                       image: AssetImage('assets/icons/cross.png'),
                       height: 35.0,
                       width: 35.0,
                     ),
                     onPressed: (){
                       Navigator.pop(context);
                         
                     },
                   ),
                 ),
                 

               ],
              ),
              
            ],
        )
        ),
      ),
    );
  }
}