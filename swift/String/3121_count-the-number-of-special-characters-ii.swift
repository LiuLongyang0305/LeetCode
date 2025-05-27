//https://leetcode.com/problems/count-the-number-of-special-characters-ii/
class Solution {
    let lowercases = [Character]("abcdefghijklmnopqrstuvwxyz")
    let uppercases = [Character]("abcdefghijklmnopqrstuvwxyz".uppercased())
    func numberOfSpecialChars(_ word: String) -> Int {
        let chars = [Character](word)
        var lowercaseLastIndex = [Character:Int]()
        var uppercaseFirstIndex = [Character:Int]()
        for i in 0..<chars.count {
            if chars[i].isLowercase {
                lowercaseLastIndex[chars[i]] = i
            } else {
                if let idx = uppercaseFirstIndex[chars[i]] {

                } else {
                    uppercaseFirstIndex[chars[i]] = i
                }
            }
        }
        var ans = 0
        for idx in 0..<26 {
            let (l,u) = (lowercases[idx],uppercases[idx])
            guard let lastIdx = lowercaseLastIndex[l], let firstIdx = uppercaseFirstIndex[u] else {continue}
            if lastIdx < firstIdx {
                ans += 1
            }
        }
        return ans
    }
}
