//https://leetcode.com/problems/maximize-active-section-with-trade-i/
class Solution {
    private typealias Pair = (val:Character,cnt:Int)
    func maxActiveSectionsAfterTrade(_ s: String) -> Int {
        var pairs = [Pair]()
        let chars = ["1"] + [Character](s) + ["1"]
        let N = chars.count
        let oneCnt = chars.reduce(0) { $0 + ($1 == "1" ? 1 : 0)}
        var i = 0
        var j = 0
        while i < N {
            while j < N && chars[j] == chars[i] {
                j += 1
            }
            pairs.append((chars[i],j - i))
            i = j
        }

        // print("\(pairs)    one = \(oneCnt)")

        var ans = oneCnt
        for i in stride(from: 1, to: pairs.count - 1, by: 1) {
            if pairs[i].val == "1" && pairs[i - 1].val == "0" && pairs[i + 1].val == "0" {
                ans = max(ans, oneCnt + pairs[i - 1].cnt + pairs[i + 1].cnt)
            }
        }

        return ans - 2
    }
}
