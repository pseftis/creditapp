import 'package:equatable/equatable.dart';

class CardModel extends Equatable {
  final String id;
  final String bankName;
  final String cardNumber;
  final String cardHolderName;
  final String expiryDate;
  final double balance;
  final double creditLimit;
  final String cardType;
  final String cardColor;
  final int rewardsPoints;

  const CardModel({
    required this.id,
    required this.bankName,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiryDate,
    required this.balance,
    required this.creditLimit,
    required this.cardType,
    required this.cardColor,
    required this.rewardsPoints,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      id: json['id'] as String,
      bankName: json['bankName'] as String,
      cardNumber: json['cardNumber'] as String,
      cardHolderName: json['cardHolderName'] as String,
      expiryDate: json['expiryDate'] as String,
      balance: (json['balance'] as num).toDouble(),
      creditLimit: (json['creditLimit'] as num).toDouble(),
      cardType: json['cardType'] as String,
      cardColor: json['cardColor'] as String,
      rewardsPoints: json['rewardsPoints'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bankName': bankName,
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'expiryDate': expiryDate,
      'balance': balance,
      'creditLimit': creditLimit,
      'cardType': cardType,
      'cardColor': cardColor,
      'rewardsPoints': rewardsPoints,
    };
  }

  CardModel copyWith({
    String? id,
    String? bankName,
    String? cardNumber,
    String? cardHolderName,
    String? expiryDate,
    double? balance,
    double? creditLimit,
    String? cardType,
    String? cardColor,
    int? rewardsPoints,
  }) {
    return CardModel(
      id: id ?? this.id,
      bankName: bankName ?? this.bankName,
      cardNumber: cardNumber ?? this.cardNumber,
      cardHolderName: cardHolderName ?? this.cardHolderName,
      expiryDate: expiryDate ?? this.expiryDate,
      balance: balance ?? this.balance,
      creditLimit: creditLimit ?? this.creditLimit,
      cardType: cardType ?? this.cardType,
      cardColor: cardColor ?? this.cardColor,
      rewardsPoints: rewardsPoints ?? this.rewardsPoints,
    );
  }

  @override
  List<Object?> get props => [
        id,
        bankName,
        cardNumber,
        cardHolderName,
        expiryDate,
        balance,
        creditLimit,
        cardType,
        cardColor,
        rewardsPoints,
      ];
}

