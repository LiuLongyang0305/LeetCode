//https://leetcode.cn/problems/minimum-positive-sum-subarray
class Solution {
    func minimumSumSubarray(_ nums: [Int], _ l: Int, _ r: Int) -> Int {
        var preffix = [0]
        var s = 0
        for num in nums {
            s += num
            preffix.append(s)
        }
        // print(preffix)
        var ans = Int.max
        for i in 0..<nums.count {
            var j = i + l - 1
            while j < i + r && j < nums.count {
                let t = preffix[j + 1] - preffix[i]
                if t > 0 {
                    // print("\(i) -->   \(j)")
                    ans = min(ans,t)
                }
                j += 1
            }
        }
        return ans == Int.max ? -1 : ans
    }
}