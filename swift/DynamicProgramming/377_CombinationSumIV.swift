 //https://leetcode.com/problems/combination-sum-iv/
 //backtracking: TLE
 class Solution1 {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var ans = 0
        let sortedNumbers = nums.sorted()
        func backtracking(_ currentSum: Int) {
            for num in sortedNumbers {
                let nextSum = currentSum + num
                if nextSum > target {
                    break
                }
                
                if nextSum == target {
                    ans += 1
                } else {
                    backtracking(nextSum)
                }
                
            }
        }
        backtracking(0)
        return ans
    }
 }
 //DP:执行出错
 class Solution2 {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        let sortedNumbers = nums.sorted()
        var dp = Array<Int>(repeating: -1, count: target + 1)
        dp[0] = 1
        
        func helper(targetSum: Int) ->  Int {
            guard dp[target]  == -1 else {
                return dp[target]
            }
            var ans = 0
            for num in sortedNumbers {
                if target >= num {
                    ans += helper(targetSum: targetSum - num)
                }
            }
            dp[targetSum] = ans
            return ans
        }
        
        return Int(helper(targetSum: target))
    }
 }
 class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        let sortedNumbers = nums.sorted()
        var dp = Array<Double>(repeating: 0, count: target + 1)
        dp[0] = 1
        for sum in 1...target {
            for num in sortedNumbers {
                if sum - num >= 0 {
                    dp[sum] += dp[sum - num]
                }
            }
        }
        return Int(dp[target])
    }
 }
 Solution().combinationSum4([3,33,333], 10000)