class BankAccount {
  String accountHolderName;
  String accountNumber;
  String accountID;
  double balance;
  String currency;
  BankAccount(this.accountHolderName, this.accountNumber, this.accountID,
      this.balance, this.currency);
  @override
  String toString() {
    return 'Account Holder: $accountHolderName\nAccount Number: $accountNumber\nBalance: $balance $currency';
  }

  String showBalance() {
    return "Current balance: $balance $currency";
  }

  double withdraw(double amount) {
    if (balance < amount) {
      throw Exception("Your balance is not enough.");
    } else {
      balance -= amount;
    }
    return balance;
  }

  double credit(double amount) {
    balance += amount;
    return balance;
  }
}

class Bank {
  String bankName;
  String bankId;
  String location;
  String contactInfo;
  List<BankAccount> accounts = [];
  Bank(this.bankName, this.bankId, this.location, this.contactInfo);
  void addAccount(BankAccount account) {
    if (accounts.any((acc) => acc.accountID == account.accountID)) {
      throw Exception("Account ID '${account.accountID}' already exists.");
    }
    accounts.add(account);
    print("Account added: ${account.accountHolderName}");
  }

  // Method to create a new account
  void createAccount(int accountId, String accountOwner) {
    String accountID = accountId.toString();
    // Check for uniqueness of account ID
    if (accounts.any((acc) => acc.accountID == accountID)) {
      throw Exception("Account ID '$accountID' already exists.");
    }
    // Create a new BankAccount
    var newAccount =
        BankAccount(accountOwner, "Account-$accountID", accountID, 0.0, "USD");
    // Add the new account to the accounts list
    accounts.add(newAccount);
    print(
        "New account created: ${newAccount.accountHolderName} with ID: $accountID");
  }
}

void main() {
  var bank = Bank("MyBank", "001", "123 Main St", "555-1234");
  // Creating a new account
  try {
    bank.createAccount(123456, "Kongtiven");
  } catch (e) {
    print(e);
  }

  // Show the accounts
  for (var account in bank.accounts) {
    print(account);
  }
}
