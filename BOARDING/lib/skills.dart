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
                           Icons.short_text

                         ),
                       ),
                       Checkbox(
                         value: true,
                         tristate: true,
                         activeColor: Colors.blue,
                         checkColor: Colors.white,
                         onChanged: (value) {
                           
                           

                           
                          
                           
                         },
                      

                       ),
                       IconButton(
                         icon: Icon(
                           Icons.edit
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
                  child: InkWell(
                    
                    child: Column(
                      children: <Widget>[
                        card_panel(context),
                        
                        
                      
                        Center(
                          child: Text(
                            "Python",
                            textAlign: TextAlign.center,
                            style:TextStyle(
                              fontSize: 20.0,
                            ),
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
               margin: EdgeInsets.all(20.0),
              
               child: ListView(
                 
            
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                
                skills_card(context),
                skills_card(context)
                  
                  
              
                
                
               
              ],
            )
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
         body:GridView.count(
           crossAxisCount: 1,
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
            
            
            


           ],
         )
       ),
    );
  }
}