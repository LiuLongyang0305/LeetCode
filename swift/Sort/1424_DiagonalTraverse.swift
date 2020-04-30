// https://leetcode.com/problems/diagonal-traverse-ii/
class Solution {
    typealias NumberInfo = (r:Int,c:Int,val:Int)
    func findDiagonalOrder(_ nums: [[Int]]) -> [Int] {
        guard nums.count > 1 else {
            return nums[0]
        }
        var numbers = [NumberInfo]()
        for r in 0..<nums.count {
            for c in 0..<nums[r].count {
                numbers.append((r,c,nums[r][c]))
            }
        }
        let sortedNumbers = numbers.sorted { (arg0, arg1) -> Bool in
            
            let (r, c, _) = arg0
            let (r1, c1, _) = arg1
            
            if r + c == r1 + c1 {
                return r > r1
            }
            return r + c < r1 + c1
        }
        
        return sortedNumbers.map {$0.val}
    }
}