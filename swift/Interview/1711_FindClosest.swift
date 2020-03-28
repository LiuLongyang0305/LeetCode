// https://leetcode-cn.com/problems/find-closest-lcci/
class Solution {
    func findClosest(_ words: [String], _ word1: String, _ word2: String) -> Int {
        var indices =  [String:[Int]]()
        for i in 0..<words.count {
            if nil == indices[words[i]] {
                indices[words[i]] = []
            }
            indices[words[i]]?.append(i)
        }
        
        guard let wordIndices = indices[word1], let searchIndices = indices[word2] else {
            return -1
        }
        guard wordIndices.count > 1 || searchIndices.count > 1 else {
            return abs(wordIndices.first! - searchIndices.first!)
        }
        var ans = Int.max
        func binarySearch(_  i: Int) -> Int {
            guard i > searchIndices.first! else {
                return 0
            }
            guard i < searchIndices.last! else {
                return searchIndices.count
            }
            var left = 0
            var right = searchIndices.count
            while left < right {
                let mid = left + (right - left) >> 1
                if searchIndices[mid] > i {
                    if searchIndices[mid - 1] < i {
                        return mid
                    } else {
                        right = mid
                    }
                } else {
                    left = mid
                }
            }
            return -1
        }
        
        for index in wordIndices {
            let p = binarySearch(index)
            if p == 0 {
                ans =  min(ans, searchIndices.first! - index)
                continue
            }
            if p == searchIndices.count {
                ans = min(ans, index  - searchIndices.last!)
                break
            }
            ans = min(ans, index - searchIndices[p - 1], searchIndices[p] - index)
        }
        return ans
    }
}