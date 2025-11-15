import 'package:flutter/foundation.dart';
import '../../data/models/reward_model.dart';
import '../../data/repositories/rewards_repository.dart';
import '../../data/services/rewards_service.dart';

class RewardsProvider extends ChangeNotifier {
  final RewardsRepository _repository = RewardsRepository(RewardsService());
  
  List<RewardModel> _rewards = [];
  bool _isLoading = false;
  String? _error;
  String? _selectedCategory;

  List<RewardModel> get rewards => _selectedCategory == null
      ? _rewards
      : _rewards.where((r) => r.category == _selectedCategory).toList();
  
  List<String> get categories {
    final cats = _rewards.map((r) => r.category).toSet().toList();
    return ['All', ...cats];
  }
  
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get selectedCategory => _selectedCategory;

  Future<void> loadRewards() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _rewards = await _repository.getRewards();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void filterByCategory(String? category) {
    _selectedCategory = category == 'All' ? null : category;
    notifyListeners();
  }

  Future<bool> redeemReward(String rewardId, int availablePoints) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _repository.redeemReward(rewardId, availablePoints);
      _error = null;
      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}

