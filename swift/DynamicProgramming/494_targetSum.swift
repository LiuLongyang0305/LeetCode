// https://leetcode.com/problems/target-sum/
class Solution {
    func findTargetSumWays(_ nums: [Int], _ S: Int) -> Int {
        guard nums.count > 1 else {
            return (nums[0] == S  ? 1 : 0) + (nums[0] == -S ? 1 : 0)
        }
        var current = [Int:Int]()
        var last: [Int:Int] = [0:1]
        for num in nums {
            current = [:]
            for (preAns,count) in last {
                var ans = preAns + num
                if  let c = current[ans] {
                    current.updateValue(c + count, forKey: ans)
                } else {
                    current.updateValue(count, forKey: ans)
                    
                }
                ans = preAns - num
                if  let c = current[ans] {
                    current.updateValue(c + count, forKey: ans)
                } else {
                    current.updateValue(count, forKey: ans)
                    
                }
            }
            last = current
        }
        return last[S] ?? 0
    }
 }