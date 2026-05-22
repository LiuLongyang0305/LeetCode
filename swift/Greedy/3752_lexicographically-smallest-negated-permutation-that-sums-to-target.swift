    // https://leetcode.cn/problems/lexicographically-smallest-negated-permutation-that-sums-to-target/
    class Solution {
        func lexSmallestNegatedPerm(_ n: Int, _ target: Int) -> [Int] {
            let mx = n * (n + 1) / 2
            guard abs(target) <=  mx && (mx - target) & 1 == 0 else {return []}
            var negSum = (mx - target) / 2
            var sb = [Int](repeating: 0, count: n)
            var l = 0
            var r = n - 1

            for x in stride(from: n, to: 0, by: -1) {
                if negSum >= x {
                    negSum -= x
                    sb[l] = -x
                    l += 1
                } else {
                    sb[r] = x
                    r -= 1
                }
            }
            return sb
        }
    }
