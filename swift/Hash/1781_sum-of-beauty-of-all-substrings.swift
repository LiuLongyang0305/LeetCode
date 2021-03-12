// https://leetcode.com/problems/sum-of-beauty-of-all-substrings/
class Solution {
    func beautySum(_ s: String) -> Int {
        var ans = 0
        var counter = [Character:Int]()
        let N = s.count
        let chars = [Character](s)
        for i in 0..<(N - 1) {
            counter[chars[i], default: 0] += 1
            for j in (i + 1)..<N {
                counter[chars[j], default: 0] += 1
                ans += (counter.values.max() ?? 0) - (counter.values.min() ?? 0 )
            }
            counter = [:]
        }
        return ans
    }
}

