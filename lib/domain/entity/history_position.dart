class HistoryPosition {
  final String profit;
  final String credit;
  final String deposit;
  final String withdraw;
  final String swap;
  final String commission;
  final String balance;
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
      profit: json['Profit'] as String,
      credit: json['Credit'] as String,
      deposit: json['Deposit'] as String,
      withdraw: json['Withdraw'] as String,
      swap: json['Swap'] as String,
      commission: json['Commission'] as String,
      balance: json['Balance'] as String,
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
  final double lotSize;
  final DateTime timestamp;
  final double buyPrice;
  final double sellPrice;
  final double profit;

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
