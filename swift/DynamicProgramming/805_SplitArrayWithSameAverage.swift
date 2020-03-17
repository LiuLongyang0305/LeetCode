//https://leetcode.com/problems/split-array-with-same-average/
class Solution {
    private struct State: Hashable {
        var cnt: Int
        var sum: Double
    }
    func splitArraySameAverage(_ A: [Int]) -> Bool {
        guard A.count > 2 else {
            return A.count < 2 ? false : A[0] == A[1]
        }
        let A2Double = A.map {Double($0)}
        let average: Double = Double(A.reduce(0, {$0 + $1})) / Double(A.count)
        var states = Set<State>()
        states.insert(Solution.State(cnt: 0, sum: 0))
        for i in 0..<A.count {
            var nextLevel = states
            for state in states {
                let nextstate = State(cnt: state.cnt + 1, sum: state.sum + A2Double[i])
                guard nextstate.sum / Double(nextstate.cnt) != average else {
                    return nextstate.cnt != A.count
                }
                nextLevel.insert(nextstate)
            }
            states = nextLevel
        }
        return false
    }
}