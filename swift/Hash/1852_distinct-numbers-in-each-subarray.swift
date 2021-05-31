// https://leetcode.com/problems/distinct-numbers-in-each-subarray/
class Solution {
    func distinctNumbers(_ nums: [Int], _ k: Int) -> [Int] {
        var counter = [Int:Int]()
        var ans = [Int]()
        for idx in 0..<k {
            counter[nums[idx], default: 0] += 1
        }
        ans.append(counter.count)
        var right = k
        while right < nums.count {
            let left = right - k
            if let c = counter[nums[left]] {
                if c == 1 {
                    counter.removeValue(forKey: nums[left])
                } else {
                    counter[nums[left]] = c - 1
                }
            }
            counter[nums[right], default: 0] += 1
            ans.append(counter.count)
            right += 1
        }
        return ans
    }
}
