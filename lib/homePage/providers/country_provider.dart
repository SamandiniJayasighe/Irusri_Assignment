import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:irusri_se_assignment/homePage/apiClient/client.dart';
import 'package:irusri_se_assignment/homePage/models/country.dart';

class CountryProvider with ChangeNotifier {
  List<Country> _countries = [];
  List<Country> _filteredCountries = [];
  bool _loading = false;
  String _error = '';
  late ApiClient _apiClient;
  

  List<Country> get countries => _countries;
  bool get loading => _loading;
  String get error => _error;
  List<Country> get filteredCountries => _filteredCountries;

  CountryProvider() {
    final dio = Dio();
    _apiClient = ApiClient(dio);
  }

  void errorHandler(DioException e) {
    if (e.response != null) {
      switch (e.response?.statusCode) {
        case 404:
          _error = 'Resource not found';
          break;
        case 401:
          _error = 'Unauthorized';
          break;
        case 500:
          _error = 'Internal server error';
          break;
        case 503:
          _error = 'Service unavailable';
          break;
        case 504:
          _error = 'Gateway timeout';
          break;
        default:
          _error = 'Something went wrong';
      }
    } else {
      _error = 'Something went wrong';
    }
  }

  void fetchCountries() async {
    _loading = true;
    _error = '';
    notifyListeners();
    try {
      _countries = await _apiClient.getCountries('europe');
      
      _filteredCountries = _countries;
      orderByName();//initial sort by name 
    } catch (e) {
      if (e is DioException) {
        errorHandler(e);
      } else {
        _error = 'Something went wrong';
      }
    }
    _loading = false;
    notifyListeners();
  }

  void filterCountries(String query) {
    if (query.isNotEmpty) {
      _filteredCountries = _countries
          .where((country) =>
              country.commonName
                  .toLowerCase()
                  .contains(query.toLowerCase()) ||
              country.officialName
                  .toLowerCase()
                  .contains(query.toLowerCase()))
          .toList();
    } else {
      _filteredCountries = _countries;
    }
    notifyListeners();
  }

  void orderByPopulation({bool ascending =true}) {
    if (ascending) {
      _filteredCountries.sort((a, b) => a.population.compareTo(b.population));
    } else {
      _filteredCountries.sort((a, b) => b.population.compareTo(a.population));
    }
    notifyListeners();
  }

  void orderByName({bool ascending =true}) {
    if (ascending) {
      _filteredCountries.sort((a, b) => a.commonName.compareTo(b.commonName));
    } else {
      _filteredCountries.sort((a, b) => b.commonName.compareTo(a.commonName));
    }
    notifyListeners();
  }

  void orderByCapital({bool ascending =true}) {
    if (ascending) {
      _filteredCountries.sort((a, b) => a.capital[0].compareTo(b.capital[0]));
    } else {
      _filteredCountries.sort((a, b) => b.capital[0].compareTo(a.capital[0]));
    }
    notifyListeners();
  }

}
