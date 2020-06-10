// https://leetcode.com/problems/number-of-digit-one/
class Solution {
    func countDigitOne(_ n: Int) -> Int {
        guard n >= 1 else {
            return 0
        }
        let len = getLenOfNum(n)
        guard len > 1 else {
            return 1
        }
        let temp1 = powerBaseofTen(len - 1)
        let first = n / temp1
        let firstOneNum = first == 1 ? n % temp1 + 1 : temp1
        let otherOneNum = first * (len - 1) * (temp1 / 10)
        
        return firstOneNum + otherOneNum + countDigitOne(n % temp1)
    }
    
    private func getLenOfNum(_ num: Int) -> Int {
        var len = 0
        var temp = num
        while temp != 0 {
            len += 1
            temp /= 10
        }
        return len
    }
    
    private func powerBaseofTen(_ base: Int) -> Int {
        return Int(pow(10, Double(base)))
    }
}

