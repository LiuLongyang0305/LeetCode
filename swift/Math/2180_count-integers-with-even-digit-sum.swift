// https://leetcode.com/problems/count-integers-with-even-digit-sum/
class Solution {
    private var preffix = [0]
    init() {
        for i in 1...1000 {
            preffix.append(preffix.last! + (isDigitsSumEven(of: i) ? 1 : 0))
        }
    }
    func countEven(_ num: Int) -> Int {
        return preffix[num]
        
    }
    
    private func isDigitsSumEven(of num: Int) -> Bool {
        var sum = 0
        var n = num
        while n > 0 {
            sum += (n % 10)
            n /= 10
        }
        return sum & 1 == 0
    }
}
