import 'dart:convert';

import 'package:marketwick_assignment/domain/entity/currency/currency.dart';
import 'package:marketwick_assignment/domain/entity/history_position.dart';
import 'package:mobx/mobx.dart';

part 'portfolio_history_store.g.dart';

class PortfolioHistoryStore = _PortfolioHistoryStore
    with _$PortfolioHistoryStore;

abstract class _PortfolioHistoryStore with Store {
  _PortfolioHistoryStore();

  @observable
  int selectedBottomNavigation = 0;

  @observable
  DateTime selectedDate = DateTime.now();
  @observable
  CurrencyEntity selectedCurrency = CurrencyEntity(
      code: 'USD',
      name: 'USD',
      symbol: '\$',
      flag: 'USD',
      number: 840,
      decimalDigits: 2,
      namePlural: 'US dollars',
      symbolOnLeft: true,
      decimalSeparator: '',
      thousandsSeparator: '',
      spaceBetweenAmountAndSymbol: false);

  @observable
  HistoryPosition? historyPosition;
  @action
  void updateSelectedBottomNavigation(int index) {
    selectedBottomNavigation = index;
  }

  @action
  void updateSelectedCurrency(CurrencyEntity value) {
    selectedCurrency = value; // Directly assign the Currency object
  }


  @action
  void updateSelectedDate(DateTime value) {
    selectedDate = value;
  }

  @action
  void updateHistoryPosition(HistoryPosition value) {
    historyPosition = value;
  }
}
