// https://leetcode.com/problems/palindrome-partitioning-iii/
class Solution {
    func palindromePartition(_ s: String, _ k: Int) -> Int {
        guard k < s.count else {
            return 0
        }
        let chars = [Character](s)
        var memo = [Int:Int]()
        func getChangeCharactersNumber(_ from: Int, _ to: Int) -> Int {
            var cnt = 0
            var left = from
            var right = to
            while left < right {
                if chars[left] != chars[right] {
                    cnt += 1
                }
                left += 1
                right -= 1
            }
            return cnt
        }
        func backTracking(_ from: Int, _ to: Int, _ splitNum: Int) -> Int? {
            let length = to - from + 1
            guard splitNum <= length else {
                return nil
            }
            guard splitNum < length else {
                return 0
            }
            let curKey = from << 32 | to << 16 | splitNum
            guard  nil == memo[curKey] else {
                return memo[curKey]!
            }
            guard splitNum > 1 else {
                let cnt = getChangeCharactersNumber(from, to)
                memo[curKey] = cnt
                return cnt
            }
            var minNum = Int.max
            for splitIdx in from...(to - splitNum + 1) {
                let firstChangeCharsNumber = getChangeCharactersNumber(from, splitIdx)
                if let cnt = backTracking(splitIdx + 1, to, splitNum - 1) {
                    minNum = min(minNum, firstChangeCharsNumber + cnt)
                }
            }
            memo[curKey] = minNum
            return minNum
        }
        
        return backTracking(0, chars.count - 1, k) ?? 0
    }
}