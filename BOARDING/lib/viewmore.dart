import 'package:flutter/material.dart';

final viewmorebutton = RaisedButton(
  color: Colors.white,
  onPressed: () {},
  child: Row(
    children: <Widget>[
      Text("View more"),
      Image(
        image: NetworkImage(
            'https://img.icons8.com/cute-clipart/64/000000/circled-chevron-down.png'),
        height: 20.0,
        width: 20.0,
      )
    ],
  ),
  shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      side: BorderSide(color: Colors.blue)),
);
