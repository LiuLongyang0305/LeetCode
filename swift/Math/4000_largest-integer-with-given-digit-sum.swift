// https://leetcode.cn/problems/largest-integer-with-given-digit-sum/
class Solution {
    func largestInteger(_ n: Int, _ s: Int) -> Int {
        var sb = 0
        var remainS = s
        for _ in 0..<n {
            sb = 10 * sb + min(remainS,9)
            remainS -= min(remainS,9)
        }
        return remainS == 0 ? sb : -1
    }
}
