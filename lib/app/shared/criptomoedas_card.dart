import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class CriptoMoedasCard extends StatefulWidget {
  final String moeda;
  final String imageUrl;
  final String cotation;
  const CriptoMoedasCard(
      {Key? key,
      required this.moeda,
      required this.imageUrl,
      required this.cotation})
      : super(key: key);

  @override
  State<CriptoMoedasCard> createState() => _CriptoMoedasCardState();
}

class _CriptoMoedasCardState extends State<CriptoMoedasCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      //shadowColor: Constants.limeBlack,
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      child: ListTile(
        onTap: () {},
        title: Text(
          widget.moeda,
          style: const TextStyle(
            fontSize: 16,
            //color: Constants.limeGreen,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: FutureBuilder<http.Response>(
            future: http.get(
              Uri.parse('https://economia.awesomeapi.com.br/last/USD-BRL'),
              headers: {
                "Content-Type": "application/json",
              },
            ),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                http.Response response = snapshot.data!;
                var json = jsonDecode(response.body);
                var f = NumberFormat("###.00", "pt_BR");
                double usdToBrl = double.parse(json['USDBRL']['bid']);
                double cotation = double.parse(widget.cotation);
                return Text(
                  "Cotação: BRL ${f.format(cotation * usdToBrl)}",
                  style: const TextStyle(
                    fontSize: 14,
                    // color: Constants.limeBlack,
                    fontWeight: FontWeight.w700,
                  ),
                );
              } else {
                return const Text(
                  "Cotação: ...",
                  style: TextStyle(
                    fontSize: 14,
                    // color: Constants.limeBlack,
                    fontWeight: FontWeight.w700,
                  ),
                );
              }
            }),
        leading: Image.network(widget.imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
