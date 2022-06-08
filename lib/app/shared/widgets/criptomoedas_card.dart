import 'package:flutter/material.dart';
import '../constants.dart';

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
        title: Row(
          children: [
            Text(
              "${widget.moeda} - ",
              style: TextStyle(
                color: Constants.blue,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: Constants.blue,
                borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              ),
              child: Text(
                widget.symbol,
                style: TextStyle(
                  fontSize: 14,
                  color: Constants.white,
                ),
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isPressed
                ? const SizedBox(
                    height: 5,
                  )
                : Container(),
            Row(
              children: [
                Text(
                  "Cotação: ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Constants.blue,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "BRL ${widget.cotation}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Constants.blue,
                  ),
                ),
              ],
            ),
            isPressed
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            "Taxa: ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Constants.blue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "BRL ${widget.fee}",
                            style: TextStyle(
                              fontSize: 14,
                              color: Constants.blue,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: 14,
                          color: Constants.blue,
                        ),
                      ),
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
