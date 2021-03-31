// https://leetcode.com/problems/maximum-score-from-removing-stones/
class Solution {
    func maximumScore(_ a: Int, _ b: Int, _ c: Int) -> Int {
        let s = a + b + c
        return min(s - max(a,b,c),s >> 1)
    }
}