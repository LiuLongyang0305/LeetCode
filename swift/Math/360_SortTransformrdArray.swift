
// https://leetcode.com/problems/sort-transformed-array/
class Solution {
    func sortTransformedArray(_ nums: [Int], _ a: Int, _ b: Int, _ c: Int) -> [Int] {
        let caculateAns = nums.map { a * $0 * $0 + b * $0 + c}
        guard a != 0 else {
            return  b >= 0 ? caculateAns : caculateAns.reversed()
        }
        let line = Double(-b) / Double(2 * a)
        guard let index = nums.firstIndex(where: { Double($0) - line > 0}) else {
            return a > 0 ? caculateAns.reversed() : caculateAns
        }
        guard let _ = nums.lastIndex(where: { Double($0) - line < 0}) else {
            return a > 0 ? caculateAns : caculateAns.reversed()
        }
        var ans = [Int]()
        var i = index
        var j = index - 1
        while i < nums.count && j >= 0 {
            if caculateAns[i] < caculateAns[j] {
                if a > 0 {
                    ans.append(caculateAns[i])
                    i += 1
                } else {
                    ans.append(caculateAns[j])
                    j -= 1
                }
            } else if caculateAns[i] > caculateAns[j] {
                if a > 0 {
                    ans.append(caculateAns[j])
                    j -= 1
                } else {
                    ans.append(caculateAns[i])
                    i += 1
                }
            } else {
                ans.append(caculateAns[i])
                ans.append(caculateAns[j])
                i += 1
                j -= 1
            }
        }
        while i < nums.count  {
            ans.append(caculateAns[i])
            i += 1
        }
        while j >= 0 {
            ans.append(caculateAns[j])
            j -= 1
        }
        return a > 0 ? ans : ans.reversed()
    }
}
