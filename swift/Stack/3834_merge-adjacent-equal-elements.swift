    // https://leetcode.cn/problems/merge-adjacent-equal-elements/
class Solution {
    func mergeAdjacent(_ nums: [Int]) -> [Int] {
        var sb = [Int]()
        for num in nums {
            sb.append(num)
            while sb.count > 1 && sb[sb.count - 1] == sb[sb.count - 2] {
                sb.removeLast()
                sb[sb.count - 1] *= 2
            }
            
        }
        return sb
    }
}
