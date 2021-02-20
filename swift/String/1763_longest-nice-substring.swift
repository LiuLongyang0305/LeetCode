// https://leetcode.com/problems/longest-nice-substring/
class Solution {
    func longestNiceSubstring(_ s: String) -> String {
        guard s.count > 1  else {
            return ""
        }
        let chars = [Character](s)
        let N = s.count
        let values = chars.map {$0.asciiValue!}
        
        func valid(_ length: Int) -> String {
            for idx in 0...(N - length) {
                let tempValues = Set<UInt8>(values[idx..<(idx + length)]).sorted()
                // print(tempValues)
                guard tempValues.count % 2 == 0 else {
                    continue
                }
                let M = tempValues.count
                let half = M >> 1
                var flag = true
                for l in 0..<half {
                    guard tempValues[l + half] - tempValues[l] == 32 else  {
                        flag = false
                        break
                    }
                }
                if flag {
                    return String(chars[idx..<(idx + length)])
                }
            }
            return ""
        }
        
        for length in stride(from: N, through: 2, by: -1) {
            let ans = valid(length)
            guard ans.isEmpty else {
                return ans
            }
        }
        return ""
    }
}