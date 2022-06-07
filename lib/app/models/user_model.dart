import 'criptomoedas_model.dart';

class UserModel {
  final String? message;
  final String? walletId;
  final String? userBalance;
  final List? data;

  UserModel({this.message, this.userBalance, this.walletId, this.data});

  UserModel.fromJson(Map<String, dynamic> json)
      : message = json["message"],
        userBalance = json["user_balance"],
        walletId = json["wallet_id"],
        data = json['data'].map((e) => CriptomoedasModel.fromJson(e)).toList();
}
