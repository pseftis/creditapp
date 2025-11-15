import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';
import '../providers/card_provider.dart';
import '../widgets/credit_card_widget.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CardProvider>().loadCards();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cardProvider = context.watch<CardProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cards'),
      ),
      body: cardProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : cardProvider.error != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error: ${cardProvider.error}',
                        style: const TextStyle(color: AppTheme.errorColor),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => cardProvider.loadCards(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                )
              : cardProvider.cards.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.credit_card_off,
                            size: 64,
                            color: AppTheme.textSecondary,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'No cards added yet',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: () => cardProvider.loadCards(),
                      child: ListView.builder(
                        padding: const EdgeInsets.all(AppConstants.defaultPadding),
                        itemCount: cardProvider.cards.length,
                        itemBuilder: (context, index) {
                          final card = cardProvider.cards[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: GestureDetector(
                              onTap: () {
                                cardProvider.selectCard(card);
                                Navigator.pop(context);
                              },
                              child: CreditCardWidget(card: card),
                            ),
                          );
                        },
                      ),
                    ),
    );
  }
}

