import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/theme/app_theme.dart';
import '../../core/constants/app_constants.dart';
import '../providers/rewards_provider.dart';
import '../providers/user_provider.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({super.key});

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RewardsProvider>().loadRewards();
    });
  }

  @override
  Widget build(BuildContext context) {
    final rewardsProvider = context.watch<RewardsProvider>();
    final userProvider = context.watch<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
      ),
      body: Column(
        children: [
          // Points Summary
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(AppConstants.defaultPadding),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppTheme.primaryColor, AppTheme.primaryColor.withOpacity(0.7)],
              ),
              borderRadius: BorderRadius.circular(AppConstants.defaultBorderRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Available Points',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${userProvider.user?.totalRewardsPoints ?? 0}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.stars,
                  color: Colors.white,
                  size: 48,
                ),
              ],
            ),
          ),

          // Category Filter
          if (rewardsProvider.categories.isNotEmpty)
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppConstants.defaultPadding),
                itemCount: rewardsProvider.categories.length,
                itemBuilder: (context, index) {
                  final category = rewardsProvider.categories[index];
                  final isSelected = rewardsProvider.selectedCategory == null
                      ? category == 'All'
                      : category == rewardsProvider.selectedCategory;
                  
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      label: Text(category),
                      selected: isSelected,
                      onSelected: (_) => rewardsProvider.filterByCategory(category),
                      selectedColor: AppTheme.primaryColor,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.black : AppTheme.textPrimary,
                      ),
                    ),
                  );
                },
              ),
            ),

          const SizedBox(height: 16),

          // Rewards List
          Expanded(
            child: rewardsProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : rewardsProvider.error != null
                    ? Center(
                        child: Text(
                          'Error: ${rewardsProvider.error}',
                          style: const TextStyle(color: AppTheme.errorColor),
                        ),
                      )
                    : rewardsProvider.rewards.isEmpty
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.card_giftcard,
                                  size: 64,
                                  color: AppTheme.textSecondary,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No rewards available',
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppConstants.defaultPadding,
                            ),
                            itemCount: rewardsProvider.rewards.length,
                            itemBuilder: (context, index) {
                              final reward = rewardsProvider.rewards[index];
                              final canRedeem = (userProvider.user?.totalRewardsPoints ?? 0) >=
                                  reward.pointsRequired;

                              return Card(
                                margin: const EdgeInsets.only(bottom: 12),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.all(16),
                                  leading: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: AppTheme.primaryColor.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Icon(
                                      Icons.card_giftcard,
                                      color: AppTheme.primaryColor,
                                    ),
                                  ),
                                  title: Text(
                                    reward.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 4),
                                      Text(reward.description),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.stars,
                                            size: 16,
                                            color: AppTheme.primaryColor,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            '${reward.pointsRequired} points',
                                            style: TextStyle(
                                              color: AppTheme.primaryColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  trailing: ElevatedButton(
                                    onPressed: canRedeem && reward.isAvailable
                                        ? () => _showRedeemDialog(
                                              context,
                                              reward,
                                              userProvider.user?.totalRewardsPoints ?? 0,
                                            )
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: canRedeem
                                          ? AppTheme.primaryColor
                                          : AppTheme.textSecondary,
                                    ),
                                    child: const Text('Redeem'),
                                  ),
                                ),
                              );
                            },
                          ),
          ),
        ],
      ),
    );
  }

  void _showRedeemDialog(
    BuildContext context,
    reward,
    int availablePoints,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Redeem Reward'),
        content: Text(
          'Are you sure you want to redeem "${reward.title}" for ${reward.pointsRequired} points?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              final rewardsProvider = context.read<RewardsProvider>();
              final userProvider = context.read<UserProvider>();
              
              final success = await rewardsProvider.redeemReward(
                reward.id,
                availablePoints,
              );
              
              if (success && mounted) {
                userProvider.updateRewardsPoints(
                  (availablePoints - reward.pointsRequired).toInt(),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Reward redeemed successfully!'),
                    backgroundColor: AppTheme.successColor,
                  ),
                );
              } else if (mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(rewardsProvider.error ?? 'Failed to redeem reward'),
                    backgroundColor: AppTheme.errorColor,
                  ),
                );
              }
            },
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
  }
}

