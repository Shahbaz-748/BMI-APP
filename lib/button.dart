import 'package:flutter/material.dart';



class ButtonRound extends StatelessWidget {
  ButtonRound(this.opicon,this.onPressed);
  final IconData opicon;
  final Function onPressed;


  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(
        minHeight: 60.0,
        minWidth: 60.0,
      ),
      elevation: 5.0,
      focusElevation: 10.0,
      focusColor: Color(0xFF0A0F33),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
      fillColor: Color(0xFF222747),
      child: Icon(
        opicon,
        size:35.0,
        color: Colors.white,

      ),
      onPressed: onPressed,
    );
  }
}
