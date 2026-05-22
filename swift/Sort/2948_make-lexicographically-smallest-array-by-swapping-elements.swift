//https://leetcode.com/problems/make-lexicographically-smallest-array-by-swapping-elements/
class Solution {
    private typealias Pair = (idx:Int, val:Int)
    func lexicographicallySmallestArray(_ nums: [Int], _ limit: Int) -> [Int] {
        let M = nums.count
        let sortedPairs: [Pair] = (0..<M).map { ($0,nums[$0]) }.sorted { p1, p2 in
            p1.val < p2.val
        }
        var ans = [Int](repeating: 0, count: M)

        var start = 0
        while start < M {
            var j = start
            var last = sortedPairs[start].val

            while j < M && sortedPairs[j].val <= last + limit {
                last = sortedPairs[j].val
                j += 1
            }
            let sortedIndices = (start..<j).map { sortedPairs[$0].idx}.sorted()
            // print("indices = \(sortedIndices)")
            // print("values = \(sortedPairs[start..<j].map({ $0.val}))")
            let N = sortedIndices.count
            for idx in 0..<N {
                ans[sortedIndices[idx]] = sortedPairs[start + idx].val
            }
            start = j
        }

        return ans
    }
}
