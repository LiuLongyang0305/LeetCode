//https://leetcode.com/problems/divisor-game/
class Solution {
    func divisorGame(_ N: Int) -> Bool {
        return N % 2 == 0
    }
}

//https://leetcode.com/problems/divisor-game/
class Solution {
    func divisorGame(_ n: Int) -> Bool {

        var memo = [Bool?](repeating: nil, count: n + 1)

        func dfs(_ num: Int) -> Bool {
            guard num > 1 else {
                return false
            }

            if let v = memo[num] {
                return v
            }

            var ans = false
            var i = 1
            while i <= num / i {
                if num % i == 0  {
                    ans = !dfs(num - i)
                    guard !ans else {
                       break
                    }
                    if i != 1 {
                        ans = !dfs(num - num / i)
                    }
                    guard !ans else {
                       break
                    }
                }
                i += 1
            }
            memo[num] = ans
            return ans
        }
        return dfs(n)
    }
}