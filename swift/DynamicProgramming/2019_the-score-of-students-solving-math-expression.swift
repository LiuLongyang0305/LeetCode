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




//https://leetcode.cn/problems/the-score-of-students-solving-math-expression/
class Solution {
    func scoreOfStudents(_ s: String, _ answers: [Int]) -> Int {
        let chars = [Character](s)
        let nums = chars.map {Int($0.asciiValue!) - 48}
        let M = chars.count
        let standardAnswer = cal(chars)
        var memo = [[Set<Int>]](repeating: [Set<Int>](repeating: [], count: M), count: M)
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: M)
        func dfs(_ i: Int, _ j: Int){
            if i == j {
                memo[i][j] = [nums[i]]
                return
            }

            if visited[i][j] {return}


            var sb = Set<Int>()
            for k in i...j {
                if !chars[k].isNumber {
                    dfs(i, k - 1)
                    dfs(k + 1, j)

                    for l in memo[i][k - 1] {
                        for r in memo[k + 1][j] {
                            let curAns = chars[k] == "*" ? (l * r) : (l + r)
                            if curAns <= 1000 {
                                sb.insert(curAns)
                            }
                        }
                    }

                }
            }

            memo[i][j] = sb
            visited[i][j] = true

        }
        dfs(0, M - 1)
        let possibleWrongAnswers = memo[0][M - 1]
        var sb = 0
        for answer in answers {
            if answer == standardAnswer {
                sb += 5
            } else {
                if possibleWrongAnswers.contains(answer) {
                    sb += 2
                }
            }
        }
        return sb
    }




    func cal(_ expressionChars: [Character]) -> Int {
        var nums = [Int]()
        var symbols = [Character]()
        for ch in expressionChars {
            if ch.isNumber {
                nums.append(Int(ch.asciiValue! - 48))
            } else {
                symbols.append(ch)
            }
        }

        while let firstIdx = symbols.firstIndex(of: "*") {
            nums[firstIdx] *= nums[firstIdx + 1]
            nums.remove(at: firstIdx + 1)
            symbols.remove(at: firstIdx)
        }
        return nums.reduce(0) {$0 + $1}
    }
}
