// https://leetcode.com/problems/find-unique-binary-string/
class Solution {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        let strsSet = Set<String>(nums)
        let N = nums.count
        for num in 0..<(1 << N) {
            var str = String(num,radix: 2)
            if str.count < N {
                str = String(repeating: "0", count: N - str.count) + str
            }
            guard strsSet.contains(str) else {
                return str
            }
        }
        return ""
    }
}