import 'package:flutter/material.dart';

class RoundedBottomAppBarShape extends RoundedRectangleBorder {
  RoundedBottomAppBarShape({BorderSide side = BorderSide.none})
      : super(
          side: side,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        );
}