// https://leetcode.com/problems/egg-drop-with-2-eggs-and-n-floors/
class Solution {
    func twoEggDrop(_ n: Int) -> Int {
        var memo = [[Int]](repeating: [Int](repeating: -1, count: 3), count: n + 1)
        func dfs(_ floors: Int, _ eggs: Int ) -> Int {
            guard eggs > 1 else {return floors}
            guard floors > 0 else {return 0}
            if -1 != memo[floors][eggs] {return memo[floors][eggs]}
            var ans = floors
            
            for i in 1...floors {
                ans = min(ans, 1 + max(dfs(i - 1, eggs - 1), dfs(floors - i, eggs)))
            }
            
            memo[floors][eggs] = ans
            return ans
        }

        return dfs(n, 2)
    }
}