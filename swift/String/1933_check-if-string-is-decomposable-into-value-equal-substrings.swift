// https://leetcode.com/problems/check-if-string-is-decomposable-into-value-equal-substrings/
class Solution {
    func isDecomposable(_ s: String) -> Bool {
        guard s.count % 3 == 2  else {
            return false
        }
        let chars = [Character](s)
        let N = s.count
        var last = 0
        var isLengthTwoExist = false
        for i in 1..<N {
            if chars[i] != chars[last] {
                guard check(i - last, &isLengthTwoExist) else {
                    return false
                }
                last = i
            }
        }
        return check(N - last, &isLengthTwoExist)
    }
    
    private func check(_ length: Int, _ flag: inout Bool) -> Bool {
        if flag {
            guard length % 3 == 0 else {
                return false
            }
        } else {
            guard length % 3 != 1 else {
                return false
            }
            if length % 3 == 2 {
                flag = true
            }
        }
        return true
    }
}