import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:teste_coins/app/shared/constants.dart';
import '../models/criptomoedas_model.dart';
import '../models/user_model.dart';
import '../services/criptomoedas_service.dart';
import '../shared/criptomoedas_card.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CriptomoedasService>(builder: (context, model, child) {
      return FutureBuilder<UserModel>(
          future: model.getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              UserModel userModel = snapshot.data!;
              return Scaffold(
                backgroundColor: Constants.backgroundColor,
                appBar: AppBar(
                  title: Text("${userModel.walletId}"),
                ),
                body: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "${userModel.message}",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    FutureBuilder<http.Response>(
                        future: http.get(
                          Uri.parse(
                              'https://economia.awesomeapi.com.br/last/USD-BRL'),
                          headers: {
                            "Content-Type": "application/json",
                          },
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            http.Response response = snapshot.data!;
                            var json = jsonDecode(response.body);
                            var f = NumberFormat("##0.00", "pt_BR");
                            double usdToBrl =
                                double.parse(json['USDBRL']['bid']);

                            return Expanded(
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: userModel.data!.length,
                                  itemBuilder: (_, index) {
                                    CriptomoedasModel data =
                                        userModel.data![index];
                                    double cotation =
                                        double.parse(data.cotation!);

                                    return CriptoMoedasCard(
                                      moeda: data.currencyName!,
                                      imageUrl: data.imageUrl!,
                                      cotation: f.format(
                                        cotation * usdToBrl,
                                      ),
                                      symbol: data.symbol!,
                                      fee: f.format(
                                        data.fee! * usdToBrl,
                                      ),
                                      description: data.about!,
                                    );
                                  }),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                  ],
                )),
              );
            } else {
              return Container();
            }
          });
    });
  }
}
