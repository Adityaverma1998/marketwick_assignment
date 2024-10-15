import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:marketwick_assignment/data/store/history/portfolio_history_store.dart';
import 'package:marketwick_assignment/di/serivce_locators.dart';
import 'package:marketwick_assignment/domain/entity/currency/currency.dart';
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
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Trading app'),
              ),
              ListTile(
                title: Text("Text 11",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.tertiaryFixed,
                    )),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: Text("Text 12",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.tertiaryFixed,
                    )),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title:  Text(_getTitleForIndex(_portfolioHistoryStore.selectedBottomNavigation)),
          actions: [
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 16.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [

                 _buildChangeCurrency(),
                 const SizedBox(width: 20.0,),

                 _buildSwap(),

                 const SizedBox(width: 20.0,),

                 _buildSelectDate(),
               ],
             ),
           )
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
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: _portfolioHistoryStore.selectedDate,
            firstDate: DateTime(2000),
            lastDate: DateTime(2400),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  datePickerTheme: DatePickerThemeData(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,

                    dayStyle: const TextStyle(color: Colors.black),

                    headerHelpStyle: const TextStyle(color: Colors.blue),
                  ),
                  dialogBackgroundColor: Colors.red,

                  primaryColor: Colors.green,
                  hintColor: Colors.blue,
                  colorScheme: const ColorScheme.light(primary: Colors.blue),
                  buttonTheme:
                      const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                ),
                child: child ?? Container(),
              );
            },
          );
          if (pickedDate != null &&
              pickedDate != _portfolioHistoryStore.selectedDate) {
            _portfolioHistoryStore
                .updateSelectedDate(pickedDate); // Update the date in the store
          }
        },
        icon: Stack(
          alignment: Alignment.center,
          children: [
             Icon(
              Icons.calendar_today,
              size: 40.0,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Text(
                  DateFormat('d').format(_portfolioHistoryStore.selectedDate),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  String _getTitleForIndex(int index) {
    switch (index) {
      case 0:
        return "Quotes";
      case 1:
        return "Charts";
      case 2:
        return "Trade";
      case 3:
        return "History";
      case 4:
        return "Message";
      default:
        return "";
    }}

  Widget _buildSwap(){
    return Icon(
      Icons.swap_vert_outlined,
      size: 32.0,
      color: Theme.of(context).colorScheme.onPrimary,
    );
  }
  Widget _buildChangeCurrency() {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () {
          // Open the Currency Picker when the button is pressed
          showCurrencyPicker(
            context: context,
            theme: CurrencyPickerThemeData(
              flagSize: 25,
              titleTextStyle: TextStyle(fontSize: 17,color: Theme.of(context).hintColor),


              subtitleTextStyle:
                  TextStyle(fontSize: 15, color: Theme.of(context).hintColor),
              bottomSheetHeight: MediaQuery.of(context).size.height / 2,
              inputDecoration: InputDecoration(
                suffixStyle:TextStyle(
                  color:Colors.blue,
                ),
                 // fillColor: Colors.red,
                  focusColor: Colors.red,
                    filled: true ,
                    fillColor: const Color(0xFF929293),
                    hintStyle:TextStyle(
                      color:Theme.of(context).hintColor ,

                    ) ,

                labelStyle:TextStyle(
                  color:Theme.of(context).hintColor ,

                ) ,
                counterStyle:TextStyle(
                  color:Theme.of(context).hintColor ,

                ),
                counter: Text('hello'),

                prefixIconColor:Theme.of(context).hintColor ,
                labelText: '',
                hintText: 'Start typing to search',
                prefixIcon: const Icon(Icons.search),
                iconColor:Theme.of(context).hintColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color(0xFF8C98A8).withOpacity(0.2),
                  ),
                ),

              ),


            ),
            onSelect: (Currency currency) {
              // Handle the selected currency
              CurrencyEntity selectedCurrency = CurrencyEntity(
                code: currency.code,
                name: currency.name,
                symbol: currency.symbol,
                flag: currency.flag,
                number: currency.number,
                decimalDigits: currency.decimalDigits,
                namePlural: currency.namePlural,
                symbolOnLeft: currency.symbolOnLeft,
                decimalSeparator: currency.decimalSeparator,
                thousandsSeparator: currency.thousandsSeparator,
                spaceBetweenAmountAndSymbol:
                    currency.spaceBetweenAmountAndSymbol,
              );

              _portfolioHistoryStore.updateSelectedCurrency(selectedCurrency);
            },
          );
        },
        child: Text(_portfolioHistoryStore.selectedCurrency.symbol,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
              color: Theme.of(context).colorScheme.onPrimary,
                )),
      );
    });
  }
}
