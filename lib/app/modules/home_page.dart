import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/criptomoedas_model.dart';
import '../models/user_model.dart';
import '../services/criptomoedas_service.dart';
import '../shared/criptomoedas_card.dart';

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
                    Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: userModel.data!.length,
                          itemBuilder: (_, index) {
                            CriptomoedasModel data = userModel.data![index];

                            return CriptoMoedasCard(
                              moeda: data.currencyName!,
                              imageUrl: data.imageUrl!,
                              cotation: data.cotation!,
                            );
                          }),
                    ),
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
