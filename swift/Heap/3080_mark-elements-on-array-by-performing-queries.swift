//https://leetcode.com/problems/mark-elements-on-array-by-performing-queries/
class Solution {
    private struct IndexAndNum: Comparable {
        static func < (lhs: Solution.IndexAndNum, rhs: Solution.IndexAndNum) -> Bool {
            if lhs.num == rhs.num {
                return lhs.index < rhs.index
            }
            return lhs.num < rhs.num
        }

        var num: Int
        var index: Int
    }
    func unmarkedSumArray(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        let N = nums.count
        var heap = Heap<IndexAndNum>()
        var marked = Set<Int>()
        var remain = 0
        for i in 0..<N {
            heap.insert(IndexAndNum(num: nums[i], index: i))
            remain += nums[i]
        }
        var ans = [Int]()
        for query in queries {
            let (idx,k) = (query[0],query[1])
             if !marked.contains(idx)  {
                 marked.insert(idx)
                 remain -= nums[idx]
            }

            var cnt = k
            while cnt > 0,let min = heap.popMin() {
                if !marked.contains(min.index) {
                    remain -= min.num
                    marked.insert(min.index)
                    cnt -= 1
                }

            }
            ans.append(remain)
        }
        return ans
    }
}