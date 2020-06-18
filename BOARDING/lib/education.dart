import 'package:BOARDING/education_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Education extends StatefulWidget {
  final List list_education;
  const Education(this.list_education);
  @override
  _EducationState createState() => _EducationState();
}
  Container big_education_element(String image_name,String name,String value){
  return  Container(
     
     height: 150.0,
     width: 350.0,
     
      
                        child: Padding(padding: EdgeInsets.all(10.0),
                         child:Card(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10.0),
                           ),
                            color: Colors.blue,
                           elevation: 10.0,
                           child: Column(
                             
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: <Widget>[
                                SvgPicture.asset(
                                  'assets/svg_images/$image_name.svg',
                                  color: Colors.white,
                                  height: 30.0,
                    width: 30.0,
                                    
                                ),
                               
                                Text(
                                   name,
                                   style: TextStyle(fontSize:18.0,color:Colors.white),
                                   


                                ),
                                Text(
                                   value,
                                   style: TextStyle(fontSize:17.0,color: Colors.white),



                                ),

                             ],
                           ),

                         ),
                        )
                      );
}

Card education_element(String image_name,String heading,String value){
  return Card(
    shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10.0),
                           ),
      color: Colors.blue,
         elevation: 10.0,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           
           children: <Widget>[
             SvgPicture.asset(
               'assets/svg_images/$image_name.svg',
               color: Colors.white,
               height: 30.0,
                    width: 30.0,

             ),
             Text(heading, style: TextStyle(fontSize: 18.0,color:Colors.white)),
             Text(value, style: TextStyle(fontSize: 17.0,color:Colors.white),)
             
           ],
         ),
  );
}
Row deg_cgpa_year( String degree, String cgpa,String year){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,


      children: <Widget>[
        Container(
            height: 124,
            width: 124,
           
            padding: EdgeInsets.all(10.0),
           child:education_element("graduate","Degree" ,degree),
               
          ),
          
        
        Container(
           height: 124,
            width: 124,
          
          
            padding: EdgeInsets.all(10.0),
           child:education_element("gpa","CGPA", cgpa),
         
          ),
          
     
        Container(
         height: 124,
            width: 124,
          
            padding: EdgeInsets.all(10.0),
           
           child:education_element("calendar","Year", year),
          
          ),
          
        
        

    ]);
}
Padding education_card(String degree,String institute,String year,String specialization,String gpa,String status){
  return Padding(padding: EdgeInsets.all(15.0),child: Card(
    shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(10.0),
                           ),
              
                
                  elevation: 10.0,
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    
                    children: <Widget>[
                      big_education_element("school", "College",institute),
                      deg_cgpa_year(degree,gpa,year),
                      big_education_element("certificate","Specialization", specialization)


                      
                    ], 
                  ),
                ),
              );
}

class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueAccent[50],
          appBar: AppBar(
            title: Text("Education Details",
                style: TextStyle(
                  fontSize: 20.0
                ),
             
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              RaisedButton(
                color: Colors.blue,
                shape: CircleBorder(),
                child: Icon(
                  Icons.add,
                  color:Colors.white,
                ),
                onPressed: (){
                  Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context)=>EDUCATION())
                  );

                },
              )
            ],

          

          ),
          body: ListView(
          

            scrollDirection: Axis.vertical,
            children: <Widget>[
            
                
                 for (Map<String, dynamic> item in widget.list_education)
                    education_card(item['degree'], item['institute'], item['year'], item['specialization'], item['gpa'], item['status'])
                
             
              
                  
             

              
            ],
          ),
        ),
    );
  }
}