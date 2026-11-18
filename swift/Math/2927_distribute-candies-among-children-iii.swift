    // https://leetcode.cn/problems/distribute-candies-among-children-iii/
    class Solution {
        func distributeCandies(_ n: Int, _ limit: Int) -> Int {
            return cal(n + 2) - 3 * cal(n - limit + 1) + 3 * cal(n - 2 * limit) -  cal( n - 3 * limit - 1)
        }

        private func cal(_ n: Int) -> Int {
            return n > 1 ? (n * (n - 1) / 2) : 0
        }
    }
