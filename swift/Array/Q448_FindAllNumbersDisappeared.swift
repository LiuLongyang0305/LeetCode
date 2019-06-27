//https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/
class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return [Int]()
        }
        var set = Set<Int>(1...nums.count)
        for num in nums {
            set.remove(num)
        }
        return Array<Int>(set)
    }
}

class Solution2 {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        guard nums.count > 1 else {
            return result
        }
        var numsCopy = nums
        for i in 0..<numsCopy.count {
            let val = abs(numsCopy[i]) - 1
            if numsCopy[val] > 0 {
                numsCopy[val] *= -1
            }
        }
        for i in 0..<numsCopy.count {
            if numsCopy[i] > 0 {
                result.append(i + 1)
            }
        }
        return result
    }
}