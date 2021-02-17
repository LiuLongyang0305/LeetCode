// https://leetcode.com/problems/minimum-changes-to-make-alternating-binary-string/
extension Character {
    var next: Character {
        return self == "0" ? "1" : "0"
    }
}

class Solution {
    
    func minOperations(_ s: String) -> Int {
        guard s.count > 1 else { return  0}
        return min(getOPerationsCount(s, "0"),getOPerationsCount(s, "1"))
    }

    private func getOPerationsCount(_ s: String,_ startWith: Character) -> Int {
        var cnt = 0
        var idx = s.startIndex
        var last = startWith.next
        while idx < s.endIndex {
            if s[idx] != last.next {
                cnt += 1
            }
            last = last.next
            idx = s.index(after: idx)
        }
        return cnt
    }
}