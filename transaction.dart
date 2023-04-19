import 'dart:io';
import 'main.dart';

class transaction {
  num balance = 100;//need to overwrite balik

  transaction() {
    setTransaction(balance);
  }

  void setTransaction(num balance) {
    num newBalance = 0;

    //check balance
    print("Your current balance is: RM $balance");

    while (true) {
      print("Please Enter The Correct Amount for Transactions:");
      dynamic inputTrans = stdin.readLineSync();

      if (inputTrans == null) {
        print("Invalid input. Please try again.");
        continue;
      }
      num? amount = num.tryParse(inputTrans);
      if (amount == null) {
        print("Invalid input. Please try again.");
        continue;
      }
      if (amount >= balance) {
        print("You have insufficient funds.");
      } else {
        balance -= amount;
        //should be decreasing
        break;
      }
    }
    print("Your new balance is: RM $balance");
  }
}
