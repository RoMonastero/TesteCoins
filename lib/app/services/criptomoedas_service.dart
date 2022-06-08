import 'package:flutter/material.dart';
import 'package:teste_coins/app/models/user_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'dart:convert';

class CriptomoedasService extends ChangeNotifier {
  Future<UserModel> getUser() async {
    final String response =
        await rootBundle.loadString('assets/criptomoedas.json');
    var json = jsonDecode(response);
    return UserModel.fromJson(json);
  }

  Future<http.Response> getUsdBrl() async {
    return await http.get(
      Uri.parse('https://economia.awesomeapi.com.br/last/USD-BRL'),
      headers: {
        "Content-Type": "application/json",
      },
    );
  }
}
