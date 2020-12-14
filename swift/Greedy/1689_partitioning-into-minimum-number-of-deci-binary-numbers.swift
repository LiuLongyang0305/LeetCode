// https://leetcode.com/problems/partitioning-into-minimum-number-of-deci-binary-numbers/
class Solution {
    func minPartitions(_ n: String) -> Int {
        return Int(n.max()!.asciiValue! - 48)
    }
}