import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var borderRadius = 15.0;
  var borderWidth = 4.0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var barHeight = height * 0.6;
    var barWidth = width * 0.6;
    return Scaffold(
      backgroundColor: Color(0xfffcf9f4),
      body: SafeArea(
        child: Center(
          child: Container(
            height: height * 0.6,
            width: width * 0.6,
            color: Colors.red,
            child: Stack(
              children: [
                // Bar
                Container(
                  margin: EdgeInsets.only(left: height * 0.04),
                  color: Colors.blue,
                  height: height * 0.6,
                  width: height * 0.6,
                  child: CustomPaint(
                    size: Size.zero,
                    painter: Bar(barHeight, barWidth),
                  ),
                ),

                //Base
                Positioned(
                  top: barHeight * 0.9,
                  left: 0,
                  child: Container(
                    height: barHeight * 0.1,
                    width: (((height * 0.04) * 2) + barHeight * 1),
                    decoration: const BoxDecoration(
                      color: Color(0xff071013),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                  ),
                ),
                //Smily Face
                Positioned(
                  left: width * 0.2,
                  top: barHeight * 0.012,
                  child: Container(
                    width: 1,
                    height: barHeight * 0.6,
                    decoration: BoxDecoration(color: Color(0xffAAAAAA)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Bar extends CustomPainter {
  double mysize;
  double myWidth;
  Bar(this.mysize, this.myWidth);
  @override
  void paint(Canvas canvas, Size size) {
    print('size is $size');
    //leftBar
    var leftBar = Rect.fromPoints(
        Offset(0, mysize * 0.14), Offset(mysize * 0.025, mysize * 0.9));

    canvas.drawRect(leftBar, Paint()..color = Color(0xffAAAAAA));
//leftArc
    final arcRect = Rect.fromLTRB(
        mysize * 0.012, mysize * 0.012, mysize * 0.3, mysize * 0.3);
    final startAngle1 = -pi / 2;
    final sweepAngle1 = -pi / 2;
    canvas.drawArc(
        arcRect,
        startAngle1,
        sweepAngle1,
        false,
        Paint()
          ..color = Color(0xffAAAAAA)
          ..strokeWidth = mysize * 0.025
          ..style = PaintingStyle.stroke);
    //topBar
    var topBarCaenter = Offset(mysize / 2, mysize * 0.0125);
    var topBarRect = Rect.fromCenter(
        center: topBarCaenter, width: (mysize * 0.7), height: mysize * 0.025);
    canvas.drawRect(topBarRect, Paint()..color = Color(0xffAAAAAA));
    //right arc
    final arcRect2 = Rect.fromLTRB((mysize * 0.7), mysize * 0.012,
        (mysize * 1) - mysize * 0.012, mysize * 0.3);
    final startAngle2 = -pi / 2;
    final sweepAngle2 = pi / 2;
    canvas.drawArc(
        arcRect2,
        startAngle2,
        sweepAngle2,
        false,
        Paint()
          ..color = Color(0xffAAAAAA)
          ..strokeWidth = mysize * 0.025
          ..style = PaintingStyle.stroke);
    //rightBar
    var rightBar = Rect.fromPoints(Offset(mysize * 0.975, mysize * 0.14),
        Offset(mysize * 1, mysize * 0.9));

    canvas.drawRect(rightBar, Paint()..color = Color(0xffAAAAAA));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
