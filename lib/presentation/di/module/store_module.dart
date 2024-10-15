import 'dart:async';

import 'package:marketwick_assignment/data/store/history/portfolio_history_store.dart';
import 'package:marketwick_assignment/di/serivce_locators.dart';



class StoreModule {
  static Future<void> configureStoreModuleInjection() async {


    // stores:------------------------------------------------------------------
    getIt.registerSingleton<PortfolioHistoryStore>(
      PortfolioHistoryStore(),
    );


  }
}
