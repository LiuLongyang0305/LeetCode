// https://leetcode.com/problems/minimum-deletions-to-make-string-balanced/
class Solution {
    private typealias CharCounter = (a:Int,b:Int)
    func minimumDeletions(_ s: String) -> Int {
        var ans = Int.max
        var total: CharCounter = (0,0)
        for ch in s {
            if ch == "a" {
                total.a += 1
            } else {
                total.b += 1
            }
        }
        var currentCnt: CharCounter = (0,0)
        for ch in  s {
            if ch == "a" {
                currentCnt.a += 1
            } else {
                currentCnt.b += 1
            }
            ans = min(ans, currentCnt.b + total.a - currentCnt.a)
        }
        return min(ans,total.a,total.b)
    }
}