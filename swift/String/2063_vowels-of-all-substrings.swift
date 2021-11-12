 // https://leetcode.com/problems/vowels-of-all-substrings/
class Solution {
    private let vowels: Set<Character> = ["a","e","i","o","u"]
    func countVowels(_ word: String) -> Int {
        
        var cnt: Int = 0
        var c = 0
        var last = 0
        for ch in word {
            if vowels.contains(ch) {
                c += 1
            }
            last += c
        }
        let N = word.count
        var idx = 0
        for ch in word {
            cnt += last
            if vowels.contains(ch) {
                last -= (N - idx)
            }
            idx += 1
        }
        return cnt
    }
}