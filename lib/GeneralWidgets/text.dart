import 'package:flutter/widgets.dart';

class text extends StatelessWidget {
  const text(this.text_,this.color,{required this.fontSize});
  final String text_;
  final double fontSize;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text_,style: TextStyle(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize
    ),
    );
  }
}
