//https://leetcode.cn/problems/count-elements-with-at-least-k-greater-values/
    class Solution {
        func countElements(_ nums: [Int], _ k: Int) -> Int {
            var counter = [Int:Int]()
            nums.forEach { counter[$0,default: 0] += 1}
            let sortedCounter = counter.sorted { $0.key > $1.key}
            var sum = 0
            let N = sortedCounter.count
            var i = 0
            while sum < k {
                sum += sortedCounter[i].value
                i += 1
            }
            return nums.count - sum
        }
    }
