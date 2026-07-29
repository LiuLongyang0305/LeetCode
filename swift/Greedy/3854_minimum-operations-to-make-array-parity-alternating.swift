// https://leetcode.cn/problems/minimum-operations-to-make-array-parity-alternating/
class Solution {
    private typealias Pair = (op:Int,diff:Int)
    func makeParityAlternating(_ nums: [Int]) -> [Int] {
        if nums.count == 1 {
            return [0,0]
        }
        let gMin = nums.min()!
        let gMax = nums.max()!
        let (op1,diff1) = calc(0, nums, gMin, gMax)
        let (op2,diff2) = calc(1, nums, gMin, gMax)
        if op1 < op2 {
            return [op1,diff1]
        } else if op1 > op2 {
            return [op2,diff2]
        } else {
            return [op1,min(diff1,diff2)]
        }
    }

     private func calc(_ target: Int,_ nums: [Int], _ gMin: Int, _ gMax: Int) -> Pair {
        var op = 0
        var mn = Int.max
        var mx = Int.min
        for i in 0..<nums.count {
            var x = nums[i]
            if (x - i) & 1 != target {
                op += 1
                if x == gMin {
                    x += 1
                } else if x == gMax {
                    x -= 1
                }
            }
            mn = min(mn,x)
            mx = max(mx,x)
        }
        return (op,max(mx - mn,1))
    }
}
