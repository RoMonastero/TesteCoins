import 'package:flutter/material.dart';
import 'package:teste_coins/app/models/user_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class CriptomoedasService extends ChangeNotifier {
  Future<UserModel> getUser() async {
    final String response = await rootBundle.loadString('criptomoedas.json');
    var json = jsonDecode(response);
    return UserModel.fromJson(json);
  }
}
