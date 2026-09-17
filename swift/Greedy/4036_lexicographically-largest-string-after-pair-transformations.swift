// https://leetcode.cn/problems/lexicographically-largest-string-after-pair-transformations/
class Solution {
    let lowercaseLetters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    func largestString(_ nums: [Int]) -> [String] {
        return nums.map { solve($0) }
    }
    private func solve(_ num: Int) -> String {
        var sb = ""
        var temp = num
        let zCnt = temp >> 25
        if zCnt > 0 {
            sb = String(repeating: "z", count: zCnt)
            temp = temp % (1 << 25)
        }
        let bitWidth = num.bitWidth
        for i in stride(from: bitWidth - temp.leadingZeroBitCount, through: 0, by: -1) {
            if temp & (1 << i) != 0 {
                sb.append("\(lowercaseLetters[i])")
            }
        }
        return sb
    }
}
