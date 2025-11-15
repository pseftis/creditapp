import 'package:flutter/foundation.dart';
import '../../data/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  bool _isLoading = false;

  UserModel? get user => _user;
  bool get isLoading => _isLoading;

  UserProvider() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    _isLoading = true;
    notifyListeners();

    // Simulate loading user data
    await Future.delayed(const Duration(seconds: 1));
    
    _user = UserModel(
      id: '1',
      name: 'John Doe',
      email: 'john.doe@example.com',
      phoneNumber: '+91 98765 43210',
      totalRewardsPoints: 12500,
      memberSince: DateTime(2023, 1, 15),
    );

    _isLoading = false;
    notifyListeners();
  }

  Future<void> updateUser(UserModel updatedUser) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));
    _user = updatedUser;

    _isLoading = false;
    notifyListeners();
  }

  void updateRewardsPoints(int points) {
    if (_user != null) {
      _user = _user!.copyWith(totalRewardsPoints: points);
      notifyListeners();
    }
  }
}

