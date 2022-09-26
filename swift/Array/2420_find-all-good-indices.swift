// https://leetcode.com/problems/find-all-good-indices/
class Solution {
    func goodIndices(_ nums: [Int], _ k: Int) -> [Int] {
        let N = nums.count
        var preffix = [Int](repeating: 1, count: N)
        var suffix = [Int](repeating: 1, count: N)
        var i = 1
        while i < N {
            if nums[i] <= nums[i - 1] {
                preffix[i] = preffix[i - 1] + 1
            }
            i += 1
        }
        i = N - 2
        while i >= 0 {
            if nums[i] <= nums[i + 1] {
                suffix[i] = suffix[i + 1] + 1
            }
            i -= 1
        }
//        print(preffix)
//        print(suffix)
        var ans = [Int]()
        i = k
        while i < N - k {
            if preffix[i - 1] >= k && suffix[i + 1] >= k {
                ans.append(i)
            }
            i += 1
        }
        return ans
    }
}