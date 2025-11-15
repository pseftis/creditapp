import '../models/reward_model.dart';
import '../services/rewards_service.dart';

class RewardsRepository {
  final RewardsService _rewardsService;

  RewardsRepository(this._rewardsService);

  Future<List<RewardModel>> getRewards() async {
    try {
      return await _rewardsService.fetchRewards();
    } catch (e) {
      throw Exception('Failed to fetch rewards: $e');
    }
  }

  Future<List<RewardModel>> getRewardsByCategory(String category) async {
    try {
      final allRewards = await _rewardsService.fetchRewards();
      return allRewards.where((r) => r.category == category).toList();
    } catch (e) {
      throw Exception('Failed to fetch rewards by category: $e');
    }
  }

  Future<RewardModel> redeemReward(String rewardId, int points) async {
    try {
      return await _rewardsService.redeemReward(rewardId, points);
    } catch (e) {
      throw Exception('Failed to redeem reward: $e');
    }
  }
}

