//https://leetcode.com/problems/maximum-number-of-subsequences-after-one-inserting/
class Solution {
    func numOfSubsequences(_ s: String) -> Int {
        var sb = max(clcWhenAddingLetterLOrT("L" + s), clcWhenAddingLetterLOrT(s + "T"),clcWhenAddingLetterC(s))
        return sb
    }


    private func clcWhenAddingLetterLOrT( _ s: String) -> Int {

        var sb = 0
        var lcnt = 0
        var tcnt = s.reduce(0) { $0 + ($1 == "T" ? 1 : 0)}

        for ch in s {
            if ch == "L" {
                lcnt += 1
                continue
            }
            if ch == "T" {
                tcnt -= 1
                continue
            }
            if ch == "C" {
                sb += lcnt * tcnt
            }
        }
        return sb
    }

    private func clcWhenAddingLetterC(_ s: String) -> Int {

        var sb = 0
        var lcnt = 0
        var tcnt = s.reduce(0) { $0 + ($1 == "T" ? 1 : 0)}

        var maxPairsCntDelta = 0
        for ch in s {
            if ch == "L" {
                lcnt += 1
            }
            if ch == "T" {
                tcnt -= 1
            }
            maxPairsCntDelta = max(maxPairsCntDelta,lcnt * tcnt)
            if ch == "C" {
                sb += lcnt * tcnt
            }
        }
        return sb + maxPairsCntDelta
    }
}
