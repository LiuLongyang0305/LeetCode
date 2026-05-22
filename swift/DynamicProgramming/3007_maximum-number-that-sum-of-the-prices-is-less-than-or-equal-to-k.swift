// https://leetcode.com/problems/maximum-number-that-sum-of-the-prices-is-less-than-or-equal-to-k/
class Solution {
    private struct KeyNode: Hashable {
        var pos: Int
        var isLessThan: Bool
        var score: Int
    }
    func findMaximumNumber(_ k: Int, _ x: Int) -> Int {
        var l = 0
        var r = (k + 1) << x
        while l < r {
            let mid = (l + r + 1) >> 1
            if check(k, x, mid) {
                l = mid
            } else {
                r = mid - 1
            }
        }
        return l
    }

    private func check(_ k: Int, _ x: Int, _ num: Int) -> Bool {

        let digits = getDigits(of: num)
        let M = digits.count

        var memo = [KeyNode:Int]()
        func dfs(_ pos: Int, _ isLessThan: Bool, _ score: Int) -> Int {
            guard pos < M else {return score}
            let key = KeyNode(pos: pos, isLessThan: isLessThan, score: score)
            if let sb = memo[key] {
                return sb
            }
            let high = isLessThan ? 1 : digits[pos]
            var sb = 0
            for d in 0...high {
                sb +=  dfs(pos + 1, isLessThan || d < digits[pos], ((d == 1 && (M  - pos) % x == 0) ? 1 : 0) + score )
            }
            memo[key] = sb
            return sb
        }


        let score = dfs(0, false,0)
        return score <= k
    }


    private func getDigits(of num: Int) -> [Int] {
        var ans = [Int]()
        var t = num
        while t > 0 {
            ans.append(t & 1)
            t /= 2
        }
        return [Int](ans.reversed())
    }
}
