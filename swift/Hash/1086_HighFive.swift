// https://leetcode.com/problems/high-five/
class Solution {
    func highFive(_ items: [[Int]]) -> [[Int]] {
        var ans = [[Int]]()
        let maxStudentNumber = items.count / 5 + 1
        var scores = Array<Array<Int>>(repeating: [], count: maxStudentNumber)
        
        for item in items {
            scores[item[0]].append(item[1])
        }
        for i in 0..<maxStudentNumber {
            if scores[i].count == 5 {
                ans.append([i,scores[i].reduce(0, {$0 + $1}) / 5])
            } else if scores[i].count > 5 {
                let sortedScores = scores[i].sorted {$0 > $1}
                ans.append([i,(sortedScores[0] + sortedScores[1] + sortedScores[2] + sortedScores[3] + sortedScores[4]) / 5])
                
            }
        }
        return ans
    }
}