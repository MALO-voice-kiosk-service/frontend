import 'package:flutter/material.dart';

void handleButtonPress(State state, bool isPressed) {
  state.setState(() {
    isPressed = !isPressed;
  });
}