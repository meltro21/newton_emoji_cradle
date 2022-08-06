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
    left = left + (emojiSize) + numberOfEmoji;
    return left;
  }

  @override
  Widget build(BuildContext context) {
    var height = (MediaQuery.of(context).size.height) * 0.7;
    var width = (MediaQuery.of(context).size.width) * 0.7;
    var barHeight = height * 0.7;
    var barWidth = width * 0.7;
    return Scaffold(
      backgroundColor: const Color(0xfffcf9f4),
      body: SafeArea(
        child: Center(
          child: Container(
            height: height,
            width: width,
            //color: Colors.red,
            child: Stack(
              children: [
                // Bar
                Container(
                  height: height,
                  width: width,
                  //color: Colors.blue,
                  child: CustomPaint(
                    size: Size.zero,
                    painter: Bar(height, width),
                  ),
                ),

                //Base
                Positioned(
                  top: height * 0.9,
                  left: 0,
                  child: Container(
                    height: height * 0.1,
                    width: width * 1,
                    decoration: const BoxDecoration(
                      color: Color(0xff071013),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                  ),
                ),

                //1-Smily Face
                //line
                Positioned(
                  left: calculateLineMargin(
                    0,
                    width,
                  ),
                  top: height * 0.012,
                  child: Container(
                    width: width * 0.003,
                    height: height * 0.6,
                    decoration: BoxDecoration(color: Color(0xffAAAAAA)),
                  ),
                ),
                //face
                smilyFace(width * 0.04, width, height, 0),

                //2-Not Amused Face
                //line
                Positioned(
                  left: calculateLineMargin(
                    1,
                    width,
                  ),
                  top: height * 0.012,
                  child: Container(
                    width: width * 0.003,
                    height: height * 0.6,
                    decoration: BoxDecoration(color: Color(0xffAAAAAA)),
                  ),
                ),
                notAmusedFace(width * 0.04, width, height, 1),

                //3-Depressed Face
                //line
                Positioned(
                  left: calculateLineMargin(
                    2,
                    width,
                  ),
                  top: height * 0.012,
                  child: Container(
                    width: width * 0.003,
                    height: height * 0.6,
                    decoration: BoxDecoration(color: Color(0xffAAAAAA)),
                  ),
                ),
                depressedFace(width * 0.04, width, height, 2),

                //4-Depressed Face
                //line
                Positioned(
                  left: calculateLineMargin(
                    3,
                    width,
                  ),
                  top: height * 0.012,
                  child: Container(
                    width: width * 0.003,
                    height: height * 0.6,
                    decoration: BoxDecoration(color: Color(0xffAAAAAA)),
                  ),
                ),
                depressedFace(width * 0.04, width, height, 3),

                //2-Not Amused Face
                //line
                Positioned(
                  left: calculateLineMargin(
                    4,
                    width,
                  ),
                  top: height * 0.012,
                  child: Container(
                    width: width * 0.003,
                    height: height * 0.6,
                    decoration: BoxDecoration(color: Color(0xffAAAAAA)),
                  ),
                ),
                smilyFace(width * 0.04, width, height, 4),

                //2-Not Amused Face
                //line
                // Positioned(
                //   left: calculateLineMargin(
                //     5,
                //     width,
                //   ),
                //   top: height * 0.012,
                //   child: Container(
                //     width: width * 0.003,
                //     height: height * 0.6,
                //     decoration: BoxDecoration(color: Color(0xffAAAAAA)),
                //   ),
                // ),
                // smilyFace(width * 0.04, width, height, 5),
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
  return Positioned(
    left: (barWidth * 0.2) + (size * numberOfEmoji) + size / 2,
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

//2
//not amused Face
Widget notAmusedFace(
    double width, double barWidth, double barHeight, double numberOfEmoji) {
  var size = (barWidth * 0.6) / 6;
  return Positioned(
    left: (barWidth * 0.2) + (size * numberOfEmoji) + size / 2,
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
          CustomPaint(
            painter: NotAmused(size),
          ),
        ],
      ),
    ),
  );
}

class NotAmused extends CustomPainter {
  double mySize;
  NotAmused(this.mySize);
  @override
  void paint(Canvas canvas, Size size) {
    //left eye
    var rectLeft1 =
        Rect.fromLTRB(mySize * 0.1, mySize * 0.3, mySize * 0.4, mySize * 0.45);
    canvas.drawArc(rectLeft1, pi / 2, pi, false, Paint());
    var rectLeft2 =
        Rect.fromLTRB(mySize * 0.1, mySize * 0.3, mySize * 0.4, mySize * 0.45);
    canvas.drawArc(rectLeft2, 0.0, -pi, false, Paint());

    //right eye
    var rectRight1 =
        Rect.fromLTRB(mySize * 0.6, mySize * 0.3, mySize * 0.9, mySize * 0.45);
    canvas.drawArc(rectRight1, pi / 2, pi, false, Paint());
    var rectRight2 =
        Rect.fromLTRB(mySize * 0.6, mySize * 0.3, mySize * 0.9, mySize * 0.45);
    canvas.drawArc(rectRight2, 0.0, -pi, false, Paint());

    //mouth
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(mySize / 2, mySize / 2 + mySize * 0.28),
        height: mySize * 0.2,
        width: mySize * 0.4,
      ),
      0,
      -pi,
      false,
      Paint()..color = Colors.black,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

//3
//depressed Face
Widget depressedFace(
    double width, double barWidth, double barHeight, double numberOfEmoji) {
  var size = (barWidth * 0.6) / 6;
  return Positioned(
    left: (barWidth * 0.2) + (size * numberOfEmoji) + size / 2,
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
          CustomPaint(
            painter: DepressedFaceCustomPaint(size),
          ),
        ],
      ),
    ),
  );
}

class DepressedFaceCustomPaint extends CustomPainter {
  double mySize;
  DepressedFaceCustomPaint(this.mySize);
  @override
  void paint(Canvas canvas, Size size) {
    //left Eye
    //  //eye brow
    canvas
      ..save()
      ..translate(mySize * 0.1, mySize * 0.2)
      ..rotate(-22 * pi / 180)
      ..translate(-mySize * 0.1, -mySize * 0.2);
    var rectLeftEyebrow =
        Rect.fromLTRB(mySize * 0.1, mySize * 0.3, mySize * 0.4, mySize * 0.45);
    canvas.drawArc(
        rectLeftEyebrow, 0, pi, false, Paint()..color = Color(0xff8D7220));
    canvas.restore();
    // //eye
    var rectLeftEye = Rect.fromLTRB(
        mySize * 0.15, mySize * 0.4, mySize * 0.45, mySize * 0.55);
    canvas.drawArc(rectLeftEye, 0, pi, false, Paint()..color = Colors.black);

    //right eye
    //  //eyebrow
    canvas
      ..save()
      ..translate(mySize * 0.9, mySize * 0.2)
      ..rotate(22 * pi / 180)
      ..translate(-mySize * 0.9, -mySize * 0.2);
    var rectLeftEyebroww =
        Rect.fromLTRB(mySize * 0.6, mySize * 0.3, mySize * 0.9, mySize * 0.45);
    canvas.drawArc(
        rectLeftEyebroww, 0, pi, false, Paint()..color = Color(0xff8D7220));
    canvas.restore();
    // //eye
    var rectRightEye =
        Rect.fromLTWH(mySize * 0.55, mySize * 0.4, mySize * 0.3, mySize * 0.15);
    //Rect.fromLTRB(
    //mySize * 0.55, mySize * 0.4, mySize * 0.85, mySize * 0.55);
    canvas.drawArc(rectRightEye, 0, pi, false, Paint()..color = Colors.black);

    //mouth
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(mySize / 2, mySize / 2 + mySize * 0.28),
        height: mySize * 0.05,
        width: mySize * 0.2,
      ),
      Paint()
        ..color = Colors.black
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Bar extends CustomPainter {
  double myHeight;
  double myWidth;

  Bar(this.myHeight, this.myWidth);
  @override
  void paint(Canvas canvas, Size size) {
    //leftBar
    var leftBar = Rect.fromPoints(Offset(myWidth * 0.1, myHeight * 0.14),
        Offset(myWidth * 0.1 + myWidth * 0.025, myHeight * 0.9));
    canvas.drawRect(leftBar, Paint()..color = const Color(0xffAAAAAA));

    //leftArc
    final arcRect = Rect.fromLTRB(myWidth * 0.1 + myWidth * 0.012,
        myHeight * 0.012, myWidth * 0.3, myHeight * 0.3);
    const startAngle1 = -pi / 2;
    const sweepAngle1 = -pi / 2;
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
    var topBarCaenter = Offset(myWidth / 2, myHeight * 0.013);
    var topBarRect = Rect.fromCenter(
        center: topBarCaenter,
        width: (myWidth * 0.62),
        height: myWidth * 0.025);
    canvas.drawRect(topBarRect, Paint()..color = const Color(0xffAAAAAA));

    //right arc
    var minusMargin = myWidth - myWidth * 0.1;
    var minusArc =
        minusMargin - ((myWidth * 0.3) - ((myWidth * 0.1) - (myWidth * 0.012)));
    final arcRect2 = Rect.fromLTRB(minusArc, myHeight * 0.012,
        minusMargin - ((myWidth * 0.012)), myHeight * 0.3);
    const startAngle2 = -pi / 2;
    const sweepAngle2 = pi / 2;
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
    var rightBar = Rect.fromPoints(
        Offset(myWidth * 0.9 - (myWidth * 0.025), myHeight * 0.14),
        Offset(myWidth * 0.9, myHeight * 0.9));
    canvas.drawRect(rightBar, Paint()..color = const Color(0xffAAAAAA));
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
