import 'dart:io';
import 'dart:transaction.dart';

class Account{
    num balance = 0;
    List<transaction> transactions = [];

    Account(num balance){
        this.balance = balance;
    }

    void setBalance(num balance){
        this.balance = balance;
    }

    num getBalance(){
        return this.balance;
    }
}