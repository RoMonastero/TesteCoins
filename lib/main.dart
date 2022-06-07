import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app/app_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  runApp(const AppWidget());
}
