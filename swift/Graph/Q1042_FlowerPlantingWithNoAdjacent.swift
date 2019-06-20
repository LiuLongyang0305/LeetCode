//https://leetcode.com/problems/flower-planting-with-no-adjacent/
class Solution {
    func gardenNoAdj(_ N: Int, _ paths: [[Int]]) -> [Int] {
        guard N > 4 else {
            return Array<Int>(1...N)
        }
        var graph = Array<Array<Int>>(repeating: Array<Int>(), count: N + 1)
        for path in paths {
            graph[path[0]].append(path[1])
            graph[path[1]].append(path[0])
        }
        var result = Array<Int>(repeating: 0, count: N + 1)
        for i in 1...N {
            var colour = Array<Bool>(repeating: false, count: 4)
            for garden in graph[i] {
                if result[garden] != 0 {
                    colour[result[garden] - 1] = true
                }
            }
            for j in 0..<4 {
                if colour[j] == false {
                    result[i] = j + 1
                    break
                }
            }
        }
        result.removeFirst()
        return result
    }
}