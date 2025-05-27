// https://leetcode.com/problems/maximum-good-subarray-sum/
class Solution {
    private let MIN = -1_000_000_000_000_00
    func maximumSubarraySum(_ nums: [Int], _ k: Int) -> Int {
        var preffix = [0] + nums
        for i in 0..<nums.count {
            preffix[i + 1] = preffix[i] + nums[i]

        }


        var map = [Int:[Int]]()
        var ans = MIN
        for i in 0..<nums.count {
            if let indices1 =  map[nums[i] + k] {
                for j in indices1 {
                    ans = max(ans,preffix[i + 1] - preffix[j])
                }
            }
            if let indices2 = map[nums[i] - k] {
                for j in indices2 {
                    ans = max(ans,preffix[i + 1] - preffix[j])
                }
            }
            map[nums[i],default: []].append(i)
        }

        return ans == MIN ? 0 : ans
    }
}
