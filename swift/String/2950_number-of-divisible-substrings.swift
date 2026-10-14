//https://leetcode.cn/problems/number-of-divisible-substrings/
let customKeypadMap: [Character: Int] = [
    // 1: ab
    "a": 1, "b": 1,
    // 2: cde
    "c": 2, "d": 2, "e": 2,
    // 3: fgh
    "f": 3, "g": 3, "h": 3,
    // 4: ijk
    "i": 4, "j": 4, "k": 4,
    // 5: lmn
    "l": 5, "m": 5, "n": 5,
    // 6: opq
    "o": 6, "p": 6, "q": 6,
    // 7: rst
    "r": 7, "s": 7, "t": 7,
    // 8: uvw
    "u": 8, "v": 8, "w": 8,
    // 9: xyz
    "x": 9, "y": 9, "z": 9
]


class Solution {
    func countDivisibleSubstrings(_ word: String) -> Int {
        let nums = word.map {customKeypadMap[$0]!}
        let M = nums.count
        var prefix = [Int](repeating: 0, count: M + 1)
        for i in 0..<M {
            prefix[i + 1] = prefix[i] + nums[i]
        }
        var cnt = M
        for i in 0..<M {
            for j in stride(from: i + 1, to: M, by: 1) {
                let l = j - i + 1
                let sum = prefix[j + 1] - prefix[i]
                if sum % l == 0 {
                    cnt += 1
                }
            }
        }
        return cnt
    }
}

