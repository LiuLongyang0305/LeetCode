// https://leetcode.com/problems/minimum-cost-to-change-the-final-value-of-expression/
class Solution {
    private typealias Pair = (zero:Int,one:Int)
    private var nums = Array<Pair>()
    private var operations = Array<Character>()
    private func eval() {
        let a = nums.removeLast()
        let b = nums.removeLast()
        let operation = operations.removeLast()
        if operation == "&" {
            let s0: [Int] = [a.zero + b.zero,a.zero + b.one,b.zero + a.one,a.zero + b.zero + 1]
            let s1: [Int] = [a.one + b.one,a.one + b.zero + 1,a.zero + b.one + 1,a.one + b.one + 1]
            nums.append((s0.min()!,s1.min()!))
        } else {
            let s0: [Int] = [a.zero + b.zero,a.zero + b.one + 1,b.zero + a.one + 1,a.zero + b.zero + 1]
            let s1: [Int] = [a.one + b.one,a.one + b.zero,a.zero + b.one ,a.one + b.one + 1]
            nums.append((s0.min()!,s1.min()!))
        }
    }
    func minOperationsToFlip(_ expression: String) -> Int {
        self.nums = []
        self.operations = []
        for c in expression {
            if c.isNumber {
                nums.append(c == "0" ? (0,1) : (1,0))
            } else if c == "(" {
                operations.append(c)
            } else if c == ")" {
                while let l = operations.last, l != "("{
                    eval()
                }
                operations.removeLast()
            } else {
                while let l = operations.last, l != "(" {
                    eval()
                }
                operations.append(c)
            }
        }
        while !operations.isEmpty {
            eval()
        }
        return max(nums[0].one, nums[0].zero)
    }
}


