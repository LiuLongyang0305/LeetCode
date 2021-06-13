// https://leetcode.com/problems/redistribute-characters-to-make-all-strings-equal/
class Solution {
    func makeEqual(_ words: [String]) -> Bool {
        var counter = [Character:Int]()
        let N = words.count
        for word in words {
            for ch in word {
                counter[ch, default: 0 ] += 1
            }
        }
        for (_,cnt) in counter {
            guard cnt % N == 0 else {
                return false
            }
        }
        return true
    }
}