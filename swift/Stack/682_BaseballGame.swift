//https://leetcode.com/problems/baseball-game/
class Solution {
    func calPoints(_ ops: [String]) -> Int {
        var ans = 0
        var scores = Array<Int>()
        for op in ops {
            var currentRound = 0
            switch op {
            case "+":
                let length = scores.count
                currentRound = scores[length - 1] + scores[length - 2]
                scores.append(currentRound)
            case "D":
                currentRound  = scores.last! * 2
                scores.append(currentRound)
            case "C":
                currentRound = -scores.removeLast()
            default:
                currentRound = Int(op)!
                scores.append(currentRound)
            }
            ans += currentRound
        }
        return ans
    }
}
