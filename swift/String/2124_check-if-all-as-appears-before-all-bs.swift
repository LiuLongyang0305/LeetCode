// https://leetcode.com/problems/check-if-all-as-appears-before-all-bs/
class Solution {
    func checkString(_ s: String) -> Bool {
        guard let lastIndexOfA = s.lastIndex(of: "a") else {return true}
        guard let firstIndexOfB = s.firstIndex(of: "b") else {return true}
        return lastIndexOfA < firstIndexOfB
    }
}