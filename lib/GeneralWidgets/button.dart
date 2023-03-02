
import 'package:flutter/material.dart';
import 'package:xo_game/GeneralWidgets/text.dart';

import '../constants.dart';
class Button extends StatelessWidget {
  const Button( this.text_);
 final String text_;
  @override
  Widget build(BuildContext context) {
    return    Container(
      alignment: Alignment.center,
      width: 145,
      height: 73,
      decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadius.horizontal(left: Radius.circular(35)
              ,right:Radius.circular(35))
      ),
      child: text(text_, Colors.white, fontSize: 30),
    );
  }
}
