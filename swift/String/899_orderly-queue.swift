// https://leetcode.com/problems/orderly-queue/
class Solution {
    func orderlyQueue(_ s: String, _ k: Int) -> String {
        guard k != 1 else {
            return getAnsOnKEqualToOne(of: s)
        }
        return String(s.sorted())
    }
    private func getAnsOnKEqualToOne(of s: String) -> String {
        var ans = s
        var s1 = s
        for _ in 0..<s.count {
            s1.append(s1.removeFirst())
            if s1 < ans {
                ans = s1
            }
        }
        return ans
    }
}