// services/coin_market_api.dart
import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

class CoinMarketAPI {
  static const String _baseUrl =
      'https://pro-api.coinmarketcap.com/v2/cryptocurrency/quotes/latest';
  static const String _apiKey = 'ffba669c-82b7-4420-8a66-5335d9ac7683';

  Future<Map<String, dynamic>> fetchCryptocurrencies(String symbols) async {
    try {
      // Limpa e formata os símbolos
      final cleanSymbols = symbols
          .split(',')
          .map((s) => s.trim().toUpperCase())
          .where((s) => s.isNotEmpty)
          .join(',');

      if (cleanSymbols.isEmpty) {
        throw Exception('Nenhum símbolo válido fornecido');
      }

      developer.log('Símbolos formatados: $cleanSymbols');

      final url = Uri.parse('$_baseUrl?symbol=$cleanSymbols&convert=BRL');
      developer.log('Fazendo requisição para: $url');

      final response = await http.get(
        url,
        headers: {
          'Accept': 'application/json',
          'X-CMC_PRO_API_KEY': _apiKey,
        },
      );

      developer.log('Status code: ${response.statusCode}');
      developer.log('Resposta: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        // Verifica se há erro na resposta da API
        if (data['status']?['error_code'] != 0) {
          throw Exception(
            data['status']?['error_message'] ?? 'Erro desconhecido da API',
          );
        }

        // Verifica se há dados retornados
        final cryptoData = data['data'];
        if (cryptoData == null || cryptoData.isEmpty) {
          throw Exception('Nenhum dado retornado pela API');
        }

        return cryptoData;
      } else {
        final error = jsonDecode(response.body);
        throw Exception(
          'Erro ${response.statusCode}: ${error['status']?['error_message'] ?? 'Erro desconhecido'}',
        );
      }
    } catch (e) {
      developer.log('Erro ao fazer requisição: $e');
      rethrow;
    }
  }
}