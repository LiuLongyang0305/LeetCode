// https://leetcode.com/problems/distribute-repeating-integers/
class Solution {
    func canDistribute(_ nums: [Int], _ quantity: [Int]) -> Bool {
        let sortedQuantity = quantity.sorted { $0 > $1}
        var counter = [Int:Int]()
        nums.forEach { counter[$0,default: 0 ] += 1}
        var cnt = [Int](counter.values)
        var ans = false
        func dfs(_ curCounter: inout [Int], _ idx: Int) {
            guard !ans else {
                return
            }
            guard idx < sortedQuantity.count  else {
                ans = true
                return
            }
            for i in 0..<curCounter.count {
                let n = curCounter[i]
                if n >= sortedQuantity[idx] {
                    curCounter[i] -= sortedQuantity[idx]
                    dfs(&curCounter, idx + 1)
                    curCounter[i] += sortedQuantity[idx]
                }
            }
        }
        dfs(&cnt, 0)
        return ans
    }
}