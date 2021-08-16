 // https://leetcode.com/problems/array-with-elements-not-equal-to-average-of-neighbors/
class Solution1 {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var ans = nums.shuffled()
        while !check(ans) {
            ans.shuffle()
        }
        return ans
    }
    private func check(_ nums: [Int]) -> Bool {
        let N = nums.count
        for i in 2..<N  {
            guard nums[i] + nums[i - 2] != 2 * nums[i - 1] else {
                return false
            }
        }
        return true
    }
}

class Solution {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        let sortedNums = nums.sorted()
        var ans = [Int]()
        var left = 0
        var right = (nums.count + 1) >> 1
        while ans.count < nums.count {
            ans.append(sortedNums[left])
            left += 1
            if right < nums.count {
                ans.append(sortedNums[right])
                right += 1
            }
        }
        return ans
    }
}