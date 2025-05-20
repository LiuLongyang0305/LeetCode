//https://leetcode.cn/problems/minimum-absolute-difference-between-elements-with-constraint/
class Solution {
    private let INF = Int.max / 2
    private var debug = false
    func minAbsoluteDifference(_ nums: [Int], _ x: Int) -> Int {
        let N = nums.count
        var leftArr = [-INF,INF]

        //删除了【0..<X】
        var rightArr = [-INF] + nums.dropFirst(x).sorted() + [INF]

        func binarySearchEqual(for target: Int) -> Int {
            var l = 0
            var r = rightArr.count - 1
            while l < r {
                let mid = (l + r) >> 1
                if rightArr[mid] == target {
                    return mid
                }
                if rightArr[mid] > target {
                    r = mid - 1
                }
                if rightArr[mid] < target {
                    l = mid + 1
                }
            }
            return l
        }


        func binarySearchFirstLargerThanOrEqualToTarget(for target : Int, in arr: [Int]) -> Int {
            var l = 0
            var r = arr.count - 1

            while l < r {
                let mid = (l + r) >> 1
                if arr[mid] >= target {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            return l
        }


        func binarySearchLastSmallerThanOrEqualTarget(for target: Int, in arr: [Int]) -> Int {
            var l = 0
            var r = arr.count - 1

            while l < r {
                let mid = (l + r + 1) >> 1
                if arr[mid] > target {
                    r = mid - 1
                } else {
                    l = mid
                }
            }

            return l
        }



        var ans = INF

        var i = 0
        var addIdx = 0
        var removeIdx = x


        while i < nums.count {
            if debug {
                print("i = \(i)  left = \(leftArr.dropFirst().dropLast())  right = \(rightArr.dropFirst().dropLast())")
            }
            while i - addIdx >= x {
                //添加
                let idx = binarySearchFirstLargerThanOrEqualToTarget(for: nums[addIdx], in: leftArr)
                leftArr.insert(nums[addIdx], at: idx)
                addIdx += 1
            }
            while removeIdx < nums.count && removeIdx - i < x {

                //删除
                let idx = binarySearchEqual(for: nums[removeIdx])
                rightArr.remove(at: idx)
                removeIdx += 1
            }
            if debug {
                print("i = \(i)  left = \(leftArr.dropFirst().dropLast())  right = \(rightArr.dropFirst().dropLast())")
            }
            //可以左侧
            if i - x >= 0 {
                let idx1 = binarySearchLastSmallerThanOrEqualTarget(for: nums[i], in: leftArr)
                let idx2 = binarySearchFirstLargerThanOrEqualToTarget(for: nums[i], in: leftArr)
                ans = min(ans,nums[i] - leftArr[idx1],leftArr[idx2] - nums[i])
            }
            //可以右侧
            if i + x < N {
                let idx1 =  binarySearchLastSmallerThanOrEqualTarget(for: nums[i], in: rightArr)
                let idx2 =  binarySearchFirstLargerThanOrEqualToTarget(for: nums[i], in: rightArr)
                ans = min(ans,nums[i] - rightArr[idx1],rightArr[idx2] - nums[i])
            }
            i += 1
        }



        return ans
    }
}