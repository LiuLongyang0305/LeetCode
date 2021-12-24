 // https://leetcode.com/problems/find-all-people-with-secret/
class Solution {
    private typealias Info = (person: Int, time: Int)
    func findAllPeople(_ n: Int, _ meetings: [[Int]], _ firstPerson: Int) -> [Int] {
        var isPeopleWithSeret = [Int](repeating: Int.max, count: n)
        isPeopleWithSeret[0] = -1
        var graph = [[Info]](repeating: [], count: n)
        graph[0].append((firstPerson,0))
        meetings.forEach { meet in
            graph[meet[0]].append((meet[1],meet[2]))
            graph[meet[1]].append((meet[0],meet[2]))
        }
        func dfs(_ person: Int,_ time: Int) {
            for (p,t) in graph[person] {
                guard t >= time && isPeopleWithSeret[p] > t else {continue}
                isPeopleWithSeret[p] = t
                dfs(p, t)
            }
        }
        dfs(0,-1)
        return (0..<n).filter { isPeopleWithSeret[$0] != Int.max}
    }
}