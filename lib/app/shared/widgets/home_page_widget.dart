import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:teste_coins/app/models/user_model.dart';
import 'package:teste_coins/app/shared/widgets/shimmer_card.dart';

import '../../models/criptomoedas_model.dart';

import '../constants.dart';
import 'criptomoedas_card.dart';

class HomePageWidget extends StatefulWidget {
  final UserModel userModel;
  final NumberFormat? f;
  final double? usdToBrl;
  final double? userBalance;
  const HomePageWidget({
    Key? key,
    required this.userModel,
    this.f,
    this.usdToBrl,
    this.userBalance,
  }) : super(key: key);

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Carteira: ",
                style: TextStyle(
                  fontSize: 18,
                  color: Constants.blue,
                ),
              ),
            ),
            Text(
              widget.userModel.walletId!,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Constants.blue,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Saldo: ",
                style: TextStyle(
                  fontSize: 18,
                  color: Constants.blue,
                ),
              ),
            ),
            widget.usdToBrl != null
                ? Text(
                    "BRL ${widget.f!.format(
                      widget.userBalance! * widget.usdToBrl!,
                    )}",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Constants.blue,
                    ),
                  )
                : Shimmer.fromColors(
                    highlightColor: Constants.grey,
                    baseColor: Constants.lightGrey,
                    child: Text(
                      "...",
                      style: TextStyle(color: Constants.grey),
                    ),
                  ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Text(
          "${widget.userModel.message}",
          style: TextStyle(
            color: Constants.blue,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.userModel.data!.length,
              itemBuilder: (_, index) {
                if (widget.usdToBrl != null) {
                  CriptomoedasModel data = widget.userModel.data![index];
                  double cotation = double.parse(data.cotation!);

                  return CriptoMoedasCard(
                    moeda: data.currencyName!,
                    imageUrl: data.imageUrl!,
                    cotation: widget.f!.format(
                      cotation * widget.usdToBrl!,
                    ),
                    symbol: data.symbol!,
                    fee: widget.f!.format(
                      data.fee! * widget.usdToBrl!,
                    ),
                    description: data.about!,
                  );
                } else {
                  return const ShimmerCard();
                }
              }),
        ),
      ],
    );
  }
}
