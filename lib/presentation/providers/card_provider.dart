import 'package:flutter/foundation.dart';
import '../../data/models/card_model.dart';
import '../../data/repositories/card_repository.dart';
import '../../data/services/card_service.dart';

class CardProvider extends ChangeNotifier {
  final CardRepository _repository = CardRepository(CardService());
  
  List<CardModel> _cards = [];
  CardModel? _selectedCard;
  bool _isLoading = false;
  String? _error;

  List<CardModel> get cards => _cards;
  CardModel? get selectedCard => _selectedCard;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadCards() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _cards = await _repository.getCards();
      if (_cards.isNotEmpty && _selectedCard == null) {
        _selectedCard = _cards.first;
      }
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void selectCard(CardModel card) {
    _selectedCard = card;
    notifyListeners();
  }

  Future<void> addCard(CardModel card) async {
    _isLoading = true;
    notifyListeners();

    try {
      final newCard = await _repository.addCard(card);
      _cards.add(newCard);
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteCard(String id) async {
    _isLoading = true;
    notifyListeners();

    try {
      await _repository.deleteCard(id);
      _cards.removeWhere((card) => card.id == id);
      if (_selectedCard?.id == id) {
        _selectedCard = _cards.isNotEmpty ? _cards.first : null;
      }
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

