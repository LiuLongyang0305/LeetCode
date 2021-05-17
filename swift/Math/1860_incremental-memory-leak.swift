// https://leetcode.com/problems/incremental-memory-leak/
class Solution {
    func memLeak(_ memory1: Int, _ memory2: Int) -> [Int] {
        var i = 1
        var m1 = memory1
        var m2 = memory2
        while true {
            guard m1 >= i || m2 >= i else {
                return [i,m1,m2]
            }
            if m2 > m1 {
                if m2 >= i {
                    m2 -= i
                }
            } else {
                if m1 >= i {
                    m1 -= i
                }
            }
            i += 1
        }
        return []
    }
}

