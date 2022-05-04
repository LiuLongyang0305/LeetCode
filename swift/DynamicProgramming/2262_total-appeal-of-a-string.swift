// https://leetcode.com/problems/total-appeal-of-a-string/
class Solution {
    func appealSum(_ s: String) -> Int {

        let chars = [Character](s)
        let N = s.count
        var lastIndex = [Int](repeating: -1, count: 26)
        var sumG = 0
        var ans = 0

        for i in 0..<N {
            let idx = Int(chars[i].asciiValue!) - 97
            sumG += i - lastIndex[idx]
            ans += sumG
            lastIndex[idx] = i
        }

        return ans
    }
}