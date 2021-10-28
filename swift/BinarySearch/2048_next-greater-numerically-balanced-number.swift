// https://leetcode.com/problems/next-greater-numerically-balanced-number/
class Solution {
    private static var balancedNumbers = [Int]()
    private func check(val: Int) -> Bool {
        var t = val
        var counter = [Int](repeating: 0, count: 10)
        while t > 0 {
            counter[t % 10] += 1
            t /= 10
        }
        for i in 0...9 {
            if counter[i] != 0 {
                guard counter[i] == i else {
                    return false
                }
            }
        }
        return true
    }
    func nextBeautifulNumber(_ n: Int) -> Int {
        if Solution.balancedNumbers.isEmpty {
            for i in 1...666666 {
                if check(val: i) {
                    Solution.balancedNumbers.append(i)
                }
            }
            Solution.balancedNumbers.append(1224444)
        }
        var left = 0
        var right = Solution.balancedNumbers.count - 1
        while left < right {
            let mid = (left + right) >> 1
            if Solution.balancedNumbers[mid] > n {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return Solution.balancedNumbers[left]
    }
}