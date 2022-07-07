// https://leetcode.com/problems/make-array-strictly-increasing/
class Solution {
    func makeArrayIncreasing(_ arr1: [Int], _ arr2: [Int]) -> Int {
        var set = Set<Int>(arr2)
        set.insert(-1)
        set.insert(Int.max)
        let sortedNums = set.sorted()
        func binarySearch(_ target: Int) -> Int {
            var left = 0
            var right = sortedNums.count - 1
            while left < right {
                let mid = (left + right) >> 1
                if sortedNums[mid] <= target {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            return left
        }

        var last = [-1:0]
        for num in arr1 {
            var cur = [Int:Int]()
            for (lasNum,opeCnt) in last {
                if num > lasNum {
                    cur[num] = min(cur[num] ?? Int.max, opeCnt)
                }
                let idx = binarySearch(lasNum)
                guard sortedNums[idx] != Int.max else {continue}
                cur[sortedNums[idx]] = min(cur[sortedNums[idx]] ?? Int.max, opeCnt + 1)
            }

            last = cur
        }
        return last.values.min() ?? -1
    }
}