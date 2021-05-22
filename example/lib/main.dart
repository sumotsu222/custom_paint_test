import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  Widget _widget = Center(
                     child: Text('item1',style: TextStyle(fontSize: 24)),
                   );
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {
              setState(() {
                _isExpanded ? _isExpanded = false : _isExpanded = true;
              });
            },
            icon: Icon(Icons.menu),
          ),
        ),
        body: _isExpanded
          ? customHamburger(
              onClick: (Widget widget) {
                  setState(() {
                    _widget = widget;
                  });
                },
              display: _widget
              )
          : Container(
              child: _widget,
            ),
      ),
    );
  }
}

class item1 {
  Widget display() {
    return Center(
      child: Text('item1',style: TextStyle(fontSize: 24)),
    );
  }
}
class item2 {
  Widget display() {
    return Center(
      child: Text('item2',style: TextStyle(fontSize: 24)),
    );
  }
}
class item3 {
  Widget display() {
    return Center(
      child: Text('item3',style: TextStyle(fontSize: 24)),
    );
  }
}
class item4 {
  Widget display() {
    return Center(
      child: Text('item4',style: TextStyle(fontSize: 24)),
    );
  }
}

typedef customHamburgerCallback(Widget widget);

class customHamburger extends StatefulWidget{

  customHamburgerCallback? onClick;
  Widget? display;

  customHamburger({@required this.onClick,@required this.display});

  @override
  _customHamburger createState() => _customHamburger();
}

class _customHamburger extends State<customHamburger>{
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: widget.display,
        ),
        Container(
          width: 200,
          height: 200,
          child: CustomPaint(
              painter: CanvasPainter(),
          )
        ),
        Positioned(
          left:  100,
          top:   0,
          child: Transform.rotate(
            angle: 0,
            child: TextButton(onPressed: () { widget.onClick!(item1().display());},
              child: Text('item1',style: TextStyle(fontSize: 24, color: Colors.white)),
            )
          )
        ),
        Positioned(
          left:  80,
          top:   55,
          child: Transform.rotate(
              angle: math.pi/6,
              child: TextButton(onPressed: () { widget.onClick!(item2().display());},
                child: Text('item2',style: TextStyle(fontSize: 24, color: Colors.white)),
              )
          )
        ),
        Positioned(
          left:  40,
          top:   100,
          child: Transform.rotate(
              angle: math.pi/3,
              child: TextButton(onPressed: () { widget.onClick!(item3().display());},
                child: Text('item3',style: TextStyle(fontSize: 24, color: Colors.white)),
              )
          )
        ),
        Positioned(
          left:  -20,
          top:   130,
          child: Transform.rotate(
              angle: math.pi/2,
              child: TextButton(onPressed: () { widget.onClick!(item4().display());},
                child: Text('item4',style: TextStyle(fontSize: 24, color: Colors.white)),
              )
          )
        ),
      ],
    );
  }
}


class CanvasPainter extends CustomPainter {

  //CanvasPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final canvasSize = Rect.fromLTWH(0,0,size.width,size.height);
    final rect = Rect.fromLTRB(-200, -200, 200, 200);

    final startAngle = 0.0;
    final sweepAngle = 6.3;
    final useCenter = false;
    final paint = Paint()
    ..color = Colors.blue
    ..style = PaintingStyle.fill
    ..strokeWidth = 4;

    //canvas.drawRect(canvasSize,paint);

    //canvas.drawRect(rect,paint);

    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}