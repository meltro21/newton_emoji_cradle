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
  double calculateLineMargin(int lineNumber, double barWidth) {
    print('total is $barWidth');
    var emojiSize = (barWidth * 0.6) / 6;
    print('emoji size is $emojiSize');

    var left = barWidth * 0.2;
    print('left is $left');
    var numberOfEmoji = emojiSize * lineNumber;
    left = left + (emojiSize / 2) + numberOfEmoji;
    return left;
  }

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
            height: height * 0.7,
            width: width * 0.7,
            color: Colors.red,
            child: Stack(
              children: [
                // Bar
                Container(
                  margin:
                      EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                  color: Colors.blue,
                  height: height * 0.7,
                  width: width * 0.7,
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
                    width: (((width * 0.04) * 2) + barWidth * 1),
                    decoration: const BoxDecoration(
                      color: Color(0xff071013),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  child: Container(
                    color: Colors.green,
                    height: 50,
                    width: 99.24,
                  ),
                ),
                //1-Smily Face
                //line
                Positioned(
                  left: calculateLineMargin(
                    0,
                    barWidth,
                  ),
                  top: barHeight * 0.012,
                  child: Container(
                    width: barWidth * 0.003,
                    height: barHeight * 0.6,
                    decoration: BoxDecoration(color: Color(0xffAAAAAA)),
                  ),
                ),
                //face
                smilyFace(width * 0.04, barWidth, barHeight, 0),

                //2-Not Amused Face
                //line
                Positioned(
                  left: calculateLineMargin(
                    1,
                    barWidth,
                  ),
                  top: barHeight * 0.012,
                  child: Container(
                    width: barWidth * 0.003,
                    height: barHeight * 0.6,
                    decoration: BoxDecoration(color: Color(0xffAAAAAA)),
                  ),
                ),
                smilyFace(barHeight * 0.15, barWidth, barHeight, 1),

                //2-Not Amused Face
                //line
                Positioned(
                  left: calculateLineMargin(
                    2,
                    barWidth,
                  ),
                  top: barHeight * 0.012,
                  child: Container(
                    width: barWidth * 0.003,
                    height: barHeight * 0.6,
                    decoration: BoxDecoration(color: Color(0xffAAAAAA)),
                  ),
                ),
                smilyFace(barHeight * 0.15, barWidth, barHeight, 2),

                //2-Not Amused Face
                //line
                Positioned(
                  left: calculateLineMargin(
                    3,
                    barWidth,
                  ),
                  top: barHeight * 0.012,
                  child: Container(
                    width: barWidth * 0.003,
                    height: barHeight * 0.6,
                    decoration: BoxDecoration(color: Color(0xffAAAAAA)),
                  ),
                ),
                smilyFace(barHeight * 0.15, barWidth, barHeight, 3),

                //2-Not Amused Face
                //line
                Positioned(
                  left: calculateLineMargin(
                    4,
                    barWidth,
                  ),
                  top: barHeight * 0.012,
                  child: Container(
                    width: barWidth * 0.003,
                    height: barHeight * 0.6,
                    decoration: BoxDecoration(color: Color(0xffAAAAAA)),
                  ),
                ),
                smilyFace(barHeight * 0.15, barWidth, barHeight, 4),

                //2-Not Amused Face
                //line
                Positioned(
                  left: calculateLineMargin(
                    5,
                    barWidth,
                  ),
                  top: barHeight * 0.012,
                  child: Container(
                    width: barWidth * 0.003,
                    height: barHeight * 0.6,
                    decoration: BoxDecoration(color: Color(0xffAAAAAA)),
                  ),
                ),
                smilyFace(barHeight * 0.15, barWidth, barHeight, 5),
                Positioned(
                  left: 396.96,
                  child: Container(
                    color: Colors.green,
                    height: 50,
                    width: 99.24,
                  ),
                )
                // Positioned(
                //   left: barWidth * 0.3 - (barHeight * 0.15 / 2),
                //   top: barHeight * 0.6,
                //   child: smilyFace(barHeight * 0.15, barWidth, barHeight),
                // ),
                // Positioned(
                //   left: barWidth * 0.3 - (barHeight * 0.15 / 2),
                //   top: barHeight * 0.6,
                //   child: smilyFace(barHeight * 0.15, barWidth, barHeight),
                // ),
                // Positioned(
                //   left: barWidth * 0.3 - (barHeight * 0.15 / 2),
                //   top: barHeight * 0.6,
                //   child: smilyFace(barHeight * 0.15, barWidth, barHeight),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget smilyFace(
    double width, double barWidth, double barHeight, double numberOfEmoji) {
  var size = (barWidth * 0.6) / 6;
  // print('individualCircle should be $individualCircle');
  return Positioned(
    left: (barWidth * 0.2) + (size * numberOfEmoji) + width,
    top: barHeight * 0.6,
    child: Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Color(0xffeDBF37),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        children: [
          //leftEye
          Positioned(
            top: size * 0.3,
            left: size * 0.2,
            child: Transform.rotate(
              angle: pi / 4,
              child: Container(
                height: size * 0.05,
                width: size * 0.2,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: size * 0.3 + size * 0.09,
            left: size * 0.25,
            child: Transform.rotate(
              angle: -pi / 12,
              child: Container(
                height: size * 0.05,
                width: size * 0.15,
                color: Colors.black,
              ),
            ),
          ),
          //rightEye
          Positioned(
            top: size * 0.3,
            left: size * 0.6,
            child: Transform.rotate(
              angle: -pi / 4,
              child: Container(
                height: size * 0.05,
                width: size * 0.2,
                color: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: size * 0.3 + size * 0.09,
            left: size * 0.6,
            child: Transform.rotate(
              angle: pi / 12,
              child: Container(
                height: size * 0.05,
                width: size * 0.15,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: size * 0.01),
            child: CustomPaint(
              painter: SmilyFaceSmile(),
              size: Size(size, size),
            ),
          ),
        ],
      ),
    ),
  );
}

class SmilyFaceSmile extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.black;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2 + (size.height * 0.15)),
        height: size.height * 0.6,
        width: size.width * 0.6,
      ),
      -pi,
      -pi,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Bar extends CustomPainter {
  double myHeight;
  double myWidth;

  Bar(this.myHeight, this.myWidth);
  @override
  void paint(Canvas canvas, Size size) {
    print('size is $size');
    print('mywithd is $myWidth');
    //leftBar
    var leftBar = Rect.fromPoints(
        Offset(0, myHeight * 0.14), Offset(myWidth * 0.025, myHeight * 0.9));

    canvas.drawRect(leftBar, Paint()..color = Color(0xffAAAAAA));
//leftArc
    final arcRect = Rect.fromLTRB(
        myWidth * 0.012, myHeight * 0.012, myWidth * 0.3, myHeight * 0.3);
    final startAngle1 = -pi / 2;
    final sweepAngle1 = -pi / 2;
    canvas.drawArc(
        arcRect,
        startAngle1,
        sweepAngle1,
        false,
        Paint()
          ..color = Color(0xffAAAAAA)
          ..strokeWidth = myWidth * 0.025
          ..style = PaintingStyle.stroke);
    //topBar
    var topBarCaenter = Offset(myWidth / 2, myHeight * 0.0125);
    var topBarRect = Rect.fromCenter(
        center: topBarCaenter, width: (myWidth * 0.7), height: myWidth * 0.025);
    canvas.drawRect(topBarRect, Paint()..color = Color(0xffAAAAAA));
    //right arc
    final arcRect2 = Rect.fromLTRB((myWidth * 0.7), myHeight * 0.012,
        (myWidth * 1) - myWidth * 0.012, myHeight * 0.3);
    final startAngle2 = -pi / 2;
    final sweepAngle2 = pi / 2;
    canvas.drawArc(
        arcRect2,
        startAngle2,
        sweepAngle2,
        false,
        Paint()
          ..color = Color(0xffAAAAAA)
          ..strokeWidth = myWidth * 0.025
          ..style = PaintingStyle.stroke);
    //rightBar
    var rightBar = Rect.fromPoints(Offset(myWidth * 0.975, myHeight * 0.14),
        Offset(myWidth * 1, myHeight * 0.9));

    canvas.drawRect(rightBar, Paint()..color = Color(0xffAAAAAA));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
