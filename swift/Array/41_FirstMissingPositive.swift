//https://leetcode.com/problems/first-missing-positive/
class Solution {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var numbers = nums
        var isOneExisted = false
        for i in 0..<numbers.count {
            if numbers[i] == 1 {
                isOneExisted = true
                break
            }
        }
        guard isOneExisted else {
            return 1
        }
        for i in 0..<numbers.count {
            if numbers[i] <= 0 || numbers[i] > numbers.count {
                numbers[i] = 1
            }
        }
        for i in 0..<numbers.count {
            var index  = numbers[i] >= 0 ? numbers[i] : -numbers[i]
            index = index == numbers.count ? 0 : index;
            if numbers[index] > 0 {
                numbers[index] *= -1
            }
        }
        print(numbers)
        for i in 1..<numbers.count {
            if numbers[i] > 0 {
                return i
            }
        }
        if numbers[0] > 0 {
            return numbers.count
        }
        return numbers.count + 1
    }
}