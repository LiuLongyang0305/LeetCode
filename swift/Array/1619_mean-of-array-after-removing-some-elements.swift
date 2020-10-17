
// https://leetcode.com/problems/mean-of-array-after-removing-some-elements/
class Solution {
    func trimMean(_ arr: [Int]) -> Double {
        var sortedArr = arr.sorted()
        let N = arr.count
        let toDelete = N / 20
        sortedArr.removeFirst(toDelete)
        sortedArr.removeLast(toDelete)
        return sortedArr.reduce(0.0, {$0 +  Double($1)}) / Double(N - toDelete * 2)
    }
}