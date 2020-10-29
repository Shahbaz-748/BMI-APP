
import 'package:flutter/material.dart';


class ReusableCard extends StatelessWidget {

  final Color colour;
  final Widget wid;
  ReusableCard( this.colour, this.wid);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: wid,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.all(
            Radius.circular(10)
        ),
      ),
    );
  }
}
