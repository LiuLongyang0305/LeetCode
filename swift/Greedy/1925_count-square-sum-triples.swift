// https://leetcode.com/problems/count-square-sum-triples/
class Solution {
    func countTriples(_ n: Int) -> Int {
        var ans = 0
        for a in 1...n {
            for b in a...n {
                let temp = a * a + b * b
                let root = Int(sqrt(Double(temp)))
                if root * root == temp && root >= 1 && root <= n {
                    ans += 1
                }
            }
        }
        return  ans * 2
    }
}


