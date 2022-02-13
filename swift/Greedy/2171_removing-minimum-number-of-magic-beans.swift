// https://leetcode.com/problems/removing-minimum-number-of-magic-beans/
class Solution {
    func minimumRemoval(_ beans: [Int]) -> Int {
        let total = beans.reduce(0) {$0 + $1}
        var counter = [Int:Int]()
        beans.forEach { counter[$0,default: 0] += 1}
        let sortedCounter = counter.sorted { $0.key < $1.key}
        let N = beans.count
        var ans = total
        var cnt = 0
        for (bean,c) in sortedCounter {
            ans = min(ans, total - (N - cnt) * bean)
            cnt += c
        }
        return ans
    }
}