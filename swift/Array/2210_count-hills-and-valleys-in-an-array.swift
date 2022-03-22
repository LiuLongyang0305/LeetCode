// https://leetcode.com/problems/count-hills-and-valleys-in-an-array/
class Solution {
    func countHillValley(_ nums: [Int]) -> Int {
        let newNumbers = removeAdjaentRepeatedValus(from: nums)
        // print(newNumbers)
        guard newNumbers.count > 2 else {return 0}
        var ans = 0
        let N = newNumbers.count
        var idx = 1
        while idx < N - 1 {
            if (newNumbers[idx] - newNumbers[idx - 1]) * (newNumbers[idx] - newNumbers[idx + 1]) > 0 {
                ans += 1
            }
            idx += 1
        }
        return ans
    }
    private  func removeAdjaentRepeatedValus(from nums: [Int]) -> [Int] {
        var newNumbers = [Int]()
        nums.forEach { v in
            if v != (newNumbers.last ?? -1) {
                newNumbers.append(v)
            }
        }
        return newNumbers
    }
}