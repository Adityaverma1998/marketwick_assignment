import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marketwick_assignment/data/store/history/portfolio_history_store.dart';
import 'package:marketwick_assignment/di/serivce_locators.dart';
import 'package:marketwick_assignment/presentation/charts/chart_screen.dart';
import 'package:marketwick_assignment/presentation/history/history_screen.dart';
import 'package:marketwick_assignment/presentation/messages/messages_screen.dart';
import 'package:marketwick_assignment/presentation/quotes/quotes_screen.dart';
import 'package:marketwick_assignment/presentation/trade/trade_screen.dart';

class PrimaryLayout extends StatefulWidget {
  const PrimaryLayout({super.key});

  @override
  _PrimaryLayoutState createState() => _PrimaryLayoutState();
}

class _PrimaryLayoutState extends State<PrimaryLayout> {

   final PortfolioHistoryStore _portfolioHistoryStore = getIt<PortfolioHistoryStore>();

  List<Widget> pageList = [
     const QuotesScreen(),
    const ChartScreen(),
    const TradeScreen(),
    const HistoryScreen(),
    const MessagesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          // drawer: ,
          appBar: AppBar(
            title: const Text("Device Insight"),
          ),
          body: pageList[_portfolioHistoryStore.selectedBottomNavigation],
          bottomNavigationBar: NavigationBarTheme(
            data: NavigationBarThemeData(
              labelTextStyle: WidgetStateProperty.all(
                TextStyle(color: Colors.blue),
              ),
            ),
            child: NavigationBar(
                selectedIndex: _portfolioHistoryStore.selectedBottomNavigation,
                onDestinationSelected: (index)=>{
                  _portfolioHistoryStore.updateSelectedBottomNavigation(index)
                },
                backgroundColor: Colors.red,
                 indicatorColor: Colors.transparent,
                destinations:  [
              NavigationDestination(icon: Icon(Icons.swap_vert,color: Theme.of(context).colorScheme.primary,), label: 'Quotes'),
              NavigationDestination(
                  icon: Icon(Icons.candlestick_chart_outlined,color: Theme.of(context).colorScheme.primary,), label: 'Charts'),
              NavigationDestination(
                  icon: Icon(Icons.show_chart_sharp,color: Theme.of(context).colorScheme.primary,), label: 'Trade'),
              NavigationDestination(icon: Icon(Icons.history,color: Theme.of(context).colorScheme.primary,), label: 'history'),
              NavigationDestination(
                  icon: Icon(Icons.chat_bubble_outline_rounded,color: Theme.of(context).colorScheme.primary,), label: 'Messages')
            ]),
          ),
        );
      }
    );
  }
}
