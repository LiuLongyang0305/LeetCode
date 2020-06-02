// https://leetcode.com/problems/check-if-a-string-contains-all-binary-codes-of-size-k/
class Solution {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        let maxKind = Int(pow(2.0, Double(k)))
        guard maxKind + k - 1 <= s.count else {
            return false
        }
        var existed = Set<String>()
        var index = s.startIndex
        var endIndex = s.index(index, offsetBy: k - 1)
        while endIndex < s.endIndex {
            existed.insert(String(s[index...endIndex ]))
            guard existed.count < maxKind else {
                return true
            }
            index = s.index(after: index)
            endIndex = s.index(after: endIndex)
        }
        return false
    }
}