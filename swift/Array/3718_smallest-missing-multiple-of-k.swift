// https://leetcode.cn/problems/smallest-missing-multiple-of-k/
class Solution {
    func missingMultiple(_ nums: [Int], _ k: Int) -> Int {
        var sb = k
        let set = Set<Int>(nums)
        while set.contains(sb) {
            sb += k
        }
        return sb
    }
}

