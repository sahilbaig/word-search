import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PointerLocation extends Notifier<Offset> {
  @override
  Offset build() {
    return Offset(0, 0);
  }

  void updateLocation(Offset location) {
    state = location;
  }

  Offset getCurrentLocation() {
    return state;
  }
}

final pointerProvider =
    NotifierProvider<PointerLocation, Offset>(PointerLocation.new);
