//https://leetcode.com/problems/sliding-window-median/
class Solution {
    func medianSlidingWindow(_ nums: [Int], _ k: Int) -> [Double] {
        guard !nums.isEmpty else {
            return []
        }
        guard k != 1 else {
            return nums.map{Double($0)}
        }
        var ans = Array<Double>(repeating: 0.0, count: nums.count - k + 1)
        var tempArr = Array<Int>(nums[0..<k]).sorted()
        // print(tempArr)
        let isOdd  = k % 2 == 1
        if isOdd {
            ans[0] = Double(tempArr[k >> 1])
        } else {
            ans[0] = Double(tempArr[k >> 1] + tempArr[k >> 1 - 1]) / 2.0
        }
        for i in k..<nums.count {
            //二分法查找
            var targetValue = nums[i - k]
            var left = 0
            var right = k - 1
            while left < right {
                let mid = left + (right - left) >> 1
                if tempArr[mid] == targetValue {
                    left = mid
                    break
                } else if tempArr[mid] > targetValue {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            tempArr.remove(at: left)
            left = 0
            right  = k - 2
            targetValue = nums[i]
            while left < right {
                let mid = left + (right - left) >> 1
                if tempArr[mid] == targetValue {
                    left = mid
                    break
                } else if tempArr[mid] > targetValue {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            if tempArr[left] >= targetValue {
                tempArr.insert(targetValue, at: left)
            }  else if tempArr[left] < targetValue {
                tempArr.insert(targetValue, at: left + 1 )
            }
            if isOdd {
                ans[i - k + 1] = Double(tempArr[k >> 1])
            } else {
                ans[i - k + 1] = Double(tempArr[k >> 1] + tempArr[k >> 1 - 1]) / 2.0
            }
        }
        return ans
    }
}