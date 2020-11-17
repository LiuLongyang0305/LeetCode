// https://leetcode.com/problems/distribute-repeating-integers/
class Solution {
    private struct State: Hashable {
        var idx: Int
        var counter: [Int:Int]
    }
    func canDistribute(_ nums: [Int], _ quantity: [Int]) -> Bool {
        guard nums.reduce(0, {$0 + $1}) >= quantity.reduce(0, {$0 + $1}) else { return false }
        var counter = [Int:Int]()
        nums.forEach { counter[$0, default: 0] += 1}
        let sortedQuantity = quantity.sorted()
        let N = quantity.count
        var memo = [State:Bool]()
        func backtracking(_ idx:Int, _ numsCounter: [Int:Int]) -> Bool {
            guard idx < N else {
                return true
            }
            let key = State(idx: idx, counter: counter)
            guard memo[key] == nil else {
                return memo[key]!
            }
            for (num,cnt) in numsCounter {
                if cnt >= sortedQuantity[idx] {
                    var tempCounter = numsCounter
                    tempCounter.updateValue(cnt - sortedQuantity[idx], forKey: num)
                    guard !backtracking(idx + 1, tempCounter) else {
                        memo[key] = true
                        return true
                    }
                }
            }
            memo[key] = false
            return false
        }
        return backtracking(0, counter)
    }
}