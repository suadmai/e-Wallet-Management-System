import 'dart:io';
import 'transaction.dart';

//daus takeover


void main(List<String> args) {
  //num balance = 100;
  int count = 0;

  do {
    print("Please select your services:");
    print("1. Transactions");
    print("2. Exit");

    //ask user inputs
    dynamic number = stdin.readLineSync();
    int input = int.parse(number);

    //services
    switch (input) {
      case 1:
        transaction a = new transaction();
        // a.setTransaction(); kena pass parameter
        break;
      case 2:
        print("Thank you! Please come again ");
        return;
      default:
        print("Invalid input. Please try again.");
        break;
    }

    // count++;
    // print("You made $count transactions today.");
  } while (true);

  
}
