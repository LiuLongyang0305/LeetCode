// https://leetcode.com/problems/4-keys-keyboard/
class Solution {
    var memo: [Int:Int] = [0:0,1:1,2:2,3:3,4:4,5:5]
    func maxA(_ N: Int) -> Int {
        guard N > 5 else {
            return N
        }
        
        let c1 = memo[N - 4] ?? maxA(N - 4)
        let c2 = memo[N - 5] ?? maxA(N - 5)
        let ans = max(3 * c1, 4 * c2)
        memo[N] = ans
        return memo[N]!
    }
}