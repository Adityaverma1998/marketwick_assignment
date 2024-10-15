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
  DateTime selectedDate = DateTime.now();


  @action
  void updateSelectedBottomNavigation(int index){
    selectedBottomNavigation = index;
  }

  @action
  void updateSelectedCurrency(String value){
    selectedCurrency = value;
  }

  @action
  void updateSelectedDate(DateTime  value){
    selectedDate = value;
  }

}
