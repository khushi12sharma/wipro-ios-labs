
import Foundation

public final class BankAccount {

    // private: accessible only inside this type
    private var balance: Double

    public let accountHolder: String

    // public: callers can read but cannot change balance directly
    public var currentBalance: Double {
        return balance
    }

    // internal: accessible anywhere inside this module
    var accountType: String {
        return "Savings Account"
    }

    // public initializer with validation
    public init?(holderName: String, initialBalance: Double) {

        guard !holderName.trimmingCharacters(in: .whitespaces).isEmpty,
              initialBalance >= 0 else {
            return nil
        }

        self.accountHolder = holderName
        self.balance = initialBalance
    }

    // public deposit method
    public func deposit(_ amount: Double) -> Bool {

        guard amount > 0 else {
            print("Deposit amount must be positive.")
            return false
        }

        balance += amount
        return true
    }

    // public withdraw method
    public func withdraw(_ amount: Double) -> Bool {

        guard amount > 0 else {
            print("Withdrawal amount must be positive.")
            return false
        }

        guard amount <= balance else {
            print("Insufficient balance.")
            return false
        }

        balance -= amount
        return true
    }
}

// fileprivate: accessible only within this file
fileprivate let fileMessage = "BankAccount.swift access demo"

// This function can access the fileprivate value because
// both are in the same file.
fileprivate func showFileMessage() {
    print(fileMessage)
}

// internal function: accessible from other files in this module
func demonstrateFileprivateAccess() {
    showFileMessage()
}
