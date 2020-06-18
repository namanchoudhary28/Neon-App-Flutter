import 'package:flutter/material.dart';
import 'package:BOARDING/blog_form.dart';
class Blog extends StatefulWidget {
  final List list_blogs;
  const Blog(this.list_blogs);


  @override
  _BlogState createState() => _BlogState();
}
Padding blog(String title,String description, String blog_site){
  return Padding(
              padding: const EdgeInsets.all(12.0),
              
   
              
                child: Stack(
                children: <Widget>[
                  
                  Container(
                    
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(colors: [
                        Colors.blue[500],
                        Colors.blue[200]
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: CustomPaint(
                      size: Size(100, 150),
                      
                    ),
                  ),
                                    Positioned.fill(
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child:  InkWell(
                            
                      child:  Image.asset(
                            'assets/blog_sites/$blog_site.png',
                            height: 94,
                            width: 94,
                      ),
                      onTap: () {
                       
                      }),
                          // child: Image.asset(
                          //   'assets/icon.png',
                          //   height: 64,
                          //   width: 64,
                          // ),
                          flex: 2,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                  title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    // fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w700),
                              ),
                            SizedBox(height: 10),
                              Text(
                                 description,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  
                                  // fontFamily: 'Avenir',
                                ),
                                
                              ),
                                  SizedBox(height: 10),
             
                             
                            ],
                          ),
                        ),
                        // Expanded(
                        //   flex: 2,
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: <Widget>[
                        //       Text(
                        //         items[index].rating.toString(),
                        //         style: TextStyle(
                        //             color: Colors.white,
                        //             fontFamily: 'Avenir',
                        //             fontSize: 18,
                        //             fontWeight: FontWeight.w700),
                        //       ),
                        //       // RatingBar(rating: items[index].rating),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
      );
      
}
class _BlogState extends State<Blog> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueAccent[50],
          appBar: AppBar(
            title: Text("Blogs",
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
                     MaterialPageRoute(builder: (context)=>BLOG()),
                    
                   );
                  

                },
              )
            ],

          

          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: <Widget>[
                   for (Map<String, dynamic> item in widget.list_blogs)
                blog(item['title'],item['description'],item['blog_site'].toString().toLowerCase())
                   //blog("machine learning","this is a ml blog"),

            ],
          ),
        )
    );
  }
}