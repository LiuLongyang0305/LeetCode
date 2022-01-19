// https://leetcode.com/problems/minimum-moves-to-reach-target-score/
class Solution {
    func minMoves(_ target: Int, _ maxDoubles: Int) -> Int {
        var  ans = 0
        var t = target
        var remainDoubles = maxDoubles
        while t > 1 {
            if t % 2 == 0 && remainDoubles > 0 {
                t /= 2
                remainDoubles -= 1
                ans += 1
                continue
            }
            if remainDoubles == 0 {
                ans += t - 1
                break
            } else {
                t -= 1
                ans += 1
            }
        }
        return ans
    }
}