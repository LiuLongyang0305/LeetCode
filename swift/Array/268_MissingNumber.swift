//https://leetcode.com/problems/missing-number/
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var result = nums.count
        for i in 0..<nums.count {
            result ^= i
        }
        for ele in nums {
            result ^= ele
        }
        return result
    }
}

class Solution2 {
    func missingNumber(_ nums: [Int]) -> Int {
        return Set<Int>(0...nums.count).subtracting(Set<Int>(nums)).first!
    }
}

class Solution3 {
    func missingNumber(_ nums: [Int]) -> Int {
        var isExist = Array<Bool>(repeating: false, count: nums.count + 1)
        for num in nums {
            isExist[num] = true
        }
        for i in 0..<isExist.count {
            if !isExist[i] {
                return i
            }
        }
        return -1
    }
}
