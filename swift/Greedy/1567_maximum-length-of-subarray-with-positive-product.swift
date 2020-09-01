// https://leetcode.com/problems/maximum-length-of-subarray-with-positive-product/
class Solution {
    private enum Product {
        case positive
        case negative
        case null
    }
    func getMaxLen(_ nums: [Int]) -> Int {
        var ans = 0
        func getAns(_ arr: [Bool]){
            var negativeIndices = [Int]()
            for i in 0..<arr.count {
                if !arr[i] {
                    negativeIndices.append(i)
                }
            }
            print(negativeIndices)
            guard negativeIndices.count % 2 == 1 else {
                ans = max(ans, arr.count)
                return
            }

            let N = arr.count
            if let first = negativeIndices.first {
                let left = first > 0 ? first : 0
                let right = max(0, N - (first + 1))
                ans = max(ans, left,right)
            }
            if let last = negativeIndices.last {
                let right = last == N - 1 ? 0 : (N - (last + 1))
                let left = last
                ans = max(ans, left,right)
            }
        }
        var tempArr = [Bool]()
        for num in nums {
            if num == 0 {
                if !tempArr.isEmpty {
                    getAns(tempArr)
                }
                tempArr = []
            } else {
                tempArr.append(num > 0)
            }
        }
        if !tempArr.isEmpty {
           getAns(tempArr)
        }
        return ans
    }
}

// Solution().getMaxLen([0,1,-2,-3,-4])

