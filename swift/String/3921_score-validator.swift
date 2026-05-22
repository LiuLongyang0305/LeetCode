//https://leetcode.cn/problems/score-validator/
class Solution {
    func scoreValidator(_ events: [String]) -> [Int] {
        var score = 0
        var counter = 0
        for event in events {
            if let num = Int(event) {
                
                score += num
            } else {
                
                if event == "W" {
                    counter += 1
                } else if event == "WD" {
                    score += 1
                } else if event == "NB"{
                    score += 1
                }
            }
            guard counter < 10 else{break}
        }
        return [score,counter]
    }
}
