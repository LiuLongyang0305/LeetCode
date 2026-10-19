// https://leetcode.cn/problems/count-smaller-elements-with-opposite-parity/
class Solution {
    func countSmallerOppositeParity(_ nums: [Int]) -> [Int] {
        let M = nums.count
        var numsCopy = [[Int]](repeating: [], count: 2)
        for num in nums {
            numsCopy[num & 1].append(num)
        }
        numsCopy[0].sort()
        numsCopy[1].sort()
        func remove(_ v: Int, in sortArr: inout [Int]) {
            if let f = sortArr.first, f == v {
                sortArr.removeFirst()
                return
            }
            if let last = sortArr.last, last == v {
                sortArr.removeLast()
                return
            }
            var l = 0
            var r = sortArr.count - 1
            while l < r {
                let mid = (l + r ) >> 1
                if sortArr[mid] == v {
                    sortArr.remove(at: mid)
                    return
                }
                if sortArr[mid] > v {
                    r = mid - 1
                } else  {
                    l = mid + 1
                }
            }
            sortArr.remove(at: l)
        }


        func count(_ v: Int, in sortedArr: [Int]) -> Int {
            guard !sortedArr.isEmpty else {return 0}
            if let f = sortedArr.first, f >= v {
                return 0
            }
            if let la = sortedArr.last, la < v {
                return sortedArr.count
            }
            var l = 0
            var r = sortedArr.count - 1
            while l < r {
                let mid = (l + r + 1) >> 1
                if sortedArr[mid] >= v {
                    r = mid - 1
                } else {
                    l = mid
                }
            }
            return l + 1
        }



        var ans = [Int](repeating: 0, count: nums.count)

        for (i,v) in nums.enumerated() {
            //先移除v
            remove(v, in: &numsCopy[v & 1])
            //计算小于v的不同奇偶性的数字个数
            ans[i] = count(v, in: numsCopy[1 - (v & 1)])
        }

        return ans
    }
}
