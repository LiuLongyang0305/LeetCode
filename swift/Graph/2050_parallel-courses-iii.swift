// https://leetcode.com/problems/parallel-courses-iii/
class Solution {
    func minimumTime(_ n: Int, _ relations: [[Int]], _ time: [Int]) -> Int {
        var tree = [[Int]](repeating: [], count: n)
        var degree = [Int](repeating: 0, count: n)
        var maxTime = [Int](repeating: 0, count: n)
        for relation in relations {
            tree[relation[0] - 1].append(relation[1] - 1)
            degree[relation[1] - 1] += 1
        }
        var queue = [Int]()
        for node in 0..<n {
            if degree[node] == 0 {
                maxTime[node] = time[node]
                queue.append(node)
            }
        }
        while !queue.isEmpty {
            var nextLevel = [Int]()
            for node in queue {
                for child in tree[node] {
                    let c = maxTime[node] + time[child]
                    if c > maxTime[child] {
                        maxTime[child] = c
                    }
                    degree[child] -= 1
                    if degree[child] == 0 {
                        nextLevel.append(child)
                    }
                }
            }
            queue = nextLevel
        }
        return maxTime.max()!
    }
}