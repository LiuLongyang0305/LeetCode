// https://leetcode.com/problems/find-the-length-of-the-longest-common-prefix/
class Solution {
    func longestCommonPrefix(_ arr1: [Int], _ arr2: [Int]) -> Int {
        let arr1Strs = arr1.map { "\($0)"}
        let arr2Strs = arr2.map { "\($0)"}
        var l = 0
        var h = 8
        while l < h {
            let mid = (l + h + 1) / 2
            if check(arr1Strs, arr2Strs, mid) {
                l = mid
            } else {
                h = mid - 1
            }
        }
        return l
    }


    private func check(_ strs1: [String], _ strs2:[String], _ length: Int) -> Bool {
        var sets = Set<String>()
        for s in strs1 {
            if s.count >= length {
                sets.insert(String(s.prefix(length)))
            }
        }
        for s in strs2 {
            if s.count >= length {
                let sub = String(s.prefix(length))
                if sets.contains(sub) {
                    return true
                }
            }
        }
        return false
    }
}
