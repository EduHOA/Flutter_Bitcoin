// repositories/cryptocurrency_repository.dart
import 'dart:developer' as developer;
import '../models/cryptocurrency.dart';
import '../services/coin_market_api.dart';

class CryptocurrencyRepository {
  final CoinMarketAPI _api = CoinMarketAPI();

  Future<List<Cryptocurrency>> getCryptocurrencies(String symbols) async {
    try {
      developer.log('Buscando criptomoedas com símbolos: $symbols');
      
      final data = await _api.fetchCryptocurrencies(symbols);
      final List<Cryptocurrency> cryptos = [];

      if (data == null) {
        throw Exception('Dados não retornados pela API');
      }

      developer.log('Dados recebidos: $data');

      // A API retorna um objeto onde cada chave é o símbolo da moeda
      data.forEach((String symbol, dynamic value) {
        try {
          if (value is Map<String, dynamic>) {
            cryptos.add(Cryptocurrency.fromJson(value));
          } else if (value is List && value.isNotEmpty) {
            // Algumas vezes a API retorna uma lista com um objeto
            final cryptoData = value.first;
            if (cryptoData is Map<String, dynamic>) {
              cryptos.add(Cryptocurrency.fromJson(cryptoData));
            }
          }
        } catch (e) {
          developer.log('Erro ao processar moeda $symbol: $e');
        }
      });

      developer.log('Total de criptomoedas processadas: ${cryptos.length}');
      
      if (cryptos.isEmpty) {
        throw Exception('Nenhuma criptomoeda encontrada para os símbolos informados. Verifique se os símbolos estão corretos.');
      }

      // Ordena as criptomoedas por valor em BRL (do maior para o menor)
      cryptos.sort((a, b) => b.priceBRL.compareTo(a.priceBRL));

      return cryptos;
    } catch (e) {
      developer.log('Erro no repositório: $e');
      rethrow;
    }
  }
}
