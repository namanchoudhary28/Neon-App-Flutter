import 'package:flutter/material.dart';
class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children:<Widget>[
          Container(
            width:double.infinity,
            padding:EdgeInsets.only(
              top:30,
              bottom: 10,
            ),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children:<Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
                    width:100,
                    height:150,
                    decoration:BoxDecoration(
                      shape:BoxShape.circle,
                      image:DecorationImage(image: AssetImage('assets/images/man.png'),
                      
                      ),
                      

                    )
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Naman",
                  style: TextStyle(fontSize:22,
                  color: Colors.white),
                  ),
                
                  Text("namanc@iitbhilai.ac.in",
                  style: TextStyle(fontSize:17,
                  color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile',
            style: TextStyle(fontSize:16),),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings',
            style: TextStyle(fontSize:16),),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.menu),
            title: Text('Discover',
            style: TextStyle(fontSize:16),),
            onTap: null,
          ),
          ListTile(
            leading: Icon(Icons.arrow_back),
            title: Text('Logout',
            style: TextStyle(fontSize:16),),
            onTap: null,
          ),

        ],
      ),

    );
  }
}