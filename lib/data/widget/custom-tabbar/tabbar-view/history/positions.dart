import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:marketwick_assignment/data/store/history/portfolio_history_store.dart';
import 'package:marketwick_assignment/di/serivce_locators.dart';

class Positions extends StatelessWidget {
  Positions({super.key});

  final PortfolioHistoryStore _portfolioHistoryStore =
      getIt<PortfolioHistoryStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLineText(context, 'Profit : ', _portfolioHistoryStore.historyPosition!.profit),
        _buildLineText(context, 'Credit : ', _portfolioHistoryStore.historyPosition!.credit),
        _buildLineText(context, 'Withdrawal : ', _portfolioHistoryStore.historyPosition!.withdraw),
        _buildLineText(context, 'Swap : ', _portfolioHistoryStore.historyPosition!.swap),
        _buildLineText(context, 'Commission : ', _portfolioHistoryStore.historyPosition!.commission),
        _buildLineText(context, 'Balance : ', _portfolioHistoryStore.historyPosition!.balance),

        if (_portfolioHistoryStore.historyPosition?.transaction != null)
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              height: 200, // Set height for ListView
              child: ListView.builder(
                itemCount: _portfolioHistoryStore.historyPosition!.transaction.length,
                itemBuilder: (context, index) {
                  final transaction = _portfolioHistoryStore.historyPosition!.transaction[index];
                  return _buildTransactionWidget(
                    context,
                    transaction.symbol,
                    transaction.action,
                    transaction.lotSize,
                    transaction.timestamp,
                    transaction.buyPrice,
                    transaction.sellPrice,
                    transaction.profit,
                  );
                },
              ),
            ),
          ),
      ],
    );

  }

  Widget _buildLineText(BuildContext context, String label, double value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(label,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.tertiaryFixed,
                    )),
          ),
          Expanded(
            child: DottedLine(
              direction: Axis.horizontal,
              alignment: WrapAlignment.center,
              lineLength: double.infinity,
              lineThickness: 3.0,
              dashLength: 4.0,
              dashColor: Theme.of(context).colorScheme.primary,
              // dashGradient: [Colors.red, Colors.blue],
              dashRadius: 0.0,
              dashGapLength: 4.0,
              dashGapColor: Colors.transparent,
              // dashGapGradient: [Colors.red, Colors.blue],
              dashGapRadius: 0.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text('$value',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.primary,
                    )),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionWidget(
      BuildContext context,
      String symbol,
      String action,
      double lotSize,
      DateTime timestamp,
      double buyPrice,
      double sellPrice,
      double profit) {
    return Column(
      children: [
        Divider(
          color: Theme.of(context).colorScheme.primaryContainer,
          height: 20,
          thickness: 1,
          indent: 0,
          endIndent: 0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$symbol, ',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w900,
                            color:const Color(0xFF4a4b50),
                            // color: Theme.of(context).colorScheme.inverseSurface,
                          ),
                    ),
                    TextSpan(
                      text: '$action ',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    TextSpan(
                      text: '$lotSize',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              ),
              Text('$timestamp',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary,
                      ))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '$buyPrice  ',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                    ),
                    WidgetSpan(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Theme.of(context).colorScheme.onTertiary,
                        size: 16.0,
                      ),
                    ),
                    TextSpan(
                      text: ' $sellPrice',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                    ),
                  ],
                ),
              ),
              Text('$profit',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.primary,
                      ))
            ],
          ),
        ),
      ],
    );
  }
}
