// https://leetcode.com/problems/count-substrings-that-differ-by-one-character/
class Solution {
    private typealias ReturnResult = [String:[Int]]
    private var sChars = [Character]()
    private var tChars = [Character]()
    
    func countSubstrings(_ s: String, _ t: String) -> Int {
        self.sChars = [Character](s)
        self.tChars = [Character](t)
        
        var ans = 0
        let N = s.count
        
        for length in 1...N {
            ans += check(length)
        }
        return ans
    }
    private func getSubstringCounter(by length: Int, source: [Character]) -> ReturnResult {
        guard length <= source.count else {
            return [:]
        }
        var ans = ReturnResult()
        let N = source.count
        for left in 0...(N - length) {
            let right = left + length - 1
            var chars = [Character](source[left...right])
            for idx in 0..<length {
                let ch = chars[idx]
                let chIdx = Int((ch.asciiValue! - 97))
                chars[idx] = "*"
                let key = String(chars)
                ans[key, default: Array<Int>(repeating: 0, count: 26)][chIdx] += 1
                chars[idx] = ch
            }
        }
        return ans
    }
    private func check(_ length: Int) -> Int {
        var ans = 0
        let sCounter = getSubstringCounter(by: length, source: sChars)
        let tCounter = getSubstringCounter(by: length, source: tChars)
        for (subStrMaskOfS,sCounter) in sCounter {
            guard let tCounter = tCounter[subStrMaskOfS] else {
                continue
            }
            let total = tCounter.reduce(0) { $0 + $1}
            (0...25).forEach { (idx) in
                if sCounter[idx] > 0 {
                    ans += sCounter[idx] * (total - tCounter[idx])
                }
            }
        }
        return ans
    }
}