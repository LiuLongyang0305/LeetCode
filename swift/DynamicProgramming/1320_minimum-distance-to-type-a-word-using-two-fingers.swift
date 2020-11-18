// https://leetcode.com/problems/minimum-distance-to-type-a-word-using-two-fingers/
class Solution {
    private struct State: Hashable {
        var left: Int
        var right: Int?
        var idx: Int
    }
    func minimumDistance(_ word: String) -> Int {
        guard word.count > 2 else {
            return 0
        }
        let wordsToInt = word.map { Int($0.asciiValue!) - 65}
        let N = wordsToInt.count
        var memo = [State:Int]()
        func recursionOfTwoFingers(_ l: Int, _ r: Int?, _ nextIndex: Int) -> Int {
            guard nextIndex < N  else {
                return 0
            }
            let key = State(left: l, right: r, idx: nextIndex)
            guard nil == memo[key] else {
                return memo[key]!
            }
            // move left finger
            var minSteps = recursionOfTwoFingers(wordsToInt[nextIndex], r, nextIndex + 1) + getDis(wordsToInt[nextIndex], l)
            // move right finger
            if let rightFinger = r {
                minSteps = min(minSteps, recursionOfTwoFingers(l, wordsToInt[nextIndex], nextIndex + 1) + getDis(wordsToInt[nextIndex], rightFinger))
            } else {
                minSteps = min(minSteps, recursionOfTwoFingers(l, wordsToInt[nextIndex], nextIndex + 1))
            }
            memo[key] = minSteps
            return minSteps
        }
        return recursionOfTwoFingers(wordsToInt[0], nil, 1)
    }
    private func getDis(_ from: Int, _ to: Int) -> Int {
        return abs(from / 6 - to / 6) + abs(from % 6 - to % 6)
    }
}