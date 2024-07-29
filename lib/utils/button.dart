import 'package:flutter/material.dart';

void handleButtonPressToTrue(State state, bool isPressed) {
  state.setState(() {
    isPressed = true;
  });
}

void handleButtonPressToFalse(State state, bool isPressed) {
  state.setState(() {
    isPressed = false;
  });
}