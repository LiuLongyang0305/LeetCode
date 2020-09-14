// https://leetcode.com/problems/diagonal-traverse-ii/
class Solution {
    private struct Info {
        var r: Int
        var c: Int
        var val: Int
    }
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        var ans = [Info]()
        for r in 0..<nums.count {
            for c in 0..<nums[r].count {
                ans.append(Info(r: r, c: c, val: nums[r][c] ))
            }
        }
        ans.sort { (info1, info2) -> Bool in
            if info1.r + info1.c == info2.r + info2.c {
                return info1.c < info2.c
            }
            return info1.r + info1.c < info2.r + info2.c
        }
        return ans.map {$0.val}
    }
}

