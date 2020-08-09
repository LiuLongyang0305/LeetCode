// https://leetcode.com/problems/maximum-number-of-non-overlapping-subarrays-with-sum-equals-target/
class Solution {
    func maxNonOverlapping(_ nums: [Int], _ target: Int) -> Int {
        var last = 0
        var cnt = 0
        var map = [Int:[Int]]()
        map[0] = [-1]
        var ans = 0
        var visitedMaxIndex: Int? = nil
        
        for num in nums {
            let sum = num + last
            if let indices = map[sum - target] {
                for index in indices {
                    if let i = visitedMaxIndex {
                        if i <= index {
                            ans += 1
                            visitedMaxIndex = cnt
                        }
                    } else {
                        ans += 1
                        visitedMaxIndex = cnt
                    }
                }
            }
            map[sum,default: []  ].append(cnt)
            cnt += 1
            last = sum
        }
        
        return ans
    }
}