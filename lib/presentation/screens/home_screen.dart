import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';
import '../providers/card_provider.dart';
import '../providers/user_provider.dart';
import '../widgets/credit_card_widget.dart';
import '../widgets/quick_action_button.dart';
import '../routes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CardProvider>().loadCards();
      context.read<UserProvider>();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cardProvider = context.watch<CardProvider>();
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => cardProvider.loadCards(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                _buildHeader(userProvider.user),
                const SizedBox(height: 24),
                
                // Credit Card Display
                if (cardProvider.isLoading)
                  const Center(child: CircularProgressIndicator())
                else if (cardProvider.error != null)
                  Center(
                    child: Text(
                      'Error: ${cardProvider.error}',
                      style: const TextStyle(color: AppTheme.errorColor),
                    ),
                  )
                else if (cardProvider.selectedCard != null)
                  CreditCardWidget(card: cardProvider.selectedCard!),
                
                const SizedBox(height: 32),
                
                // Quick Actions
                _buildQuickActions(context),
                const SizedBox(height: 24),
                
                // Rewards Summary
                _buildRewardsSummary(userProvider.user),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(context),
    );
  }

  Widget _buildHeader(user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome back,',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppTheme.textSecondary,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          user?.name ?? 'User',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            QuickActionButton(
              icon: Icons.credit_card,
              label: 'Cards',
              onTap: () => Navigator.pushNamed(context, AppRoutes.cards),
            ),
            QuickActionButton(
              icon: Icons.card_giftcard,
              label: 'Rewards',
              onTap: () => Navigator.pushNamed(context, AppRoutes.rewards),
            ),
            QuickActionButton(
              icon: Icons.history,
              label: 'History',
              onTap: () => Navigator.pushNamed(context, AppRoutes.transactions),
            ),
            QuickActionButton(
              icon: Icons.person,
              label: 'Profile',
              onTap: () => Navigator.pushNamed(context, AppRoutes.profile),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRewardsSummary(user) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Rewards',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppTheme.textSecondary,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                '${user?.totalRewardsPoints ?? 0}',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, AppRoutes.rewards),
            child: const Text('Redeem'),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppTheme.cardColor,
      selectedItemColor: AppTheme.primaryColor,
      unselectedItemColor: AppTheme.textSecondary,
      currentIndex: 0,
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, AppRoutes.home);
            break;
          case 1:
            Navigator.pushNamed(context, AppRoutes.cards);
            break;
          case 2:
            Navigator.pushNamed(context, AppRoutes.rewards);
            break;
          case 3:
            Navigator.pushNamed(context, AppRoutes.profile);
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Cards'),
        BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Rewards'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}

