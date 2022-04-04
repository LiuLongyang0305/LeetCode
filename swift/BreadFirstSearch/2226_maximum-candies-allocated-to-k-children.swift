    //https://leetcode.com/problems/maximum-candies-allocated-to-k-children/
    class Solution {
        func maximumCandies(_ candies: [Int], _ k: Int) -> Int {
            guard candies.reduce(0, { $0 + $1}) >= k else {return 0}
            var left = 0
            var right = 1_000_000_1

            while left < right {
                let mid = (left + right + 1) >> 1
                if  candies.reduce(0, { $0 + $1 / mid}) >= k {
                    left = mid
                } else {
                    right = mid - 1
                }
            }

            return left
        }
    }