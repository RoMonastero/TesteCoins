import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:teste_coins/app/shared/constants.dart';
import '../models/user_model.dart';
import '../services/criptomoedas_service.dart';
import 'package:http/http.dart' as http;

import '../shared/widgets/home_page_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<CriptomoedasService>(builder: (context, model, child) {
      return FutureBuilder<UserModel>(
          future: model.getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserModel userModel = snapshot.data!;
              return Scaffold(
                backgroundColor: Constants.backgroundColor,
                body: Container(
                  padding: EdgeInsets.only(top: size.height * 0.07),
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                      child: FutureBuilder<http.Response>(
                          future: model.getUsdBrl(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData &&
                                snapshot.data!.statusCode == 200) {
                              http.Response response = snapshot.data!;
                              var json = jsonDecode(response.body);

                              NumberFormat f = NumberFormat("##0.00", "pt_BR");

                              double usdToBrl =
                                  double.parse(json['USDBRL']['bid']);

                              double userBalance =
                                  double.parse(userModel.userBalance!);

                              return HomePageWidget(
                                userModel: userModel,
                                f: f,
                                usdToBrl: usdToBrl,
                                userBalance: userBalance,
                              );
                            } else {
                              return HomePageWidget(
                                userModel: userModel,
                              );
                            }
                          })),
                ),
              );
            } else {
              return Container();
            }
          });
    });
  }
}
