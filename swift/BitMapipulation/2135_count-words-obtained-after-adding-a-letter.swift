// https://leetcode.com/problems/count-words-obtained-after-adding-a-letter/
class Solution {
    func wordCount(_ startWords: [String], _ targetWords: [String]) -> Int {
        var startWordsMasks = Set<Int>()
        startWords.forEach { startWordsMasks.insert(caculateMask(of: $0))}
        var ans = 0
        for word in targetWords {
            let mask = caculateMask(of: word)
            for bit in 0..<26 {
                let t = (1 << bit)
                guard mask & t != 0 else {continue}
                guard !startWordsMasks.contains(mask & ~t) else {
                    ans += 1
                    break
                }
            }
        }
        return ans
    }
    private func  caculateMask(of word: String) -> Int {
        return word.reduce(0) { $0 | (1 << (Int($1.asciiValue! - 97)))}
    }
}