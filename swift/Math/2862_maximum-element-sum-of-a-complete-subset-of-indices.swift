// https://leetcode.cn/problems/maximum-element-sum-of-a-complete-subset-of-indices/
class Solution {
    func maximumSum(_ nums: [Int]) -> Int {
        var coreToSum = [Int:Int]()
        for i in 0..<nums.count {
            coreToSum[getCoreValues(of: i + 1),default: 0] += nums[i]
        }
        return coreToSum.values.max()!
    }

    private func getCoreValues(of idx: Int) -> Int{

        var t = idx
        var i = 2
        while i * i <= t {
            while t % (i * i) == 0 {
                t = t / (i * i)
            }
            i += 1
        }
        return t
    }
}
