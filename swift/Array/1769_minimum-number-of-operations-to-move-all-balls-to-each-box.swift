// https://leetcode.com/problems/minimum-number-of-operations-to-move-all-balls-to-each-box/
class Solution {
    func minOperations(_ boxes: String) -> [Int] {
        let N = boxes.count
        let balls = boxes.map { $0 == "1"}
        var preffix: [Int] = []
        var ballCnt = 0
        for ball in balls {
            preffix.append((preffix.last ?? 0) + ballCnt)
            if ball {
                ballCnt += 1
            }
        }
        var suffix = [Int]()
        ballCnt = 0
        for ball in balls.reversed() {
            suffix.insert((suffix.first ?? 0) + ballCnt, at: 0)
            if ball {
                ballCnt += 1
            }
        }
        return (0..<N).map { preffix[$0] + suffix[$0]}
    }
}