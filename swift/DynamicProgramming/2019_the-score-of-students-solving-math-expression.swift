// https://leetcode.com/problems/the-score-of-students-solving-math-expression/
class Solution {
    private var memo = [Int:Set<Int>]()
    func scoreOfStudents(_ s: String, _ answers: [Int]) -> Int {
        let correctAnswer = caculate(s)
        let ws = answers.filter { $0 != correctAnswer}
        var ans = (answers.count - ws.count) * 5
        guard !ws.isEmpty else {
            return ans
        }
        guard  s.contains("*") && s.contains("+") else {
            return ans
        }
        let candidateWrongAnswers = solve(s)
        ws.forEach { t in
            if candidateWrongAnswers.contains(t) {
                ans += 2
            }
        }
        return ans
    }
    private func caculate(_ s: String) -> Int {
        var ans = 0
        var last = 0
        var flag = false
        for ch in s {
            if ch.isNumber {
                let v = Int(ch.asciiValue! - 48)
                if flag {
                    ans -= last
                    last *= v
                } else {
                    last = v
                }
                ans += last
            } else if ch == "+" {
                flag = false
            } else {
                flag = true;
            }
        }
        return ans
        
    }
    
    private func solve(_ s: String) -> Set<Int> {
        let key = s.hashValue
     if let t =  memo[key] {
            return t
        }
        guard s.contains("*") && s.contains("+") else {
            let t = caculate(s)
            if t > 1000 {
                memo[key] = []
            } else {
                memo[key, default: []].insert(caculate(s))
            }
            return memo[key]!
        }
        var answers = Set<Int>()
        var idx = s.startIndex
        while idx < s.endIndex {
            if s[idx] == "*" || s[idx] == "+" {
                let leftAnswers = solve(String(s[..<idx]))
                let rightAnwsers = solve(String(s[s.index(after: idx)...]))
                for l in leftAnswers {
                    for r in rightAnwsers {
                        let t = s[idx] == "*" ? (l * r) : (l + r)
                        if t >= 0 && t <= 1000 {
                            answers.insert(t)
                        }
                    }
                }
            }
            idx = s.index(after: idx)
        }
        memo[key] = answers
        return answers
        
    }
}

