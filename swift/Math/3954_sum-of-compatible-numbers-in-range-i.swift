  //https://leetcode.cn/problems/sum-of-compatible-numbers-in-range-i/
    class Solution {
        func sumOfGoodIntegers(_ n: Int, _ k: Int) -> Int {
            var sb = 0
            for x in 1...200 {
                if abs(n - x) <= k && x & n == 0 {
                    sb += x
                }
            }
            return sb
        }
    }
