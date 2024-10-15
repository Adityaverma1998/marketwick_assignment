import 'package:mobx/mobx.dart';

part 'portfolio_history_store.g.dart';

class PortfolioHistoryStore = _PortfolioHistoryStore with _$PortfolioHistoryStore;

abstract class _PortfolioHistoryStore with Store {

  _PortfolioHistoryStore();

  @observable
  int selectedBottomNavigation = 0;

  @observable
  String selectedCurrency='';
  @observable
  String selectedDate = '';


  @action
  void updateSelectedBottomNavigation(int index){
    selectedBottomNavigation = index;
  }

  @action
  void updateSelectedCurrency(String value){
    selectedCurrency = value;
  }

  @action
  void updateSelectedDate(String  value){
    selectedDate = value;
  }

}
