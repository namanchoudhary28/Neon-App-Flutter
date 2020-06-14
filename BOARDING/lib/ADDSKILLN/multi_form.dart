import 'package:flutter/material.dart';
import 'package:BOARDING/ADDSKILLN/empty_state.dart';
import 'package:BOARDING/ADDSKILLN/form.dart';
import 'package:BOARDING/ADDSKILLN/user.dart';
import 'package:BOARDING/skill_adder.dart';

class MultiForm extends StatefulWidget {
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  
  List<UserForm> users = [];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: .0,
        leading: Icon(
          Icons.arrow_back,
        ),
        title: Text('Add Skill',
        textAlign: TextAlign.left,
        
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Save'),
            textColor: Colors.white,
            onPressed: onSave,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [
          //     Color(0xFF30C1FF),
          //     Color(0xFF2AA7DC),
          //   ],
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          // ),
        ),
        child: users.length <= 0
            ? Center(
                child: EmptyState(
                  title: 'Add',
                  message: 'Add form by tapping add button below',
                ),
              )
            : ListView.builder(
                addAutomaticKeepAlives: true,
                itemCount: users.length,
                itemBuilder: (_, i) => users[i],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        onPressed: onAddForm,
        foregroundColor: Colors.white,
      ),
    );
  }

  ///on form user deleted
  void onDelete(User _user) {
    setState(() {
      var find = users.firstWhere(
        (it) => it.user == _user,
        orElse: () => null,
      );
      if (find != null) users.removeAt(users.indexOf(find));
    });
  }

  ///on add form
  void onAddForm() {
    setState(() {
      var _user = User();
      users.add(UserForm(
        user: _user,
        onDelete: () => onDelete(_user),
      ));
    });
  }

  ///on save forms
  void onSave() {
    if (users.length > 0) {
      var allValid = true;
      users.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        var data = users.map((it) => it.user).toList();
        print(data[0].email); //level
        print(data[0].fullName);//name
        
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) => Scaffold(
                  appBar: AppBar(
                    title: Row(
                      
                      children: <Widget>[
                        Text("Skills"),
                        SizedBox(
                             width: 130.0,
                        ),
                        RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        padding: EdgeInsets.all(15.0),
        color: Colors.blue,
        onPressed: () {
          List <Map<String,String>> skills = List<Map<String,String>>();
          for(int i=0;i<data.length;i++){
            skills.add({"name" : data[i].fullName,"competancy" : data[i].email});

            }
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>SkillLoadingScreen(skills) ),


              );

        




          


        },
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Icon(
            Icons.save,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text("Save", style: TextStyle(color: Colors.white),)
        ],),
      ),
        

                      ],
                    )

                  ),
                  body: 
                    ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (_, i) => ListTile(
                          leading: CircleAvatar(
                            child: Text(data[i].fullName.substring(0, 1)),
                          ),
                          title: Text(data[i].fullName),
                          subtitle: Text(data[i].email),
                        ),
                        
                  ),

                 
                )
                  
                  
                
                  

                   
                ),
          
        
        );
      }
    }
  }
}
