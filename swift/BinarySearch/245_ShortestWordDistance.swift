// https://leetcode-cn.com/problems/shortest-word-distance-iii/
class Solution {
    func shortestWordDistance(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var indices = [Int]()
        for i in 0..<words.count {
            if words[i] == word1 {
                indices.append(i)
            }
        }
        var shortestDistance = Int.max

        guard word1 != word2 else {
            for i in 1..<indices.count {
                shortestDistance = min(shortestDistance, indices[i] - indices[i - 1])
            }
            return shortestDistance
        }
        func getMinDis(_ index: Int) -> Int {
            guard !indices.isEmpty else {
                return -1
            }
            guard index > indices[0] else {
                return indices[0] - index
            }
            guard index < indices.last! else {
                return index - indices.last!
            }
            var left = 0
            var right = indices.count  - 1
            while left < right {
                let mid = left + (right - left) >> 1
                if indices[mid] > index{
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            return min(index - indices[left - 1], indices[left] - index)
        }
        for i in 0..<words.count {
            if words[i] == word2 {
                shortestDistance = min(shortestDistance, getMinDis(i))
            }
        }
        return shortestDistance
    }
}