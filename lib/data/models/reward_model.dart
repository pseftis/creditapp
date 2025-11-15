import 'package:equatable/equatable.dart';

class RewardModel extends Equatable {
  final String id;
  final String title;
  final String description;
  final String category;
  final int pointsRequired;
  final String imageUrl;
  final bool isAvailable;
  final DateTime expiryDate;

  const RewardModel({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.pointsRequired,
    required this.imageUrl,
    required this.isAvailable,
    required this.expiryDate,
  });

  factory RewardModel.fromJson(Map<String, dynamic> json) {
    return RewardModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      pointsRequired: json['pointsRequired'] as int,
      imageUrl: json['imageUrl'] as String,
      isAvailable: json['isAvailable'] as bool,
      expiryDate: DateTime.parse(json['expiryDate'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'pointsRequired': pointsRequired,
      'imageUrl': imageUrl,
      'isAvailable': isAvailable,
      'expiryDate': expiryDate.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        category,
        pointsRequired,
        imageUrl,
        isAvailable,
        expiryDate,
      ];
}

