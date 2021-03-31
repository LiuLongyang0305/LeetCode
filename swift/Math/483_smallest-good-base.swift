// https://leetcode.com/problems/smallest-good-base/
class Solution {
    func smallestGoodBase(_ n: String) -> String {
        
        let number = Int(n)!
        var ans = number - 1
        
        func check(_ exponent: Int) -> Int? {
            
            let base = Int(pow(Double(number), 1.0 / Double(exponent)))
            guard base > 1 else {
                return nil
            }
            
            var val = 0
            for _ in 0...exponent {
                val = val * base + 1
            }
            return val == number ? base : nil
        }
        
        for exponent in stride(from: 59, through: 2, by: -1) {
            if let base = check(exponent) {
                ans = base
            }
        }
        return "\(ans)"
    }
}