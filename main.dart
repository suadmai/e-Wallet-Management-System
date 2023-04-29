import 'dart:html';

class Transaction {
  double balance;
  double payment;
  DateTime date;
  double remainingAmount;

  Transaction(this.balance, this.payment, this.date, this.remainingAmount);
}

class EWallet {
  List<Transaction> transactions = [];
  double balance = 0.0;

  void topUp(double amount) {
    if (amount < 0) {
      // window.alert("Invalid amount");
      print("Invalid amount");
      return;
    }
    if (amount == 0) {
      // window.alert("Invalid amount");
      print("Invalid amount");
      return;
    }
    balance += amount + 0.50;
    // window.alert("Top up successful. Current balance: \$${balance}");
    print("Top up successful. Current balance: \$${balance}");
  }

  void makePayment(double amount) {
    var now = DateTime.now();
    var peakHour = now.hour > 11 && now.hour < 13;
    if (peakHour) {
      // window.alert("Congrats! You got 10% off due to peak hour bonus!!");
      print("Congrats! You got 10% off due to peak hour bonus!!");
      amount *= 0.9;
    }
    if (amount > balance) {
      // window.alert("Insufficient funds");
      print("Insufficient funds");
    } else {
      balance -= amount;
      transactions.add(Transaction(balance, amount, now, balance));
      if (amount != 0) {
        // window.alert("Payment successful. Current balance: \$${balance}");
        print("Payment successful. Current balance: \$${balance}");
      }
    }
  }

  void displayTransactions() {
    for (var transaction in transactions) {
      print(
          "Balance: \$${transaction.balance}, Payment: \$${transaction.payment}, Date: ${transaction.date}, Remaining Amount: \$${transaction.remainingAmount}");
    }
  }
}

void main() {
  var myEWallet = EWallet();

  // Update the balance display
  var balanceElement = querySelector('#balance');
  balanceElement!.text = myEWallet.balance.toString(); //change to string

  // Add event listeners to the buttons
  var topUpAmountElement = querySelector('#topUpAmount') as InputElement;
  var topUpButton = querySelector('#topUpButton');
  topUpButton?.onClick.listen((event) {
    // print("Top up button clicked");
    var amountStr = topUpAmountElement.value;
    if (amountStr == null) return;

    var amount = double.tryParse(amountStr);
    if (amount == null) return;

    myEWallet.topUp(amount); //pass value

    // Update the balance display
    balanceElement.text = myEWallet.balance.toString();
  });

  var makePaymentElement = querySelector('#makePayment') as InputElement;
  var makePaymentButton = querySelector('#makePaymentButton');
  makePaymentButton?.onClick.listen((event) {
    // print("Payment button clicked");
    var amountStr = makePaymentElement.value;
    if (amountStr == null) return;

    var amount = double.tryParse(amountStr);
    if (amount == null) return;

    myEWallet.makePayment(amount);

    // Update the balance display
    balanceElement.text = myEWallet.balance.toString();
  });

  var displayTransactionsButton = querySelector('#displayTransactionsButton');
}

// This program creates two classes: Transaction and EWallet. The Transaction class 
// represents a single transaction and has properties for the balance, payment, date of transaction, 
// and remaining amount. The EWallet class represents an e-wallet and has a transactions 
// property that stores a list of Transaction objects and a balance property that stores the 
// current balance.

// The EWallet class also has three methods: topUp, makePayment, and 
// displayTransactions. The topUp method adds the specified amount to the balance and 
// also adds an additional RM0.50 cash back for each top-up. The makePayment method subtracts 
// the specified amount from the balance if there are sufficient funds and adds a new 
// Transaction object to the transactions list. If the payment is made during off-peak hours 
// (before 7am or after 9pm), a discount of 10% is applied to the payment amount. The 
// displayTransactions method prints a list of all transactions.

// In the main function, an instance of the EWallet class is created and a while loop is used to 
// repeatedly prompt the user to enter an option. The user can choose to top up their e-wallet, make 
// a payment, display a list of transactions, or exit the program. The stdin.readLineSync 
// method is used to read input from the user.
