class CriptomoedasModel {
  final String? currencyName;
  final String? cotation;
  final String? symbol;
  final String? imageUrl;
  final String? about;
  final double? fee;

  CriptomoedasModel(
      {this.currencyName,
      this.cotation,
      this.symbol,
      this.imageUrl,
      this.about,
      this.fee});

  CriptomoedasModel.fromJson(Map<String, dynamic> json)
      : currencyName = json["currency_name"],
        cotation = json["cotation"],
        symbol = json["symbol"],
        imageUrl = json['image_url'],
        about = json["details"]['about'],
        fee = json["details"]['fee'];
}
