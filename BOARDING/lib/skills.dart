import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

Row card_panel(BuildContext context){
  return Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                          IconButton(
                         iconSize: 20.0,
                         tooltip: "See your competancy",
                          onPressed: (){
                            showDialog(
                              context: context,
                              builder: (_) =>AlertDialog(
                                actions: <Widget>[
                                
                                  IconButton(
                                    
                                    icon: Icon(
                                      Icons.close
                                    ),
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    

                                  ),
                                 
                                  
                                ],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                  title: Text("Beginner"),
                                  elevation: 24.0,
                                  content: Padding(
              padding: EdgeInsets.all(15.0),
              child: new LinearPercentIndicator(
                width: 200.0,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: 0.8,
                center: Text("80.0%",style: TextStyle(color:Colors.white),),
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.blue,
              ),
            )
                              )
                            );

                          },
                         icon: Icon(
                           Icons.short_text,
                           color: Colors.white,
                           

                         ),
                       ),
                       Tooltip(message: "check it to delete this skill",child: Checkbox(
                         value: true,
                         tristate: true,
                         activeColor: Colors.white,
                         checkColor: Colors.blueAccent[200],
                         onChanged: (value) {
                           
                           

                           
                          
                           
                         },
                      

                       ),),
                       
                       IconButton(
                         icon: Icon(
                           Icons.edit,
                           color: Colors.white,
                         ),
                         onPressed: (){
                        

                         },
                       )

                        ],);


                     
}

Container skills_card(BuildContext context){
  return Container(
                 width:160.0,
                 child: Card(
                   elevation: 6.0,
                   color: Colors.lightBlue[400],
                   
                  child: InkWell(
                    
                    child: Column(
                      children: <Widget>[
                        card_panel(context),
                        Image(
                           image: NetworkImage('https://img.icons8.com/color/48/000000/python.png'),
                        ),
                        Text(
                          "Python",
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white
                          ),

                        )
                        
                        
                      
                       
                       
                      ],
                    ),
                  ),
                ), 
                );
}
Container list_cards(BuildContext context){
  return Container(
               margin: EdgeInsets.all(10.0),
              
               child: Row(
                 
            
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                
                skills_card(context),
                skills_card(context)
                  
                  
              
                
                
               
              ],
            )
             );
}


Row button_rows(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      
      RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        color: Colors.blue,
        padding: EdgeInsets.all(15.0),
        onPressed: (){

        },
        child: Row(children: <Widget>[
          Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text("Cancel",style: TextStyle(color:Colors.white),)
        ],),
      ),
      RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
        ),
        padding: EdgeInsets.all(15.0),
        color:Colors.blue,
        onPressed: (){

        },
        child: Row(children: <Widget>[
          Icon(
            Icons.save,
            color: Colors.white,
          ),
           SizedBox(
            width: 10.0,
          ),
          Text("Save",style: TextStyle(color:Colors.white),)
        ],),
      ),

    ],
  );
}

class SkillsDisplay extends StatefulWidget {
  @override
  _SkillsDisplayState createState() => _SkillsDisplayState();
}

class _SkillsDisplayState extends State<SkillsDisplay> {
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child: Scaffold(
         appBar: AppBar(
           title: Text("Skills",style: TextStyle(
             fontSize: 20.0,
           ),),
         ),
         body:
           
             GridView.count(
           crossAxisCount: 1,
           mainAxisSpacing: 0,
           childAspectRatio: 2.5,
           children: <Widget>[
             list_cards(context),
             list_cards(context),
             list_cards(context),
             list_cards(context),
             list_cards(context),
             list_cards(context),
             list_cards(context),
             list_cards(context),
             button_rows(),


            
            
            


           ],
         ),


          
        
                ),
    );
  }
}