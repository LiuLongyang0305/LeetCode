//https://leetcode.com/problems/sum-of-square-numbers/
class Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
        guard c >= 0 else {
            return false
        }
        if c == 0 || c == 1 || c == 2 {
            return true
        }
        let maxEle = Int(sqrt(Double(c)))
        for i in 0...maxEle {
            let b = sqrt(Double(c - i * i))
            if b == Double(Int(b)) {
                return true
            }
        }
        return false
    }
}