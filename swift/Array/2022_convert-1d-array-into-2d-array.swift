// https://leetcode.com/problems/convert-1d-array-into-2d-array/
class Solution {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        guard m * n == original.count else {
            return []
        }
        var ans = [[Int]]()
        var row = [Int]()
        for num in original {
            row.append(num)
            if row.count == n {
                ans.append(row)
                row = []
            }
        }
        return ans
    }
}