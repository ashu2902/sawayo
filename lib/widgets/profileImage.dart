import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({required this.text, Key? key}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    var ht = MediaQuery.of(context).size.height;
    var wd = MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.amber,
      width: wd / 5,
      height: wd / 5,
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
        ),
      ),
      // height: ht / 8,
    );
  }
}
