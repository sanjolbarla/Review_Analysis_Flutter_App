import 'package:flutter/material.dart';

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(Icons.rate_review, color: Colors.black),
  hintText: 'Enter the review here',
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //borderSide: BorderSide.none,
  ),
);

const kBackgroundColor = BoxDecoration(
    gradient: LinearGradient(
      colors: [const Color(0xFF3E5158), const Color(0xFF5386B2)],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      tileMode: TileMode.repeated,
    )
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: Color(0xFF3E5158),
);