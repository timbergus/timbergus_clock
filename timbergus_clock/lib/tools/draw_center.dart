import 'package:flutter/material.dart';

class DrawCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Container(
          width: 20,
          height: 20,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.fill,
              image: new AssetImage('assets/google.png'),
            ),
          ),
        ),
      ),
    );
  }
}
