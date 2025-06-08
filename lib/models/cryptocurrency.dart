// models/cryptocurrency.dart
import 'dart:developer' as developer;

class Cryptocurrency {
  final String name;
  final String symbol;
  final String dateAdded;
  final double priceUSD;
  final double priceBRL;

  Cryptocurrency({
    required this.name,
    required this.symbol,
    required this.dateAdded,
    required this.priceUSD,
    required this.priceBRL,
  });

  factory Cryptocurrency.fromJson(Map<String, dynamic> json) {
    try {
      developer.log('Processando JSON para Cryptocurrency: $json');
      
      final quote = json['quote'];
      if (quote == null) {
        throw Exception('Dados de cotação não encontrados');
      }

      final brl = quote['BRL'];
      if (brl == null) {
        throw Exception('Cotação em BRL não encontrada');
      }

      final priceBRL = _parsePrice(brl['price']);
      if (priceBRL <= 0) {
        throw Exception('Preço em BRL inválido');
      }

      // Taxa de câmbio aproximada BRL/USD
      const taxaCambio = 5.0;
      final priceUSD = priceBRL / taxaCambio;

      final name = json['name'];
      final symbol = json['symbol'];
      if (name == null || symbol == null) {
        throw Exception('Nome ou símbolo da moeda não encontrado');
      }

      final crypto = Cryptocurrency(
        name: name,
        symbol: symbol,
        dateAdded: json['date_added'] ?? DateTime.now().toIso8601String(),
        priceUSD: priceUSD,
        priceBRL: priceBRL,
      );

      developer.log('Cryptocurrency processada com sucesso: $crypto');
      return crypto;
    } catch (e) {
      developer.log('Erro ao processar Cryptocurrency do JSON: $e');
      rethrow;
    }
  }

  static double _parsePrice(dynamic price) {
    if (price == null) return 0.0;
    if (price is num) return price.toDouble();
    if (price is String) {
      final parsed = double.tryParse(price);
      if (parsed != null) return parsed;
    }
    throw Exception('Formato de preço inválido: $price');
  }

  @override
  String toString() {
    return 'Cryptocurrency{name: $name, symbol: $symbol, priceUSD: $priceUSD, priceBRL: $priceBRL}';
  }
}