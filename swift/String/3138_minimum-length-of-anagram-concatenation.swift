//https://leetcode.cn/problems/minimum-length-of-anagram-concatenation/
class Solution {
    private let lowercaseToIndex:[Character:Int] = ["k": 10, "d": 3, "n": 13, "g": 6, "a": 0, "q": 16, "j": 9, "w": 22, "y": 24, "c": 2, "h": 7, "i": 8, "f": 5, "m": 12, "l": 11, "v": 21, "e": 4, "o": 14, "r": 17, "s": 18, "z": 25, "b": 1, "u": 20, "x": 23, "p": 15, "t": 19]
    func minAnagramLength(_ s: String) -> Int {
        let nums = s.map { lowercaseToIndex[$0]!}
        let N = nums.count

        var preffix: [[Int]] = [[Int](repeating: 0, count: 26)]
        var curCounter = [Int](repeating: 0, count: 26)
        var totalExistedNums = 0
        for i in 0..<N {
            curCounter[nums[i]] += 1
            totalExistedNums |= (1 << nums[i])
            preffix.append(curCounter)
        }

        func check(_ length: Int) -> Bool {

            let targetCounter = preffix[length]
            for idx in stride(from: length, through: N - 1, by: length) {
                let to = idx + length - 1
                for j in 0..<26 {
                    guard targetCounter[j] == preffix[to + 1][j] - preffix[idx][j] else {return false}
                }

            }

            return true
        }



        var visited = 0
        for i in 0..<N {
            guard i < N / 2 else {break}
            visited |= (1 << nums[i])
            if visited != totalExistedNums || (N % (i + 1) != 0) {
                continue
            }

            if check(i + 1) {
                return i + 1
            }

        }
        return N
    }


}

