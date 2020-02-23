// https://leetcode.com/problems/reduce-array-size-to-the-half/ 
class Solution {
    func minSetSize(_ arr: [Int]) -> Int {
        var counter = [Int:Int]()
        arr.forEach {
            counter.updateValue((counter[$0] ?? 0) + 1, forKey: $0)
        }
        let sortedCounter = counter.values.sorted {$0 > $1}
        var ans = 0
        var index = 0
        var totalCount = 0
        while ans < (arr.count >> 1) {
            ans += sortedCounter[index]
            index += 1
            totalCount += 1
        }
        return totalCount
    }
 }

