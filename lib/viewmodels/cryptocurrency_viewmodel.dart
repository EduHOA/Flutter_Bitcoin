// viewmodels/cryptocurrency_viewmodel.dart
import 'package:flutter/material.dart';
import '../models/cryptocurrency.dart';
import '../repositories/cryptocurrency_repository.dart';

class CryptocurrencyViewModel extends ChangeNotifier {
  final _repository = CryptocurrencyRepository();

  List<Cryptocurrency> _cryptos = [];
  List<Cryptocurrency> get cryptos => _cryptos;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _error = '';
  String get error => _error;

  Future<void> fetchCryptos(String symbols) async {
    try {
      _error = '';
      _isLoading = true;
      notifyListeners();

      _cryptos = await _repository.getCryptocurrencies(symbols);
      _error = '';
    } catch (e) {
      _error = e.toString();
      _cryptos = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
