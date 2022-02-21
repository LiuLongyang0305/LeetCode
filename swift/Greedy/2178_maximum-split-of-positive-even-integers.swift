// https://leetcode.com/problems/maximum-split-of-positive-even-integers/
class Solution {
    func maximumEvenSplit(_ finalSum: Int) -> [Int] {
        guard finalSum & 1 == 0 else {return []}
        var target = finalSum
        var base = 2
        var ans = [Int]()
        while target > 2 * base {
            ans.append(base)
            target -= base
            base += 2
        }
        ans.append(target)
        return ans
    }
}
