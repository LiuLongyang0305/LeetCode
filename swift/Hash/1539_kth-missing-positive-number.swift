// https://leetcode.com/problems/kth-missing-positive-number/
class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        let set = Set<Int>(arr)
        var i = 1
        var cnt = 0
        while true {
            if !set.contains(i) {
                cnt += 1
                if cnt == k {
                    return i
                }
            }
            i += 1
        }
    }
}

