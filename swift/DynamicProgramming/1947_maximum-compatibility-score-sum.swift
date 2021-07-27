// https://leetcode.com/problems/maximum-compatibility-score-sum/
class Solution {
    func maxCompatibilitySum(_ students: [[Int]], _ mentors: [[Int]]) -> Int {

        let M = students.count
        let N = students[0].count

        var compatibilityScore = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: M), count: M)
        for s in 0..<M {
            for m in 0..<M {
                var score = 0
                for q in 0..<N {
                    if students[s][q] == mentors[m][q] {
                        score += 1
                    }
                }
                compatibilityScore[s][m] = score
            }
        }
//        print(compatibilityScore)
        var memo = [Int:Int]()

        func helper(_ usedStudents: Int, _ usedMenteors: Int) -> Int {
            let key = usedStudents << 8 | usedMenteors
            guard nil == memo[key] else {
                return memo[key]!
            }
            var ans = 0
            for s in 0..<M {
                guard usedStudents & (1 << s) == 0 else {
                    continue
                }
                for m in 0..<M {
                    guard usedMenteors & (1 << m) == 0 else {
                        continue
                    }
                    let new =  compatibilityScore[s][m] + helper(usedStudents | (1 << s), usedMenteors | (1 << m))
                    ans = max(ans,new)
                }
            }
            memo[key] = ans
            return ans
        }
        let _ = helper(0, 0)
//        print(memo)
        return memo[0] ?? -1
    }
}