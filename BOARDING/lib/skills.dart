import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

Row card_panel(BuildContext context, String competancy, double percent) {
  String percentage = (percent * 100).toString() + '%';
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      IconButton(
        iconSize: 20.0,
        tooltip: "See your competancy",
        onPressed: () {
          showDialog(
              context: context,
              builder: (_) => AlertDialog(
                      actions: <Widget>[
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      title: Text(competancy),
                      elevation: 24.0,
                      content: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: new LinearPercentIndicator(
                          width: 200.0,
                          animation: true,
                          lineHeight: 20.0,
                          animationDuration: 2000,
                          percent: percent,
                          center: Text(
                            percentage,
                            style: TextStyle(color: Colors.white),
                          ),
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          progressColor: Colors.blue,
                        ),
                      )));
        },
        icon: Icon(
          Icons.short_text,
          color: Colors.white,
        ),
      ),
      /*
      Tooltip(
        message: "check it to delete this skill",
        child: Checkbox(
          value: true,
          tristate: true,
          activeColor: Colors.white,
          checkColor: Colors.blueAccent[200],
          onChanged: (value) {},
        ),
      ),
      IconButton(
        icon: Icon(
          Icons.edit,
          color: Colors.white,
        ),
        onPressed: () {},
      )

       */
    ],
  );
}

Image skill_image_returner(String name) {
  try {
    return Image(
      image: AssetImage('assets/skills/$name.png'),
      height: 50.0,
      width: 50.0,
    );
  } on Exception {
    return Image(
      image: AssetImage('assets/skills/DEFAULT.png'),
      height: 60.0,
      width: 60.0,
    );
  }
}

Container skills_card(
    BuildContext context, String name, double percent, String competancy) {
  return Container(
    width: 160.0,
    height: 160.0,
    child: Card(
      elevation: 6.0,
      color: Colors.lightBlue[400],
      child: InkWell(
        child: Column(
          children: <Widget>[
            card_panel(context, competancy, percent),
            skill_image_returner(name),
            Text(
              name,
              style: TextStyle(fontSize: 15.0, color: Colors.white),
            )
          ],
        ),
      ),
    ),
  );
}

Container list_cards(BuildContext context, skill1, skill2) {
  var competancies = {
    'Beginner': 25,
    'Intermediate': 50,
    'Advanced': 75,
    'Pro': 100
  };
  double percent1 = competancies[skill1['competancy']] / 100;

  double percent2 = competancies[skill2['competancy']] / 100;

  return Container(
      margin: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          skills_card(context, skill1['name'].toUpperCase(), percent1,
              skill1['competancy']),
          skills_card(context, skill2['name'].toUpperCase(), percent2,
              skill2['competancy'])
        ],
      ));
}


Row button_rows() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[

      RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        color: Colors.blue,
        padding: EdgeInsets.all(15.0),
        onPressed: () {

        },
        child: Row(children: <Widget>[
          Icon(
            Icons.cancel,
            color: Colors.white,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text("Cancel", style: TextStyle(color: Colors.white),)
        ],),
      ),
      RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),
        padding: EdgeInsets.all(15.0),
        color: Colors.blue,
        onPressed: () {

        },
        child: Row(children: <Widget>[
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
  );
}

class SkillsDisplay extends StatefulWidget {
  final List skills;

  const SkillsDisplay(this.skills);

  @override
  _SkillsDisplayState createState() => _SkillsDisplayState();
}

class _SkillsDisplayState extends State<SkillsDisplay> {

  List<Widget> skill_children_returner() {
    List<Widget>children = List<Widget>();
    int g = (widget.skills.length ~/ 2).toInt();
    int f = 0;
    for (int i = 0; i < g; i++) {
      children.add(list_cards(context, widget.skills[f], widget.skills[f + 1]));
      f += 2;
    }
    if (widget.skills.length % 2 != 0) {
      var last_child = widget.skills[widget.skills.length - 1];
      var competancies = {
        'Beginner': 25,
        'Intermediate': 50,
        'Advanced': 75,
        'Pro': 100
      };
      double percent = competancies[last_child['competancy']] / 10;

      children.add(skills_card(
          context, last_child['name'], percent, last_child['competancy']));
    }
    children.add(SizedBox(height: 10.0,));
    children.add(button_rows());
    children.add(SizedBox(height: 15.0,));
    return children;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Skills", style: TextStyle(
              fontSize: 20.0,
            ),),
          ),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: skill_children_returner(),


          )


      ),
    );
  }
}