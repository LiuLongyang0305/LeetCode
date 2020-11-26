// https://leetcode.com/problems/maximum-gap/
class Solution {
    func maximumGap(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        let N = nums.count
        let minEle = nums.min()!
        let maxEle = nums.max()!
        let d = max(1, (maxEle - minEle) / (N - 1))
        let bucketSize = (maxEle - minEle) / d + 1
        var buckets = Array<Array<Int>>(repeating: [-1,-1], count: bucketSize)
        for idx in 0..<N {
            let bucketIdx = (nums[idx] - minEle) / d
            buckets[bucketIdx] = buckets[bucketIdx][0] == -1 ? [nums[idx],nums[idx]] : [min(buckets[bucketIdx][0], nums[idx]),max(buckets[bucketIdx][1], nums[idx])]
        }
        var ans = 0
        var pre = -1
        for bucket in buckets {
            guard bucket[0] != -1 else {
                continue
            }
            guard pre != -1 else {
                pre = bucket[1]
                continue
            }
            ans = max(ans, bucket[0] - pre)
            pre = bucket[1]
        }
        
        return ans
    }
}

