import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentindex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue,
      // controller: controller,

      items: [
        BottomNavigationBarItem(
          icon: InkWell(
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onTap: () {
              /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new MultiForm();
              }))*/
            },
          ),
          title: Text(
            'Home',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            child: Icon(
              Icons.backup,
              color: Colors.white,
            ),
            onTap: () {
             /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new MultiForm();
              }))*/
            },
          ),
          title: Text(
            'Jobs',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onTap: () {
              /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new MultiForm();
              }))*/
            },
          ),
          title: Text(
            'Post',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onTap: () {
              /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new MultiForm();
              }))*/
            },
          ),
          title: Text(
            'Network',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: InkWell(
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onTap: () {
              /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                return new MultiForm();
              }))*/
            },
          ),
          title: Text(
            'Search',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentindex = index;
        });
      },
    );
  }
}
