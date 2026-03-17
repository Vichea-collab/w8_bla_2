import 'package:flutter/material.dart';
import 'main_dev.dart';

export 'main_common.dart' show BlaBlaApp, createApp;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  mainDev();
}
