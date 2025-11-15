import 'package:equatable/equatable.dart';

enum TransactionType { payment, reward, refund }

class TransactionModel extends Equatable {
  final String id;
  final String cardId;
  final String merchantName;
  final double amount;
  final DateTime date;
  final TransactionType type;
  final String category;
  final int rewardsEarned;
  final String? description;

  const TransactionModel({
    required this.id,
    required this.cardId,
    required this.merchantName,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
    required this.rewardsEarned,
    this.description,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json['id'] as String,
      cardId: json['cardId'] as String,
      merchantName: json['merchantName'] as String,
      amount: (json['amount'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
      type: TransactionType.values.firstWhere(
        (e) => e.toString().split('.').last == json['type'],
      ),
      category: json['category'] as String,
      rewardsEarned: json['rewardsEarned'] as int,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cardId': cardId,
      'merchantName': merchantName,
      'amount': amount,
      'date': date.toIso8601String(),
      'type': type.toString().split('.').last,
      'category': category,
      'rewardsEarned': rewardsEarned,
      'description': description,
    };
  }

  @override
  List<Object?> get props => [
        id,
        cardId,
        merchantName,
        amount,
        date,
        type,
        category,
        rewardsEarned,
        description,
      ];
}

