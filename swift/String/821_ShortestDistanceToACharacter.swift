// https://leetcode.com/problems/shortest-distance-to-a-character/
class Solution {
     func shortestToChar(_ S: String, _ C: Character) -> [Int] {
        var lastCIndex = -1
        var ans = Array<Int>(repeating: Int.max, count: S.count)
        let chars = [Character](S)
        for index in 0..<chars.count {
            if chars[index] == C {
                lastCIndex =  index
                ans[index]  = 0
            } else {
                if lastCIndex != -1 {
                    ans[index] = index - lastCIndex
                }
            }
        }
        lastCIndex = -1
        for index in (0..<chars.count).reversed() {
            if chars[index] == C {
                 lastCIndex =  index
             } else {
                 if lastCIndex != -1 {
                     ans[index] = min(lastCIndex - index,ans[index])
                 }
             }
        }
        return ans
     }
 }