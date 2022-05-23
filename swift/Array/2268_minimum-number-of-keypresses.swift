// https://leetcode.com/problems/minimum-number-of-keypresses/
class Solution {

    func minimumKeypresses(_ s: String) -> Int {
        var counter = [Character:Int]()
        for ch in s {
            counter[ch,default: 0] += 1
        }
        var sortedCounterValues = counter.values.sorted { $0 > $1 }
        var ans = 0
        var cycle = 1
        while !sortedCounterValues.isEmpty {
            let sum = sortedCounterValues.prefix(9).reduce(0) { $0 + $1}
            ans += cycle * sum
            sortedCounterValues.removeFirst(min(9,sortedCounterValues.count))
            cycle += 1
        }


        return ans
    }
}