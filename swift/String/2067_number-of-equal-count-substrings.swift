// https://leetcode.com/problems/number-of-equal-count-substrings/
class Solution {
    func equalCountSubstrings(_ s: String, _ count: Int) -> Int {
        let nums = s.map { Int($0.asciiValue! - 97)}
        var counter = [Int](repeating: 0, count: 26)
        var preffix = [counter]
        for num in nums {
            counter[num] += 1
            preffix.append(counter)
        }
        func check(_ counter:[Int],_ target: Int) -> Bool {
            for idx in 0...25 {
                guard counter[idx] == 0 || counter[idx] == target else {return false}
            }
            return true
        }
        var cnt = 0
        let N = s.count
        for uniqueCharCnt in 1...26 {
            let length = uniqueCharCnt * count
            var left = 0
            while left < N {
                guard left + length - 1 < N else {break}
                let right = left + length
                let counter = (0...25).map { preffix[right][$0] - preffix[left][$0]}
                if check(counter, count) {
                    cnt += 1
                }
                left += 1
            }
        }
        return cnt
    }
}
