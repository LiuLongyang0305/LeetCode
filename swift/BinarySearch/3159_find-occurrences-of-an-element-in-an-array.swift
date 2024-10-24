// https://leetcode.cn/problems/find-occurrences-of-an-element-in-an-array/
class Solution {
    func occurrencesOfElement(_ nums: [Int], _ queries: [Int], _ x: Int) -> [Int] {
        var indices = [Int]()
        for idx in 0..<nums.count {
            if nums[idx] == x {
                indices.append(idx)
            }
        }

        func check(_ target: Int) -> Int {
            guard target > 0 && target <= indices.count else {return -1}
            return indices[target - 1]

        }
        var ans = [Int]()
        for query in queries {
            ans.append(check(query))
        }

        return ans
    }
}