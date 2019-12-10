// https://leetcode.com/problems/partition-equal-subset-sum/
 class Solution {
    private var nums = [Int]()
    private var target = -1
    func canPartition(_ nums: [Int]) -> Bool {
        let total = nums.reduce(0) { $0 + $1}
        guard total % 2 == 0 else {
            return false
        }
        
        target = total >> 1
        let maxEle = nums.max()!
        guard maxEle < target else {
            return maxEle == target
        }

        self.nums = nums.sorted(by: {$0 > $1})

        return backtracking(sum: 0, index: 0)
    }
    private func backtracking(sum: Int, index: Int) -> Bool  {
        if  sum == target {
            return true
        }
        if index == nums.count || sum > target{
            return false
        }
        if backtracking(sum: sum + nums[index], index: index + 1){
            return true
        }
        return backtracking(sum: sum, index: index + 1)
    }
 }
 
 class Solution1 {
    func canPartition(_ nums: [Int]) -> Bool {
        let total = nums.reduce(0) { $0 + $1}
        guard total % 2 == 0 else {
            return false
        }
        
        let target = total >> 1
        let maxEle = nums.max()!
        guard maxEle < target else {
            return maxEle == target
        }
        var existSum = Set<Int>()
        existSum.insert(0)
        let sortedNums = nums.sorted {$0 > $1}
        for num in  sortedNums{
            if existSum.contains(target - num) {
                return true
            }
            let temp = existSum
            for sum in temp {
                existSum.insert(num + sum)
            }
        }
        return false
    }
 }
 
 class Solution2 {
    func canPartition(_ nums: [Int]) -> Bool {
        let total = nums.reduce(0) { $0 + $1}
        guard total % 2 == 0 else {
            return false
        }
        
        let target = total >> 1
        let maxEle = nums.max()!
        guard maxEle < target else {
            return maxEle == target
        }
        var dp =  Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: target + 1), count: nums.count)
        dp[0][0] = true
        if nums[0] <= target {
            dp[0][nums[0]] = true
        }
        for i in 1..<nums.count {
            for j in 0...target {
                if dp[i - 1][j]  {
                    dp[i][j] = true
                    if j + nums[i] <= target {
                          dp[i][j + nums[i]] = true
                      }
                }
            }
        }
        var ans = false
        for i in 0..<nums.count {
            ans = ans || dp[i][target]
        }
        return ans
    }
 }
  class Solution3 {
     func canPartition(_ nums: [Int]) -> Bool {
         let total = nums.reduce(0) { $0 + $1}
         guard total % 2 == 0 else {
             return false
         }
         
         let target = total >> 1
         let maxEle = nums.max()!
         guard maxEle < target else {
             return maxEle == target
         }
         var dp =  Array<Bool>(repeating: false, count: target + 1)
         dp[0] = true
         if nums[0] <= target {
             dp[nums[0]] = true
         }
         for i in 1..<nums.count {
            var j = target - nums[i]
            while j >= 0 {
                if dp[j] {
                    dp[j + nums[i]] = true
                }
                j -= 1
            }
         }
        return dp.last!
     }
  }
