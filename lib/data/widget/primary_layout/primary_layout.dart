import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marketwick_assignment/data/store/history/portfolio_history_store.dart';
import 'package:marketwick_assignment/di/serivce_locators.dart';
import 'package:marketwick_assignment/presentation/charts/chart_screen.dart';
import 'package:marketwick_assignment/presentation/history/history_screen.dart';
import 'package:marketwick_assignment/presentation/messages/messages_screen.dart';
import 'package:marketwick_assignment/presentation/quotes/quotes_screen.dart';
import 'package:marketwick_assignment/presentation/trade/trade_screen.dart';
import 'package:intl/intl.dart';

class PrimaryLayout extends StatefulWidget {
  const PrimaryLayout({super.key});

  @override
  _PrimaryLayoutState createState() => _PrimaryLayoutState();
}

class _PrimaryLayoutState extends State<PrimaryLayout> {
  final PortfolioHistoryStore _portfolioHistoryStore =
      getIt<PortfolioHistoryStore>();

  List<Widget> pageList = [
    const QuotesScreen(),
    const ChartScreen(),
    const TradeScreen(),
    const HistoryScreen(),
    const MessagesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        // drawer: ,
        appBar: AppBar(
          title: const Text("Device Insight"),
          actions: [
            _buildSelectDate(),
          ],
        ),

        body: pageList[_portfolioHistoryStore.selectedBottomNavigation],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: Theme.of(context).colorScheme.onPrimary,
            // backgroundColor:  const Color(0xFFEEEEEE),
            indicatorColor: Colors.transparent,
            labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
              (states) {
                if (states.contains(WidgetState.selected)) {
                  return TextStyle(
                      color: Theme.of(context).colorScheme.primary);
                }
                return TextStyle(
                    color: Theme.of(context).colorScheme.secondary);
              },
            ),
            iconTheme: WidgetStateProperty.resolveWith<IconThemeData>(
              (states) {
                if (states.contains(WidgetState.selected)) {
                  return IconThemeData(
                      color: Theme.of(context).colorScheme.primary);
                }
                return IconThemeData(
                    color: Theme.of(context).colorScheme.secondary);
              },
            ),
          ),
          child: NavigationBar(
            selectedIndex: _portfolioHistoryStore.selectedBottomNavigation,
            onDestinationSelected: (index) {
              _portfolioHistoryStore.updateSelectedBottomNavigation(index);
            },
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.swap_vert),
                label: 'Quotes',
              ),
              NavigationDestination(
                icon: Icon(Icons.candlestick_chart_outlined),
                label: 'Charts',
              ),
              NavigationDestination(
                icon: Icon(Icons.show_chart_sharp),
                label: 'Trade',
              ),
              NavigationDestination(
                icon: Icon(Icons.history),
                label: 'History',
              ),
              NavigationDestination(
                icon: Icon(Icons.chat_bubble_outline_rounded),
                label: 'Messages',
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildSelectDate() {
    return Observer(builder: (context) {
      return IconButton(
         onPressed: () async {
           // Show the date picker and get the selected date
           final DateTime? pickedDate = await showDatePicker(
             context: context,
             initialDate: _portfolioHistoryStore.selectedDate,
             firstDate: DateTime(2000),
             lastDate: DateTime(2400),
             builder: (BuildContext context, Widget? child) {
               return Theme(
                 data: Theme.of(context).copyWith(
                   datePickerTheme:  DatePickerThemeData(
                     backgroundColor:Theme.of(context).colorScheme.onPrimary,
                     // Change background color here
                     dayStyle: const TextStyle(color: Colors.black),
                     // Day text color
                     headerHelpStyle: const TextStyle(
                         color: Colors.blue), // Header text color
                     // Add more styling options as needed
                   ),
                   dialogBackgroundColor: Colors.red,
                   // Background color of the dialog
                   primaryColor: Colors.green,
                   // Header color
                   hintColor: Colors.blue,
                   // Accent color
                   colorScheme: ColorScheme.light(primary: Colors.blue),
                   // Color scheme
                   buttonTheme: ButtonThemeData(
                       textTheme: ButtonTextTheme.primary), // Button color
                 ),
                 child: child ?? Container(), // Ensure child is not null
               );
             },
           );
           if (pickedDate != null && pickedDate != _portfolioHistoryStore.selectedDate) {
             _portfolioHistoryStore.updateSelectedDate(pickedDate); // Update the date in the store
           }

         },
        icon: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(
              Icons.calendar_today,
              size: 40.0,
              color: Colors.blue,
            ),
            Text(
              DateFormat('d').format(_portfolioHistoryStore.selectedDate), // Format the selected date
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary, // Use primary color from theme
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    });
  }
}
