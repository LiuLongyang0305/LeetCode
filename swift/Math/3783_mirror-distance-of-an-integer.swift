  // https://leetcode.cn/problems/mirror-distance-of-an-integer/
    class Solution {
        func mirrorDistance(_ n: Int) -> Int {
            return abs(n - Int(String("\(n)".reversed()))!)
        }
    }
