//https://leetcode.cn/problems/smallest-stable-index-ii/
class Solution {
    func firstStableIndex(_ nums: [Int], _ k: Int) -> Int {
        var preffixMax = nums
        var suffixMin = nums
        let N = nums.count
        for i in stride(from: 1, to: N, by: 1) {
            if preffixMax[i] < preffixMax[i - 1] {
                preffixMax[i] = preffixMax[i - 1]
            }
        }
        for i in stride(from: N - 2, through: 0, by: -1) {
            if suffixMin[i] > suffixMin[i + 1] {
                suffixMin[i] = suffixMin[i + 1]
            }
        }
        // print(preffixMax)
        // print(suffixMin)
        for i in 0..<N {
            if preffixMax[i] - suffixMin[i] <= k {
                return i
            }
        }
        return -1
    }
}
