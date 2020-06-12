import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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



class HobbyForm extends StatefulWidget {
  @override
  _HobbyFormState createState() => _HobbyFormState();
}

class _HobbyFormState extends State<HobbyForm> {
  // bool asTabs = false;
  String selectedValue;
  String preselectedValue = "dolor sit";
  ExampleNumber selectedNumber;
  List<int> selectedItems = [];                //accesing all hobbies id
  final List<DropdownMenuItem> items = [];

  static const String appTitle = "Search Choices demo";
  final String loremIpsum =
      // "Acting ,Archery, Board games";
      " Archery Acting  Board, Games Calligraphy  , Cooking  Dance Drama  DIY  Fishing  Gardening.  Hiking   Hunting , IceSkating Puzzle Solving Knitting  Kite flying lego building Magic . Model building origami  playing music Reading  Singing  Table tennis urban exploration volley ball. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  void initState() {
    String wordPair = "";
    loremIpsum
        .toUpperCase()
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
          items.add(DropdownMenuItem(
            child: Text(wordPair),
            value: wordPair,
          ));
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
          child: Text("Select any",style: TextStyle(fontWeight: FontWeight.bold),),
        ),
        searchHint: "Select any",
        
        onChanged: (value) {
          setState(() {
            selectedItems = value;
          });
        },
        closeButton: (selectedItems) {
          print(selectedItems);
          return (selectedItems.isNotEmpty
              ? "Save ${selectedItems.length == 1 ? '"' + items[selectedItems.first].value.toString() + '"' : '(' + selectedItems.length.toString() + ')'}"
              : "Save without selection");
        },
        isExpanded: true,
      ),
  
      // "": Container(
             
      //             child:Text(" $selectedItems "),


            
      //     ),
      
     


    };
    
   

    return MaterialApp(
      // home: asTabs
      //     ? DefaultTabController(
      //         length: widgets.length,
      //         child: Scaffold(
      //           appBar: AppBar(
      //             title: const Text(appTitle),
      //             actions: appBarActions,
      //             bottom: TabBar(
      //               isScrollable: true,
      //               tabs: Iterable<int>.generate(widgets.length)
      //                   .toList()
      //                   .map((i) {
      //                 return (Tab(
      //                   text: (i + 1).toString(),
      //                 ));
      //               }).toList(), //widgets.keys.toList().map((k){return(Tab(text: k));}).toList(),
      //             ),
      //           ),
      //           body: Container(
      //             padding: EdgeInsets.all(20),
      //             child: TabBarView(
      //               children: widgets
      //                   .map((k, v) {
      //                     return (MapEntry(
      //                         k,
      //                         SingleChildScrollView(
      //                           scrollDirection: Axis.vertical,
      //                           child: Column(children: [
      //                             Text(k),
      //                             SizedBox(
      //                               height: 20,
      //                             ),
      //                             v,
      //                           ]),
                                
      //                         )));
      //                   })
      //                   .values
      //                   .toList(),
      //             ),
      //           ),
                
                

                
      //         ),
      //       )
      //     : 
         home: Scaffold(
              appBar: AppBar(
                title: const Text("Add Hobby"),
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
                                      child: Column(
                                        children: <Widget>[
                                          Text("$k:"),
                                          v,
                                        ],
                                      ),
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


  // Conta({MainAxisAlignment mainAxisAlignment, List<Widget> children}) {}}
    //  "Multi custom display dialog": SearchableDropdown.multiple(
    //     items: items,
    //     selectedItems: selectedItems,
    //     hint: Padding(
    //       padding: const EdgeInsets.all(12.0),
    //       child: Text("Select any"),
    //     ),
    //     searchHint: "Select any",
    //     onChanged: (value) {
    //       setState(() {
    //         selectedItems = value;
    //       });
    //     },
    //     displayItem: (item, selected) {
    //       return (Row(children: [
    //         selected
    //             ? Icon(
    //                 Icons.check,
    //                 color: Colors.green,
    //               )
    //             : Icon(
    //                 Icons.check_box_outline_blank,
    //                 color: Colors.grey,
    //               ),
    //         SizedBox(width: 7),
    //         Expanded(
    //           child: item,
    //         ),
    //       ]));
    //     },
    //     selectedValueWidgetFn: (item) {
    //       return (Center(
    //           child: Card(
    //               shape: RoundedRectangleBorder(
    //                 borderRadius: BorderRadius.circular(10),
    //                 side: BorderSide(
    //                   color: Colors.brown,
    //                   width: 0.5,
    //                 ),
    //               ),
    //               margin: EdgeInsets.all(12),
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8),
    //                 child: Text(item.toString()),
    //               ))));
    //     },
    //     doneButton: (selectedItemsDone, doneContext) {
    //       return (RaisedButton(
    //           onPressed: () {
    //             Navigator.pop(doneContext);
    //             setState(() {});
    //           },
    //           child: Text("Save")));
    //     },
    //     closeButton: null,
    //     style: TextStyle(fontStyle: FontStyle.italic),
    //     searchFn: (String keyword, items) {
    //       List<int> ret = List<int>();
    //       if (keyword != null && items != null && keyword.isNotEmpty) {
    //         keyword.split(" ").forEach((k) {
    //           int i = 0;
    //           items.forEach((item) {
    //             if (k.isNotEmpty &&
    //                 (item.value
    //                     .toString()
    //                     .toLowerCase()
    //                     .contains(k.toLowerCase()))) {
    //               ret.add(i);
    //             }
    //             i++;
    //           });
    //         });
    //       }
    //       if (keyword.isEmpty) {
    //         ret = Iterable<int>.generate(items.length).toList();
    //       }
    //       return (ret);
    //     },
    //     clearIcon: Icon(Icons.clear_all),
    //     icon: Icon(Icons.arrow_drop_down_circle),
    //     label: "Label for multi",
    //     underline: Container(
    //       height: 1.0,
    //       decoration: BoxDecoration(
    //           border:
    //               Border(bottom: BorderSide(color: Colors.teal, width: 3.0))),
    //     ),
    //     iconDisabledColor: Colors.brown,
    //     iconEnabledColor: Colors.indigo,
    //     isExpanded: true,
    // 