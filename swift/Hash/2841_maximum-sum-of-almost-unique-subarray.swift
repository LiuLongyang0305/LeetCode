// https://leetcode.com/problems/maximum-sum-of-almost-unique-subarray
class Solution {
    func maxSum(_ nums: [Int], _ m: Int, _ k: Int) -> Int {
        var counter = [Int:Int]()
        var sum = 0
        for i in 0..<k {
            counter[nums[i],default: 0] += 1
            sum += nums[i]
        }
        let N = nums.count
        var ans = counter.count >= m ? sum : 0

        var next = k
        var toBeRemoveIdx = 0

        while next < N {
            counter[nums[toBeRemoveIdx], default: 0] -= 1
            if let c = counter[nums[toBeRemoveIdx]], c == 0 {
                counter.removeValue(forKey: nums[toBeRemoveIdx])
            }
            counter[nums[next],default: 0] += 1
            sum += -nums[toBeRemoveIdx] + nums[next]
            if counter.count >= m {
                ans = max(ans,sum)
            }
            toBeRemoveIdx += 1
            next += 1
        }

        return ans
    }
}

