import '../models/reward_model.dart';

class RewardsService {
  Future<List<RewardModel>> fetchRewards() async {
    await Future.delayed(const Duration(seconds: 1));
    
    return [
      RewardModel(
        id: '1',
        title: 'Amazon Gift Card',
        description: '₹500 Amazon Gift Card',
        category: 'Shopping',
        pointsRequired: 5000,
        imageUrl: '',
        isAvailable: true,
        expiryDate: DateTime.now().add(const Duration(days: 30)),
      ),
      RewardModel(
        id: '2',
        title: 'Swiggy Voucher',
        description: '₹300 Swiggy Food Voucher',
        category: 'Food',
        pointsRequired: 3000,
        imageUrl: '',
        isAvailable: true,
        expiryDate: DateTime.now().add(const Duration(days: 15)),
      ),
      RewardModel(
        id: '3',
        title: 'Movie Tickets',
        description: '2 Movie Tickets at PVR',
        category: 'Entertainment',
        pointsRequired: 2000,
        imageUrl: '',
        isAvailable: true,
        expiryDate: DateTime.now().add(const Duration(days: 20)),
      ),
      RewardModel(
        id: '4',
        title: 'Flight Discount',
        description: '10% off on Flight Bookings',
        category: 'Travel',
        pointsRequired: 8000,
        imageUrl: '',
        isAvailable: true,
        expiryDate: DateTime.now().add(const Duration(days: 45)),
      ),
    ];
  }

  Future<RewardModel> redeemReward(String rewardId, int points) async {
    await Future.delayed(const Duration(seconds: 1));
    final rewards = await fetchRewards();
    final reward = rewards.firstWhere((r) => r.id == rewardId);
    
    if (points < reward.pointsRequired) {
      throw Exception('Insufficient points');
    }
    
    return reward;
  }
}

