//https://leetcode.cn/problems/limit-occurrences-in-sorted-array/
class Solution {
    func limitOccurrences(_ nums: [Int], _ k: Int) -> [Int] {
        var sb = [Int]()
        var numsCopy = nums
        while let f = numsCopy.first, let lastIdx = numsCopy.lastIndex(of: f) {
            let N = lastIdx + 1
            sb += [Int](repeating: f, count: min(k,lastIdx + 1))
            numsCopy.removeFirst(N)
        }
        return sb
    }
}
