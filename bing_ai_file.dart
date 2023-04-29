import 'dart:io';

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
    balance += amount + 0.50;
    print("Top up successful. Current balance: \$${balance}");
  }

  void makePayment(double amount) {
    var now = DateTime.now();
    var peakHour = now.hour > 11 && now.hour < 13; 
    if (peakHour) {
      print("Congrats! You got 10% off due to peak hour bonus!!");
      amount *= 0.9;
    }
    if (amount > balance) {
      print("Insufficient funds");
    } else {
      balance -= amount;
      transactions.add(Transaction(balance, amount, now, balance));
      if(amount != 0){
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

  print("Your current balance is ");

  while (true) {

    print("Enter an option:");
    print("1: Top Up");
    print("2: Make Payment");
    print("3: Display Transactions");
    print("4: Exit");
    var option = stdin.readLineSync();
    if (option == null) {
      return;
    }
    switch (option) {
      case "1":
        print("Enter the amount to top up:");
        var amountStr = stdin.readLineSync();
        if (amountStr == null) {
          return;
        }
        var amount = double.parse(amountStr);
        myEWallet.topUp(amount);
        break;
      case "2":
        //print("Enter the amount to pay:");
        var amountStr;

        do{
          
          print("Enter the amount to pay:");
          amountStr = stdin.readLineSync();
          if (amountStr == null) {
          return;
          }

          if(double.parse(amountStr) > myEWallet.balance){
            print("Insufficient funds");
          }
          else if(double.parse(amountStr) < 0){
            print("Invalid amount");
          }
          else if(double.parse(amountStr) == 0){
            break;
          }
          
        }while(double.parse(amountStr) > myEWallet.balance || double.parse(amountStr) < 0);

        var amount = double.parse(amountStr);
        myEWallet.makePayment(amount);
        break;

      case "3":
        myEWallet.displayTransactions();
        break;
      case "4":
        return;
      default:
        print("Invalid option");
    }
  }
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


