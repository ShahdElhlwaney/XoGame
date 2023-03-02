
import 'package:flutter/material.dart';

import '../../constants.dart';

class textFormField extends StatelessWidget {
  const textFormField({required this.onChanched,required this.namePlayer,required this.validator});
 final Function(String) onChanched;
  final String? Function(String?) validator;

  final String namePlayer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 290,
      child: TextFormField(

        validator: validator,
        onChanged: onChanched,
        decoration:  InputDecoration(

         focusedBorder:OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.5, color: mainColor),
            borderRadius: BorderRadius.circular(20)
          ),
          hintText:namePlayer ,
          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
          width: 1.5,color: mainColor)
      )
        )
      ),
    );
  }
}
