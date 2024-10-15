class HistoryPosition {
  final double profit;
  final double credit;
  final double deposit;
  final double withdraw;
  final double swap;
  final double commission;
  final double balance;
  final List<Transaction> transaction;

  HistoryPosition( {
    required this.profit,
    required this.credit,
    required this.deposit,
    required this.withdraw,
    required this.swap,
    required this.commission,
    required this.balance,
    required this.transaction
  });

  factory HistoryPosition.fromJson(Map<String, dynamic> json) {
    var transactionFromJson = json['Transaction'] as List;
    List<Transaction> transactionList = transactionFromJson
        .map((transaction) => Transaction.fromJson(transaction))
        .toList();
    return HistoryPosition(
      profit: json['Profit'] as double,
      credit: json['Credit'] as double,
      deposit: json['Deposit'] as double,
      withdraw: json['Withdraw'] as double,
      swap: json['Swap'] as double,
      commission: json['Commission'] as double,
      balance: json['Balance'] as double,
      transaction: transactionList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "Profit": profit,
      "Credit": credit,
      "Deposit": deposit,
      "Withdraw": withdraw,
      "Swap": swap,
      "Commission": commission,
      "Balance": balance,
      "Transaction": transaction,
    };
  }
}

class Transaction {
  final String symbol;
  final String action;
  final double lotSize;      // Size of the trade in lots (e.g., 0.38)
  final DateTime timestamp;  // Date and time of the transaction
  final double buyPrice;     // Price at which the asset was bought
  final double sellPrice;    // Price at which the asset was sold
  final double profit;        // Profit from the trade

  Transaction({
    required this.symbol,
    required this.action,
    required this.lotSize,
    required this.timestamp,
    required this.buyPrice,
    required this.sellPrice,
    required this.profit,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      symbol: json['Symbol'] as String,
      action: json['Action'] as String,
      lotSize: json['LotSize'] as double,
      timestamp: DateTime.parse(json['Timestamp'] as String),
      buyPrice: json['BuyPrice'] as double,
      sellPrice: json['SellPrice'] as double,
      profit: json['Profit'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "Symbol": symbol,
      "Action": action,
      "LotSize": lotSize,
      "Timestamp": timestamp.toIso8601String(),
      "BuyPrice": buyPrice,
      "SellPrice": sellPrice,
      "Profit": profit,
    };
  }
}
