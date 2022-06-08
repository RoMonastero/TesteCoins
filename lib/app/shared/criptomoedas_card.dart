import 'package:flutter/material.dart';

import 'constants.dart';

class CriptoMoedasCard extends StatefulWidget {
  final String moeda;
  final String imageUrl;
  final String cotation;
  final String symbol;
  final String fee;
  final String description;
  const CriptoMoedasCard(
      {Key? key,
      required this.moeda,
      required this.imageUrl,
      required this.cotation,
      required this.symbol,
      required this.fee,
      required this.description})
      : super(key: key);

  @override
  State<CriptoMoedasCard> createState() => _CriptoMoedasCardState();
}

class _CriptoMoedasCardState extends State<CriptoMoedasCard> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      shadowColor: Constants.black,
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
      child: ListTile(
        onTap: () {
          setState(() {
            isPressed = !isPressed;
          });
        },
        title: Text(
          "${widget.moeda} - ${widget.symbol}",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Cotação: BRL ${widget.cotation}",
              style: TextStyle(
                fontSize: 14,
                color: Constants.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            isPressed
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Taxa: BRL ${widget.fee}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Constants.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Descrição: ${widget.description}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Constants.black,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  )
                : Container()
          ],
        ),
        leading: Image.network(widget.imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}
