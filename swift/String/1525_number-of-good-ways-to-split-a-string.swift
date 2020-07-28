// https://leetcode.com/problems/number-of-good-ways-to-split-a-string/
class Solution {
    func numSplits(_ s: String) -> Int {
        guard s.count > 1 else {
            return 0
        }
        var ans = 0
        var prefix =  Array<Int>()
        var set = Set<Character>()
        for ch in s {
            if !set.contains(ch) {
                set.insert(ch)
            }
            prefix.append(set.count)
        }
        set = []
        var suffix = Array<Int>(repeating: 0, count: s.count)
        var i = s.count - 1
        for ch in s.reversed() {
            if !set.contains(ch) {
                set.insert(ch)
            }
            suffix[i] =  set.count
            i -= 1
        }
        for i in 0..<(s.count - 1) {
            if  prefix[i] == suffix[i + 1] {
                ans += 1
            }
        }
        return ans
    }
}


