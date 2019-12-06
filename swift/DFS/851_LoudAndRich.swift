// https://leetcode.com/problems/loud-and-rich/
 class Solution {
    typealias Person = (Number:Int,Quiet:Int)
    func loudAndRich(_ richer: [[Int]], _ quiet: [Int]) -> [Int] {
        let personCount = quiet.count
        var graph = [Int: Set<Int>]()
        for r in richer {
            if nil == graph[r[1]] {
                graph[r[1]] = []
            }
            graph[r[1]]?.insert(r[0])
        }
        var ans = Array<Int>(repeating: -1, count: personCount)
        func dfs(_ person: Person) -> Person {
            guard let richers =  graph[person.Number] else {
                return person
            }
            var temp = person
            for r in richers {
                if ans[r]  == -1 {
                    let p = dfs((r,quiet[r]))
                    ans[r] = p.Number
                }
                if quiet[ans[r]] < temp.Quiet {
                     temp.Quiet = quiet[ans[r]]
                     temp.Number = ans[r]
                 }
            }
            return temp
        }
        for personNum in 0..<personCount {
            if ans[personNum] == -1 {
                ans[personNum] = dfs((personNum,quiet[personNum])).Number
            }
        }
        return ans
    }
 }