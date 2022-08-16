import 'package:flutter/material.dart';

void main() => runApp(const Main());

/// Main app class
class Main extends StatelessWidget {

  static const String _title = 'Flutter test application';

  /// Constructor for MyApp widget
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

///Class for StatefulWidget
class MyStatefulWidget extends StatefulWidget {
  ///Constructor for StatefulWidget
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Color _color = Colors.white;

  static const int maxValForRGB = 256;
  static const int dividerR = 7;
  static const int dividerG = 10;
  static const int dividerB = 5;
  static const double maxValForOpacity = 1.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      Container(
        color: _color,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            /// Realization of random. Get time in millis and then shift value
            /// with RGB channel coefficient (dividersRGB),
            /// then modulo of dividing the value by maxValForOpacity (256).
            /// Set RGB color from random values.
            setState(() {
              final DateTime now = DateTime.now();
              _color = Color.fromRGBO(
                (now.millisecond%dividerR * now.millisecond)%maxValForRGB,
                (now.millisecond%dividerG * now.millisecond)%maxValForRGB,
                (now.millisecond%dividerB * now.millisecond)%maxValForRGB,
                maxValForOpacity,);
            });
          },
          child: QQBody(),
        ),
      ),
    );

  }
}

/// Class that contains the text.
class QQBody extends StatelessWidget {

  /// font size of text
  static const double fontSize = 24;
  /// stroke Size of text
  static const double strokeSize = 5;

  @override
  Widget build(BuildContext context) {
    return Center(
      child:
      Stack(
        children: <Widget>[
          // Stroked text as border.
          Text(
            'Hey there',
            style: TextStyle(
              fontSize: fontSize,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = strokeSize
                ..color = Colors.black,
            ),
          ),
          // Solid text as fill.
          const Text(
            'Hey there',
            style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
            ),
          ),
        ],
      )
      ,
    );
  }
}
