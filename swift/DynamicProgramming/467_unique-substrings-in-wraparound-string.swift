// https://leetcode.com/problems/unique-substrings-in-wraparound-string/
class Solution {
    func findSubstringInWraproundString(_ p: String) -> Int {
        let pToNums = p.map {Int($0.asciiValue!) - 97}
        var dp = Array<Int>(repeating: 0, count: 26)
        let N = p.count
        var k = 0
        for idx in 0..<N {
            if idx > 0 && (pToNums[idx - 1] + 1 == pToNums[idx] || (pToNums[idx - 1] == 25 && pToNums[idx] == 0)){
                k += 1
            } else {
                k = 1
            }
            if k > dp[pToNums[idx]] {
                dp[pToNums[idx]] = k
            }
        }
        return dp.reduce(0) { $0 + $1}
    } 
}