import 'package:BOARDING/education.dart';
import 'package:flutter/material.dart';
class LICENCE extends StatefulWidget {
  @override
  _LICENCEState createState() => _LICENCEState();
}

class _LICENCEState extends State<LICENCE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("LICENCE"),
      ),
      body:Padding(
              padding: const EdgeInsets.all(16.0),
              
   
              
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
                            'assets/icon.png',
                            height: 94,
                            width: 94,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EDUCATION()),
                        );
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
                                "Machine Learning",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    // fontFamily: 'Avenir',
                                    fontWeight: FontWeight.w700),
                              ),
                            SizedBox(height: 10),
                              Text(
                                "Coursera",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  
                                  // fontFamily: 'Avenir',
                                ),
                                
                              ),
                                  SizedBox(height: 10),
                              Text(
                                "Year",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  // fontFamily: 'Avenir',
                                ),
                              ),
                              // SizedBox(height: 16),
                             
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
      )
      
    );
  
  }
}
