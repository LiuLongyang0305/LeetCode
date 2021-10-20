// https://leetcode.com/problems/simple-bank-system/
class Bank {
    private var balance = [0]
    private let minCounterNumber = 1
    private let maxCounterNumbser: Int
    init(_ balance: [Int]) {
        self.balance += balance
        self.maxCounterNumbser = balance.count
    }
    
    func transfer(_ account1: Int, _ account2: Int, _ money: Int) -> Bool {
        guard account1 >= minCounterNumber && account1 <= maxCounterNumbser else {
            return false
        }
        guard account2 >= minCounterNumber && account2 <= maxCounterNumbser else {
            return false
        }
        guard self.balance[account1] >= money else {
            return false
        }
        self.balance[account1] -= money
        self.balance[account2] += money
        return true
    }
    
    func deposit(_ account: Int, _ money: Int) -> Bool {
        guard account >= minCounterNumber && account <= maxCounterNumbser else {
            return false
        }
        self.balance[account] += money
        return true
    }
    
    func withdraw(_ account: Int, _ money: Int) -> Bool {
        guard account >= minCounterNumber && account <= maxCounterNumbser else {
            return false
        }
        guard self.balance[account] >= money else {
            return false
        }
        self.balance[account] -= money
        return true
    }
}

/**
 * Your Bank object will be instantiated and called as such:
 * let obj = Bank(balance)
 * let ret_1: Bool = obj.transfer(account1, account2, money)
 * let ret_2: Bool = obj.deposit(account, money)
 * let ret_3: Bool = obj.withdraw(account, money)
 */