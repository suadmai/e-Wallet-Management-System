# e-Wallet-Management-System

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
