//https://leetcode.com/problems/course-schedule-ii/
class Solution {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        guard !prerequisites.isEmpty else {
            return Array<Int>(0..<numCourses)
        }
        var graph = Array<Array<Int>>(repeating: Array<Int>(), count: numCourses)
        var studied = Array<Int>()
        var inDgree = Array<Int>(repeating: 0, count: numCourses)
        for prerequest in prerequisites {
            graph[prerequest[1]].append(prerequest[0])
            inDgree[prerequest[0]] += 1
        }
        var queue = Array<Int>()
        for i in 0..<numCourses {
            if inDgree[i] == 0 {
                queue.append(i)
            }
        }
        while !queue.isEmpty {
            let i = queue.removeFirst()
            studied.append(i)
            for j in 0..<graph[i].count {
                let k = graph[i][j]
                inDgree[k] -= 1
                if inDgree[k] == 0 {
                    queue.append(k)
                }
            }
        }
        return numCourses == studied.count ? studied : [Int]()
    }
}