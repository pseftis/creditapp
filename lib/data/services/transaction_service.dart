import '../models/transaction_model.dart';

class TransactionService {
  Future<List<TransactionModel>> fetchTransactions(String? cardId) async {
    await Future.delayed(const Duration(seconds: 1));
    
    final transactions = [
      TransactionModel(
        id: '1',
        cardId: '1',
        merchantName: 'Amazon',
        amount: 2500.0,
        date: DateTime.now().subtract(const Duration(days: 2)),
        type: TransactionType.payment,
        category: 'Shopping',
        rewardsEarned: 125,
        description: 'Online Purchase',
      ),
      TransactionModel(
        id: '2',
        cardId: '1',
        merchantName: 'Swiggy',
        amount: 450.0,
        date: DateTime.now().subtract(const Duration(days: 1)),
        type: TransactionType.payment,
        category: 'Food',
        rewardsEarned: 22,
        description: 'Food Delivery',
      ),
      TransactionModel(
        id: '3',
        cardId: '2',
        merchantName: 'PVR Cinemas',
        amount: 800.0,
        date: DateTime.now().subtract(const Duration(days: 3)),
        type: TransactionType.payment,
        category: 'Entertainment',
        rewardsEarned: 40,
        description: 'Movie Tickets',
      ),
      TransactionModel(
        id: '4',
        cardId: '1',
        merchantName: 'Reward Redemption',
        amount: 500.0,
        date: DateTime.now().subtract(const Duration(days: 5)),
        type: TransactionType.reward,
        category: 'Rewards',
        rewardsEarned: -5000,
        description: 'Amazon Gift Card',
      ),
    ];
    
    if (cardId != null) {
      return transactions.where((t) => t.cardId == cardId).toList();
    }
    
    return transactions;
  }
}

