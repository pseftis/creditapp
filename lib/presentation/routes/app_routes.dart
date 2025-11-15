import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/cards_screen.dart';
import '../screens/rewards_screen.dart';
import '../screens/transactions_screen.dart';
import '../screens/profile_screen.dart';

class AppRoutes {
  static const String home = '/';
  static const String cards = '/cards';
  static const String rewards = '/rewards';
  static const String transactions = '/transactions';
  static const String profile = '/profile';

  static Map<String, WidgetBuilder> get routes => {
        home: (context) => const HomeScreen(),
        cards: (context) => const CardsScreen(),
        rewards: (context) => const RewardsScreen(),
        transactions: (context) => const TransactionsScreen(),
        profile: (context) => const ProfileScreen(),
      };
}

