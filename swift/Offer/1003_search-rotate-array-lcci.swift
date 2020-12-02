// https://leetcode-cn.com/problems/search-rotate-array-lcci/
class Solution {
    func search(_ arr: [Int], _ target: Int) -> Int {
        return arr.firstIndex(of: target) ?? -1
    }
}