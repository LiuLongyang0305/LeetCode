//https://leetcode.com/problems/combination-sum/
class Solution {
    var ans = [[Int]]()
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let sortedCandidates = candidates.sorted()
        for i in 0..<candidates.count {
            if sortedCandidates[i] < target {
                combination([sortedCandidates[i]], Array<Int>(sortedCandidates[i...]), target - sortedCandidates[i])
            } else if sortedCandidates[i] == target {
                ans.append([sortedCandidates[i]])
            }
        }
        return ans
    }
    
    private func combination(_ arr: [Int], _ sortedCandidates: [Int], _ target: Int) {
        
        guard target > 0 else {
            ans.append(arr)
            return
        }
        
        guard sortedCandidates[0] <= target else {
            return
        }
        
        var arrCopy = arr
        for i in 0..<sortedCandidates.count {
            if sortedCandidates[i] <=  target {
                arrCopy.append(sortedCandidates[i])
                combination(arrCopy, [Int](sortedCandidates[i...]), target - sortedCandidates[i])
                arrCopy.removeLast()
            }
        }
    }
}