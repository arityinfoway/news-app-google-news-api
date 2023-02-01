import 'package:flutter/material.dart';

void nextScreenReplace(context, page) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => page));
}
