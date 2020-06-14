import 'package:flutter/material.dart';


import 'package:searchable_dropdown/searchable_dropdown.dart';
// import 'package:searchable_dropdown/searchable_dropdown.dart';

class ExampleNumber {
  int number;

  static final Map<int, String> map = {
    0: "zero",
    1: "one",
    2: "two",
    3: "three",
    4: "four",
    5: "five",
    6: "six",
    7: "seven",
    8: "eight",
    9: "nine",
    10: "ten",
    11: "eleven",
    12: "twelve",
    13: "thirteen",
    14: "fourteen",
    15: "fifteen",
  };

  String get numberString {
    return (map.containsKey(number) ? map[number] : "unknown");
  }

  ExampleNumber(this.number);

  String toString() {
    return ("$number $numberString");
  }

  static List<ExampleNumber> get list {
    return (map.keys.map((num) {
      return (ExampleNumber(num));
    })).toList();
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool asTabs = false;
  String selectedValue;
  String preselectedValue = "dolor sit";
  ExampleNumber selectedNumber;
  List<int> selectedItems = [];
  final List<DropdownMenuItem> items = [];

  static const String appTitle = "Search Choices demo";
  final String loremIpsum =
      // "Acting ,Archery, Board games";
      " Archery Acting  Board, Games Calligraphy  , Cooking  Dance Drama  DIY  Fishing  Gardening.  Hiking   Hunting , IceSkating Puzzle Solving Knitting  Kite flying lego building Magic . Model building origami  playing music Reading  Singing  Table tennis urban exploration volley ball. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  void initState() {
    String wordPair = "";
    loremIpsum
        
        .replaceAll(",", "")
        .replaceAll(".", "")
        .split(" ")
        .forEach((word) {
      if (wordPair.isEmpty) {
        wordPair = word + " ";
      } else {
        wordPair += word;
        if (items.indexWhere((item) {
              return (item.value == wordPair);
            }) ==
            -1) {
        
            items.add(

            DropdownMenuItem(
            
            
            child: Text(wordPair),
            value: wordPair,
          )
          
              );
        }
        wordPair = "";
      }
    });
    super.initState();
  }

  // List<Widget> get appBarActions {
  //   return ([
  //     Center(child: Text("Tabs:")),
  //     Switch(
  //       activeColor: Colors.white,
  //       value: asTabs,
  //       onChanged: (value) {
  //         setState(() {
  //           asTabs = value;
  //         });
  //       },
  //     )
  //   ]);
  // }

  @override
  Widget build(BuildContext context) {
    Map<String, Widget> widgets;
    widgets = {
      
      "Search Hobby": SearchableDropdown.multiple(
        items: items,
        selectedItems: selectedItems,
        hint: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Choose options",style: TextStyle(
            color: Colors.black,
            // fontWeight: FontWeight.bold
            ),
            ),
        ),
        searchHint:Text("Select any",style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            ),
            ),
        
        onChanged: (value) {
          setState(() {
            selectedItems = value;
          });
        },
        closeButton: (selectedItems) {
          return (selectedItems.isNotEmpty
              ? "Delete ${selectedItems.length == 1 ? '"' + items[selectedItems.first].value.toString() + '"' : '(' + selectedItems.length.toString() + ')'}"
              : "Select atleast one"
              );
        },
        isExpanded: true,
      ),
  
      // "": Container(
             
      //             child:Text(" $selectedItems "),


            
      //     ),
      
     


    };
    
   

    return MaterialApp(
    
         home: Scaffold(
              appBar: AppBar(
                title: const Text("Delete Hobby"),
                automaticallyImplyLeading: true,
                leading: IconButton(icon: Icon(Icons.arrow_back), 
                 onPressed: (){

                    // Navigator.push(context,MaterialPageRoute(builder: (context){
                    //   return new HomePage();


                    // }));
                  
                  },
                )
                // actions: appBarActions,
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: widgets
                      .map((k, v) {
                        return (MapEntry(
                            k,
                            Center(
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(
                                        color: Colors.grey,
                                        width: 1.0,
                                      ),
                                    ),
                                    margin: EdgeInsets.all(20),
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Padding(
                                        padding:EdgeInsets.all(20),
                                        child:Column(
                                        
                                        children: <Widget>[
                                          Text("$k:"),
                                          v,
                                        ],
                                      ),
                                      )
                                    )
                                    )
                                    )
                                    )
                                    );
                      })
                      .values
                      .toList(),
                      
                ),
                
                 
                
              ),
              
              
            )
    
         
            
    );
  }
}


 
