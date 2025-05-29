//https://leetcode.com/problems/count-of-substrings-containing-every-vowel-and-k-consonants-i/
class Solution {
    private let vowels: Set<Character> = ["a","e","i","o","u"]
    func countOfSubstrings(_ word: String, _ k: Int) -> Int {

        let chars = [Character](word)
        return operate(chars, k) - operate(chars, k + 1)
    }

    private func  operate(_ chars: [Character], _ notVowelsCntLimit: Int) -> Int {
        let N = chars.count
        var i = 0
        var j = 0
        var existVowelsCnt = [Character:Int]()
        var notVowelsCnt = 0
        var ans = 0
        while i < N {
            while j < N && (existVowelsCnt.count < 5 || notVowelsCnt < notVowelsCntLimit) {
                if vowels.contains(chars[j]) {
                    existVowelsCnt[chars[j],default: 0] += 1
                } else {
                    notVowelsCnt += 1
                }
                j += 1
            }

            if  existVowelsCnt.count == 5 && notVowelsCnt >= notVowelsCntLimit {
                ans += N - j + 1
            }
            //向后移
            if vowels.contains(chars[i]) {
                existVowelsCnt[chars[i],default: 0] -= 1
                if let v = existVowelsCnt[chars[i]], v == 0 {
                    existVowelsCnt.removeValue(forKey: chars[i])
                }
            } else {
                notVowelsCnt -= 1
            }
             i += 1
        }
        print(ans)
        return ans
    }
}
