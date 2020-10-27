// https://leetcode.com/problems/slowest-key/
class Solution {
    func slowestKey(_ releaseTimes: [Int], _ keysPressed: String) -> Character {
        var idx = 0
        var maxPressTime = Int.min
        var ans: Character = " "
        for ch in keysPressed {
            let pressTime = idx == 0 ? releaseTimes[0] : (releaseTimes[idx] - releaseTimes[idx - 1])
            //print(pressTime)
            if pressTime < maxPressTime {
                idx += 1
                continue
            }
            if pressTime > maxPressTime {
                maxPressTime = pressTime
                ans = ch
            } else {
                if ch > ans {
                    ans = ch
                }
            }
            idx += 1
        }
        return ans
    }
}