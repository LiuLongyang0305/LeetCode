//https://leetcode.com/problems/advantage-shuffle/
class Solution {
    func advantageCount(_ A: [Int], _ B: [Int]) -> [Int] {
        
        var ans = Array<Int>(repeating: -1, count: A.count)
        var sortedA = A.sorted()
        var isUsed = Array<Bool>(repeating: false, count: A.count)
        let size = A.count
        for i in 0..<size {
            if B[i] < sortedA[size - 1] && B[i] >= sortedA[0] {
                var j = 0
                while j < size {
                    if sortedA[j] > B[i] && !isUsed[j] {
                        break
                    }
                    j += 1
                }
                if j < size {
                    isUsed[j] = true
                    ans[i] = sortedA[j]
                }
            }
        }
        var j = 0
        for i in 0..<size {
            if !isUsed[i] {
                while j < size {
                    if ans[j] == -1 {
                        break
                    }
                    j += 1
                }
                if j < size {
                    ans[j] = sortedA[i]
                }
            }
        }
        return ans
    }
}
