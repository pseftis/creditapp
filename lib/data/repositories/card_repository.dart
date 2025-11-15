import '../models/card_model.dart';
import '../services/card_service.dart';

class CardRepository {
  final CardService _cardService;

  CardRepository(this._cardService);

  Future<List<CardModel>> getCards() async {
    try {
      return await _cardService.fetchCards();
    } catch (e) {
      throw Exception('Failed to fetch cards: $e');
    }
  }

  Future<CardModel> getCardById(String id) async {
    try {
      return await _cardService.fetchCardById(id);
    } catch (e) {
      throw Exception('Failed to fetch card: $e');
    }
  }

  Future<CardModel> addCard(CardModel card) async {
    try {
      return await _cardService.createCard(card);
    } catch (e) {
      throw Exception('Failed to add card: $e');
    }
  }

  Future<void> deleteCard(String id) async {
    try {
      await _cardService.deleteCard(id);
    } catch (e) {
      throw Exception('Failed to delete card: $e');
    }
  }
}

