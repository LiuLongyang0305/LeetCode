// https://leetcode-cn.com/problems/sub-sort-lcci/
class Solution {
    func subSort(_ array: [Int]) -> [Int] {
        let sortedArr = array.sorted()
        guard sortedArr != array else {
            return [-1,-1]
        }
        let N = array.count
        var l = 0
        while l < N && sortedArr[l] == array[l]  {
            l += 1
        }
        var r = N - 1
        while r >= 0 && sortedArr[r] == array[r] {
            r -= 1
        }
        return [l,r]
    }
}
