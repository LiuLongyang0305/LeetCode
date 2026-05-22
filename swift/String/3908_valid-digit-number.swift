   //https://leetcode.cn/problems/valid-digit-number/
    class Solution {
        func validDigit(_ n: Int, _ x: Int) -> Bool {
            let str = "\(n)"
            let digit:Character = "\(x)".first!
            return str.contains(where: { $0 == digit}) && str.first! != digit
        }
    }
