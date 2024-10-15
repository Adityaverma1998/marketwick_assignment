import 'package:flutter/material.dart';
import 'package:marketwick_assignment/data/store/history/portfolio_history_store.dart';
import 'package:marketwick_assignment/data/widget/custom-tabbar/tabbar-view/history/deals.dart';
import 'package:marketwick_assignment/data/widget/custom-tabbar/tabbar-view/history/orders.dart';
import 'package:marketwick_assignment/data/widget/custom-tabbar/tabbar-view/history/positions.dart';
import 'package:marketwick_assignment/data/widget/custom-tabbar/tabbar/custom_tabbar.dart';
import 'package:marketwick_assignment/di/serivce_locators.dart';
import 'package:marketwick_assignment/domain/entity/history_position.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final PortfolioHistoryStore _portfolioHistoryStore =
      getIt<PortfolioHistoryStore>();

  Map<String, dynamic> exampleData = {
    "Profit": 57.00,
    "Credit": 100.0,
    "Deposit": 500.0,
    "Withdraw": 0.0,
    "Swap": 0.0,
    "Commission": 0.0,
    "Balance": 1000.0,
    "Transaction": [
      {
        "Symbol": "XAUUSD",
        "Action": "buy",
        "LotSize": 0.38,
        "Timestamp": "2024-08-05T18:15:40",
        "BuyPrice": 2404.46,
        "SellPrice": 2405.46,
        "Profit": 38.00,
      },
      {
        "Symbol": "XAUUSD",
        "Action": "buy",
        "LotSize": 0.38,
        "Timestamp": "2024-08-05T07:15:40",
        "BuyPrice": 2394.50,
        "SellPrice": 2395.00,
        "Profit": 19.00,
      },
      {
        "Symbol": "XAUUSD",
        "Action": "buy",
        "LotSize": 0.38,
        "Timestamp": "2024-08-05T07:15:40",
        "BuyPrice": 2394.50,
        "SellPrice": 2395.00,
        "Profit": 19.00,
      },
      {
        "Symbol": "XAUUSD",
        "Action": "buy",
        "LotSize": 0.38,
        "Timestamp": "2024-08-05T07:15:40",
        "BuyPrice": 2394.50,
        "SellPrice": 2395.00,
        "Profit": 19.00,
      },
      {
        "Symbol": "XAUUSD",
        "Action": "buy",
        "LotSize": 0.38,
        "Timestamp": "2024-08-05T07:15:40",
        "BuyPrice": 2394.50,
        "SellPrice": 2395.00,
        "Profit": 19.00,
      },
      {
        "Symbol": "XAUUSD",
        "Action": "buy",
        "LotSize": 0.38,
        "Timestamp": "2024-08-05T07:15:40",
        "BuyPrice": 2394.50,
        "SellPrice": 2395.00,
        "Profit": 19.00,
      },
      {
        "Symbol": "XAUUSD",
        "Action": "buy",
        "LotSize": 0.38,
        "Timestamp": "2024-08-05T07:15:40",
        "BuyPrice": 2394.50,
        "SellPrice": 2395.00,
        "Profit": 19.00,
      },
      {
        "Symbol": "XAUUSD",
        "Action": "buy",
        "LotSize": 0.38,
        "Timestamp": "2024-08-05T07:15:40",
        "BuyPrice": 2394.50,
        "SellPrice": 2395.00,
        "Profit": 19.00,
      },
      {
        "Symbol": "XAUUSD",
        "Action": "buy",
        "LotSize": 0.38,
        "Timestamp": "2024-08-05T07:15:40",
        "BuyPrice": 2394.50,
        "SellPrice": 2395.00,
        "Profit": 19.00,
      }, {
        "Symbol": "XAUUSD",
        "Action": "buy",
        "LotSize": 0.38,
        "Timestamp": "2024-08-05T07:15:40",
        "BuyPrice": 2394.50,
        "SellPrice": 2395.00,
        "Profit": 19.00,
      },
      {
        "Symbol": "XAUUSD",
        "Action": "buy",
        "LotSize": 0.38,
        "Timestamp": "2024-08-05T07:15:40",
        "BuyPrice": 2394.50,
        "SellPrice": 2395.00,
        "Profit": 19.00,
      },
    ],
  };
  List<String> tabLists = [
    'POSITIONS',
    'ORDERS',
    'DEALS'
  ];

  @override
  void initState() {
    _portfolioHistoryStore
        .updateHistoryPosition(HistoryPosition.fromJson(exampleData));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTabbarScreen(
          tabLists: tabLists,
          tabWidgets: [
            Positions(),
            const Orders(),
            const Deals(),
          ],
        ),
      ],
    );
  }
}
