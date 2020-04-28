import 'package:flutter/material.dart';

class HabitChecker extends StatefulWidget {
  @override
  _HabitCheckerState createState() => _HabitCheckerState();
}

class _HabitCheckerState extends State<HabitChecker> {
  bool completed = false;
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(24), children: <Widget>[
      Text(
        'click on the + if you have kept your habit today. this will feed fluffy \n\nclick on the - if you failed to keep the habit, now fluffy is not fed and will go hungry\n',
        style: TextStyle(
          fontFamily: 'PressStart2P',
          color: Colors.blue,
        ),
      ),
      Container(
        height: 300,
      ),
      Container(
        padding: const EdgeInsets.all(10.0),
        height: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey,
        ),
        child: Row(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      this.completed = true;
                    });
                  },
                  icon: Icon(Icons.add)),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      this.completed = false;
                    });
                  },
                  icon: Icon(Icons.remove)),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/images/placeholdercat.jpg',
                width: 200,
                height: 50,
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: null,
                  icon:
                      Icon(completed ? Icons.favorite : Icons.favorite_border),
                )),
          ],
        ),
        alignment: Alignment(1.0, 1.0),
      ),
      Container(
        height: 100,
      ),
      IconButton(
          onPressed: null,
          icon: Text(
            'Next',
            style: TextStyle(
              fontFamily: 'PressStart2P',
              color: Colors.white,
            ),
          )),
    ]);
  }
}
