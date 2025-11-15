import '../models/card_model.dart';

class CardService {
  // Mock data - In production, this would make HTTP requests
  Future<List<CardModel>> fetchCards() async {
    // Simulate network delay
    await Future.delayed(const Duration(seconds: 1));
    
    return [
      CardModel(
        id: '1',
        bankName: 'HDFC Bank',
        cardNumber: '4532 1234 5678 9010',
        cardHolderName: 'John Doe',
        expiryDate: '12/25',
        balance: 45000.0,
        creditLimit: 100000.0,
        cardType: 'Platinum',
        cardColor: '#00D9FF',
        rewardsPoints: 1250,
      ),
      CardModel(
        id: '2',
        bankName: 'ICICI Bank',
        cardNumber: '5123 4567 8901 2345',
        cardHolderName: 'John Doe',
        expiryDate: '08/26',
        balance: 25000.0,
        creditLimit: 75000.0,
        cardType: 'Gold',
        cardColor: '#FFD700',
        rewardsPoints: 850,
      ),
      CardModel(
        id: '3',
        bankName: 'Axis Bank',
        cardNumber: '3789 1234 5678 9012',
        cardHolderName: 'John Doe',
        expiryDate: '03/27',
        balance: 15000.0,
        creditLimit: 50000.0,
        cardType: 'Classic',
        cardColor: '#FF6B6B',
        rewardsPoints: 450,
      ),
    ];
  }

  Future<CardModel> fetchCardById(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final cards = await fetchCards();
    return cards.firstWhere((card) => card.id == id);
  }

  Future<CardModel> createCard(CardModel card) async {
    await Future.delayed(const Duration(seconds: 1));
    return card;
  }

  Future<void> deleteCard(String id) async {
    await Future.delayed(const Duration(milliseconds: 500));
  }
}

