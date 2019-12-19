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
 
 
 class Solution2 {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var memo = [Int:Int]()
        func dfs(_ nums: [Int], _ target: Int ) -> Int {
            if target == 0 {
                return 1
            }
            
            if let memoTotal = memo[target] {
                return memoTotal
            }
            
            var combinations = 0
            
            for n in nums {
                guard target - n >= 0 else { continue }
                combinations += dfs(nums, target - n)
            }
            
            memo[target] = combinations
            
            return combinations
        }
        return dfs(nums, target)
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