
print("===== BANK ACCOUNT MANAGEMENT =====")

if let account = BankAccount(
    holderName: "Khushi Sharma",
    initialBalance: 1000
) {

    print("Account Created Successfully!")
    print("Name:", account.accountHolder)
    print("Initial Balance:", account.currentBalance)

    print("\n===== DEPOSIT =====")

    if account.deposit(500) {
        print("Deposit Successful!")
    }

    print("Balance:", account.currentBalance)

    print("\n===== WITHDRAWAL =====")

    if account.withdraw(200) {
        print("Withdrawal Successful!")
    }

    print("Balance:", account.currentBalance)

    print("\n===== INVALID OPERATIONS =====")

    account.deposit(0)
    account.deposit(-100)
    account.withdraw(5000)
    account.withdraw(-50)

    print("\nFinal Balance:", account.currentBalance)

    runAccessDemo()

} else {
    print("Invalid account details!")
}
