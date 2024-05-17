import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  AppBarButton({
    this.icon = CupertinoIcons.back,
    required this.onTap,
    super.key,
  });
  final IconData icon;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
        child: Container(
          width: 37,
          height: 37,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 10.0,
                spreadRadius: 1.0,
                offset: Offset(0.0, 4.0),
              ),
            ],
          ),
          child: Icon(icon),
        ),
      ),
    );
  }
}
