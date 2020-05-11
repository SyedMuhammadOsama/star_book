import 'package:flutter/material.dart';
import 'package:star_book/models/day.dart';
import 'package:star_book/utils/dayWidget_size.dart';

class DayWidget extends StatelessWidget {
  DayWidget({@required this.day, this.onDayPressed});

  final Day day;
  final Function onDayPressed;
  // String diary_text or tag for now,

  @override
  Widget build(BuildContext context) {
    final double size = getDayWidgetSize();
    final int _day = this.day.day;
    final Color _color = this.day.color;

    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: _color != null
          ? BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(size / 2),
            )
          : null,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
            onDayPressed(day);
          },
          child: Text(
            _day < 1 ? '' : _day.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: day.color != null ? Colors.white : Colors.black87,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            // Navigate back to first route when tapped
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}