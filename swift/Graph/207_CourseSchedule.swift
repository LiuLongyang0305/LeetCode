//https://leetcode.com/problems/course-schedule/
class Solution {
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        guard !prerequisites.isEmpty else {
            return true
        }
        var graph = Array<Array<Int>>(repeating: Array<Int>(), count: numCourses)
        var studied = Set<Int>()
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
            studied.insert(i)
            for j in 0..<graph[i].count {
                let k = graph[i][j]
                inDgree[k] -= 1
                if inDgree[k] == 0 {
                    queue.append(k)
                }
            }
        }
        return numCourses == studied.count
    }
}