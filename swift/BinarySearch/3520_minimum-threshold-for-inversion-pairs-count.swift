    // https://leetcode.cn/problems/minimum-threshold-for-inversion-pairs-count/
    class Solution {
        func minThreshold(_ nums: [Int], _ k: Int) -> Int {
            func binarySearchForIndex( in arr: [Int], largerThan target: Int) -> Int {
                var l = 0
                var r = arr.count - 1
                while l < r {
                    let mid = (l + r) >> 1
                    if arr[mid] > target {
                        r = mid
                    } else {
                        l = mid + 1
                    }
                }
                return l
            }



            func check(_ limit: Int) -> Bool {

                var sortedList = [-1,1_000_000_007]
                var cnt = 0

                for num in nums {
                    let i = binarySearchForIndex(in: sortedList, largerThan: num + limit)
                    let j = binarySearchForIndex(in: sortedList, largerThan: num)
                    cnt += i - j
                    //添加num
                    sortedList.insert(num, at: j)
                    if cnt >= k {
                        return true
                    }
                }
                return false
            }
            var r = nums.max()! - nums.min()!
            guard check(r) else {return -1}
            var l = 0
            while l < r {
                let mid = (l + r) >> 1
                if check(mid) {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            return l
        }
    }
