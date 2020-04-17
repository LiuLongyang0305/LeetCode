// https://leetcode.com/problems/3sum-smaller/
class Solution {
    func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 2 else {
            return 0
        }
        let N = nums.count
        let sortNumbers = nums.sorted()
        guard sortNumbers[0] + sortNumbers[1] + sortNumbers[2] <  target else {
            return 0
        }
        func find(_ target: Int,_ fromIndex: Int) -> Int? {
            if target < sortNumbers[fromIndex ] {
                return nil
            }
            var left = fromIndex
            var right = N - 1
            
            while left < right {
                let mid = left + (right - left) >> 1
                if sortNumbers[mid] >= target{
                    if sortNumbers[mid - 1] < target {
                        return mid - 1
                    } else {
                        right = mid - 1
                    }
                } else {
                    if mid < N - 1 {
                        if sortNumbers[mid + 1] >= target {
                            return mid
                        }
                    }
                    
                    left = mid + 1
                }
            }
            return sortNumbers[left] >= target ? (left - 1) : left
        }
        var ans = 0
        for i in 0..<(N - 2) {
            for j in (i + 1)..<(N - 1) {
                guard let index = find(target - sortNumbers[i] - sortNumbers[j], j + 1), index > j else {
                    continue
                }
                ans += index - j
            }
        }
        return ans
    }
}
