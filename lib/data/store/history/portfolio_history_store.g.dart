// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'portfolio_history_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PortfolioHistoryStore on _PortfolioHistoryStore, Store {
  late final _$selectedBottomNavigationAtom = Atom(
      name: '_PortfolioHistoryStore.selectedBottomNavigation',
      context: context);

  @override
  int get selectedBottomNavigation {
    _$selectedBottomNavigationAtom.reportRead();
    return super.selectedBottomNavigation;
  }

  @override
  set selectedBottomNavigation(int value) {
    _$selectedBottomNavigationAtom
        .reportWrite(value, super.selectedBottomNavigation, () {
      super.selectedBottomNavigation = value;
    });
  }

  late final _$selectedDateAtom =
      Atom(name: '_PortfolioHistoryStore.selectedDate', context: context);

  @override
  DateTime get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(DateTime value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$selectedCurrencyAtom =
      Atom(name: '_PortfolioHistoryStore.selectedCurrency', context: context);

  @override
  CurrencyEntity get selectedCurrency {
    _$selectedCurrencyAtom.reportRead();
    return super.selectedCurrency;
  }

  @override
  set selectedCurrency(CurrencyEntity value) {
    _$selectedCurrencyAtom.reportWrite(value, super.selectedCurrency, () {
      super.selectedCurrency = value;
    });
  }

  late final _$historyPositionAtom =
      Atom(name: '_PortfolioHistoryStore.historyPosition', context: context);

  @override
  HistoryPosition? get historyPosition {
    _$historyPositionAtom.reportRead();
    return super.historyPosition;
  }

  @override
  set historyPosition(HistoryPosition? value) {
    _$historyPositionAtom.reportWrite(value, super.historyPosition, () {
      super.historyPosition = value;
    });
  }

  late final _$_PortfolioHistoryStoreActionController =
      ActionController(name: '_PortfolioHistoryStore', context: context);

  @override
  void updateSelectedBottomNavigation(int index) {
    final _$actionInfo = _$_PortfolioHistoryStoreActionController.startAction(
        name: '_PortfolioHistoryStore.updateSelectedBottomNavigation');
    try {
      return super.updateSelectedBottomNavigation(index);
    } finally {
      _$_PortfolioHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedCurrency(CurrencyEntity value) {
    final _$actionInfo = _$_PortfolioHistoryStoreActionController.startAction(
        name: '_PortfolioHistoryStore.updateSelectedCurrency');
    try {
      return super.updateSelectedCurrency(value);
    } finally {
      _$_PortfolioHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateSelectedDate(DateTime value) {
    final _$actionInfo = _$_PortfolioHistoryStoreActionController.startAction(
        name: '_PortfolioHistoryStore.updateSelectedDate');
    try {
      return super.updateSelectedDate(value);
    } finally {
      _$_PortfolioHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateHistoryPosition(HistoryPosition value) {
    final _$actionInfo = _$_PortfolioHistoryStoreActionController.startAction(
        name: '_PortfolioHistoryStore.updateHistoryPosition');
    try {
      return super.updateHistoryPosition(value);
    } finally {
      _$_PortfolioHistoryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedBottomNavigation: ${selectedBottomNavigation},
selectedDate: ${selectedDate},
selectedCurrency: ${selectedCurrency},
historyPosition: ${historyPosition}
    ''';
  }
}
