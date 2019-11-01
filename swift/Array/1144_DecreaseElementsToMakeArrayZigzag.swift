//https://leetcode.com/problems/decrease-elements-to-make-array-zigzag/
class Solution {
    func movesToMakeZigzag(_ nums: [Int]) -> Int {
        var oddLargerThanEven = 0
        var evenLargerThanOdd = 0
        var numCopy = nums
        
        var i = 1
        while i < numCopy.count {
            if numCopy[i] <= numCopy[i - 1] {
                oddLargerThanEven += numCopy[i - 1] - numCopy[i] + 1
                numCopy[i - 1] = numCopy[i] - 1
            }
            if i + 1 < numCopy.count {
                if numCopy[i] <= numCopy[i + 1] {
                    oddLargerThanEven += numCopy[i + 1] - numCopy[i] + 1
                    numCopy[i + 1] = numCopy[i] - 1
                }
            }
            i += 2
        }
        numCopy = nums
        i = 0
        while i < nums.count {
            if i - 1 >= 0 {
                if numCopy[i] <= numCopy[i - 1] {
                    evenLargerThanOdd += numCopy[i - 1] - numCopy[i] + 1
                    numCopy[i - 1] = numCopy[i] - 1
                }
            }
            if i + 1 < nums.count {
                if numCopy[i] <= numCopy[i + 1] {
                    evenLargerThanOdd += numCopy[i + 1] - numCopy[i] + 1
                    numCopy[i + 1] = numCopy[i] - 1
                }
            }
            i += 2
        }
        return min(oddLargerThanEven, evenLargerThanOdd)
    }
}