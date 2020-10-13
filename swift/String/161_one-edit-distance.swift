// https://leetcode-cn.com/problems/one-edit-distance/
class Solution {
    private func checkOnLengthEqual(_ s: String, _ t: String) -> Bool {
        
        let sChars = [Character](s)
        let tChars = [Character](t)
        
        var i = 0
        while i < s.count && sChars[i] == tChars[i]{
            i += 1
        }
        guard i < s.count else {
            return false
        }
        i += 1
        while i < s.count && sChars[i] == tChars[i]{
            i += 1
        }
        return i == s.count
    }
    private func checkOnLengthNotEqual(_ s: String, _ t: String) -> Bool {
        guard abs(s.count - t.count) == 1 else {
            return false
        }
        var longer = [Character]()
        var shorter = [Character]()
        if s.count > t.count {
            longer = [Character](s)
            shorter = [Character](t)
        } else {
            longer = [Character](t)
            shorter = [Character](s)
        }
        for i in 0..<shorter.count {
            if shorter[i] != longer[i] {
                return longer[(i + 1)...] == shorter[i...]
            }
        }
        return true
    }
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        return s.count == t.count ? checkOnLengthEqual(s, t) : checkOnLengthNotEqual(s, t)
    }
}
