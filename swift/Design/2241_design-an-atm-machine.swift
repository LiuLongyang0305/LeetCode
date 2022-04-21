//  https://leetcode.com/problems/design-an-atm-machine/
class ATM {

    init() {

    }

    private var counter = [Int:Int]()
    private let banknote = [500,200,100,50,20]
    func deposit(_ banknoteCount: [Int]) {
        counter[20, default: 0] += banknoteCount[0]
        counter[50, default: 0] +=  banknoteCount[1]
        counter[100, default: 0] +=  banknoteCount[2]
        counter[200,default: 0] += banknoteCount[3]
        counter[500,default: 0] += banknoteCount[4]
    }

    func withdraw(_ amount: Int) -> [Int] {

        var curCounter = [Int:Int]()
        var t = amount


        for banknote in banknote {
            guard t >= banknote else {continue}
            guard let cnt = counter[banknote] else {continue}
            if cnt * banknote > t {
                curCounter[banknote] = t / banknote
                t -= banknote * (curCounter[banknote] ?? 0)
            } else {
                curCounter[banknote] = cnt
                t -= banknote * cnt
            }
        }

        guard t == 0 else {return [-1]}

        for (banknote,c) in curCounter {
            counter[banknote, default: 0] -= c
        }
        return [curCounter[20] ?? 0,curCounter[50] ?? 0,curCounter[100] ?? 0,curCounter[200] ?? 0,curCounter[500] ?? 0]
    }
}



/**
 * Your ATM object will be instantiated and called as such:
 * let obj = ATM()
 * obj.deposit(banknotesCount)
 * let ret_2: [Int] = obj.withdraw(amount)
 */