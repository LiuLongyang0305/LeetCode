// https://leetcode.com/problems/the-kth-factor-of-n/
class Solution {
    func kthFactor(_ n: Int, _ k: Int) -> Int {
        var cnt = 0
        for i in 1...n {
            if n % i == 0 {
                cnt += 1
            }
            guard cnt != k else {
                return i
            }
        }
        return -1
    }
}

