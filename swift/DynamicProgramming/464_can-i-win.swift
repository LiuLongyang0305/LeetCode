// https://leetcode.com/problems/can-i-win/
class Solution {

    func canIWin(_ maxChoosableInteger: Int, _ desiredTotal: Int) -> Bool {
        var memo = [Int:Bool]()

        func dfs(_ visited: Int, _ curTotal: Int) -> Bool {
            if let v = memo[visited] {
                return v
            }
            var ans = false
            for i in 1...maxChoosableInteger {
                if visited & (1 << i) == 0 {   
                    ans = (curTotal + i >= desiredTotal ) || !dfs(visited | (1 << i), curTotal + i)     
                    guard  !ans else {break}
                }
            }
            memo[visited] = ans
            return ans
        }


        guard desiredTotal > maxChoosableInteger else {
            return true
        }

        guard (1...maxChoosableInteger).reduce(0, { $0 + $1}) >= desiredTotal else {return false}
        return dfs(0,0)
    }
}