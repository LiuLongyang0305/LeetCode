//https://leetcode.com/problems/subarray-sum-equals-k/
class Solution {
    typealias Mark = (sum: Int, target: Int, targetCount: Int)
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        var ans = 0
        var mapSumToCount = [Int:Int]()
        var marks = Array<Mark>(repeating: (0,0,0), count: nums.count)
        var sum = 0
        for i in 0..<nums.count {
            sum += nums[i]
            marks[i].sum = sum
            marks[i].target = k + sum
            if let c = mapSumToCount[k + sum] {
                marks[i].targetCount = c
            } else {
                marks[i].targetCount = 0
            }
            if let c = mapSumToCount[sum] {
                mapSumToCount[sum] = c + 1
            } else {
                mapSumToCount[sum] = 1
            }
        }
        // print(marks)
        // print(mapSumToCount)
        if let c = mapSumToCount[k] {
            ans += c
        }
        for i in 0..<nums.count {
            if let c = mapSumToCount[marks[i].target] {
                ans += c - marks[i].targetCount - (k == 0 ? 1 : 0)
            }
            
        }
        return ans
    }
}