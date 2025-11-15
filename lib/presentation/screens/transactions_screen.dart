import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';
import '../../data/services/transaction_service.dart';
import '../../data/models/transaction_model.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final TransactionService _transactionService = TransactionService();
  List<TransactionModel> _transactions = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTransactions();
  }

  Future<void> _loadTransactions() async {
    setState(() => _isLoading = true);
    try {
      final transactions = await _transactionService.fetchTransactions(null);
      setState(() {
        _transactions = transactions;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(symbol: '₹', decimalDigits: 0);
    final dateFormat = DateFormat('MMM dd, yyyy');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Transactions'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _transactions.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.history,
                        size: 64,
                        color: AppTheme.textSecondary,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No transactions yet',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                )
              : RefreshIndicator(
                  onRefresh: _loadTransactions,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(AppConstants.defaultPadding),
                    itemCount: _transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = _transactions[index];
                      final isPayment = transaction.type == TransactionType.payment;
                      final isReward = transaction.type == TransactionType.reward;

                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          leading: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: isReward
                                  ? AppTheme.successColor.withOpacity(0.2)
                                  : AppTheme.primaryColor.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              isReward
                                  ? Icons.card_giftcard
                                  : isPayment
                                      ? Icons.payment
                                      : Icons.replay,
                              color: isReward
                                  ? AppTheme.successColor
                                  : AppTheme.primaryColor,
                            ),
                          ),
                          title: Text(
                            transaction.merchantName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 4),
                              Text(
                                dateFormat.format(transaction.date),
                                style: TextStyle(
                                  color: AppTheme.textSecondary,
                                  fontSize: 12,
                                ),
                              ),
                              if (transaction.description != null) ...[
                                const SizedBox(height: 4),
                                Text(
                                  transaction.description!,
                                  style: TextStyle(
                                    color: AppTheme.textSecondary,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                              if (transaction.rewardsEarned != 0) ...[
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    Icon(
                                      transaction.rewardsEarned > 0
                                          ? Icons.add_circle
                                          : Icons.remove_circle,
                                      size: 14,
                                      color: transaction.rewardsEarned > 0
                                          ? AppTheme.successColor
                                          : AppTheme.errorColor,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${transaction.rewardsEarned > 0 ? '+' : ''}${transaction.rewardsEarned} pts',
                                      style: TextStyle(
                                        color: transaction.rewardsEarned > 0
                                            ? AppTheme.successColor
                                            : AppTheme.errorColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ],
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                isReward
                                    ? '-${currencyFormat.format(transaction.amount)}'
                                    : currencyFormat.format(transaction.amount),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: isReward
                                      ? AppTheme.errorColor
                                      : AppTheme.textPrimary,
                                ),
                              ),
                              Text(
                                transaction.category,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
    );
  }
}

