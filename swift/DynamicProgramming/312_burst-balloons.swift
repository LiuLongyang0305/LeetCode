// https://leetcode.com/problems/burst-balloons/
class Solution1 {
    private var memo = [Int:Int]()
    private var nums = [Int]()
    func maxCoins(_ nums: [Int]) -> Int {
        self.memo = [:]
        self.nums = [1] + nums + [1]
        return helper(0,self.nums.count - 1)
    }
    private func helper(_ left: Int, _ right: Int) -> Int {
        guard left < right - 1 else {
            return 0
        }
        let key = left << 32 | right
        if let c = memo[key] {
            return c
        }
        var ans = Int.min
        var j = left + 1
        while j < right {
            let s = nums[j] * nums[left] * nums[right]
            ans = max(ans, s + helper(left, j) + helper(j, right))
            j += 1
        }
        memo[key] = ans
        return ans
    }
}

class Solution {
    func maxCoins(_ nums: [Int]) -> Int {
        guard nums.count != 0 else {
            return 0
        }
        var nums = [1] + nums + [1]
        var table = [[Int]](repeating: [Int](repeating: 0, count: nums.count), count: nums.count)
        for len in 1...(nums.count - 2) {
            for i in 1...(nums.count - 1 - len) {
                let j = i + len - 1
                for k in i...j {
                    table[i][j] = max(
                        table[i][j], 
                        table[i][k - 1] + nums[i - 1] * nums[k] * nums[j + 1]  + table[k + 1][j]
                    );
                }
            }
        }
        return table[1][nums.count - 2]
    }
}