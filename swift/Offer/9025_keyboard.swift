// https://leetcode-cn.com/problems/Uh984O/
extension Int {
    static var mod: Int {
        return 1_000_000_007
    }
}
class Solution {
    func keyboard(_ k: Int, _ n: Int) -> Int {
        
        
        var memo = [[Int]:Int]()
        
        func helper(_ counter: [Int],_ rest: Int) -> Int {
            guard rest > 0 else {
                return 1
            }
           
            if let c = memo[counter] {
                return c
            }
            var ans = 0
            
            for i in 0..<k {
                if counter[i] > 0 {
                    var newCounter = counter
                    newCounter[i + 1] += 1
                    newCounter[i] -= 1
                    ans += counter[i] * helper(newCounter, rest - 1)
                    ans %= Int.mod
                }
            }
            memo[counter] = ans
            return ans
        }
        
        var counter = Array<Int>(repeating: 0, count: k + 1)
        counter[0] = 26
        
        return helper(counter, n)
    }
}