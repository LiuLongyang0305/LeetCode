// https://leetcode.com/problems/largest-number-after-digit-swaps-by-parity/
class Solution {
    func largestInteger(_ num: Int) -> Int {
        
        guard num >= 10 else {return num}
        var oddDigits = [Int]()
        var evenDigits = [Int]()
        var numDigits = [Int]()
        var t = num

        while t > 0 {
            let m = t % 10
            numDigits.insert(m, at: 0)
            t /= 10
            if m & 1 == 0 {
                evenDigits.append(m)
            } else {
                oddDigits.append(m)
            }
        }

        evenDigits.sort { $0 > $1}
        oddDigits.sort { $0 > $1}
        var ans = 0
        for t in numDigits {
            ans *= 10
            ans += (t & 1 == 0 ? evenDigits.removeFirst() : oddDigits.removeFirst())
        }
        return ans
    }
}