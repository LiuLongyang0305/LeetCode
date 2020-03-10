//  https://leetcode.com/problems/jump-game-iv/
class Solution {
    func minJumps(_ arr: [Int]) -> Int {

        let N = arr.count
        guard N > 2 else {
            return N - 1
        }
        guard arr[0] != arr[N - 1] else {
            return 1
        }
        var visited = Array<Bool>(repeating: false, count: N)
        var map = [Int:[Int]]()
        for i in 0..<N {
            if nil == map[arr[i]] {
                 map[arr[i]] = []
            }
            map[arr[i]]?.append(i)
        }
        guard map.count > 2 else {
            return arr[0] == arr[N - 1] ? 1 : 2
        }
        visited[0] = true
        var queue = Array<Int>()
        queue.append(0)
        var depth = 0
        while !queue.isEmpty {
            depth += 1
            let length = queue.count
            for i in 0..<length {
                let cur = queue[i]
                if cur + 1 == N - 1 {
                    return depth
                }
                if cur - 1 >= 0 && !visited[cur - 1]{
                    queue.append(cur - 1)
                    visited[cur - 1] = true
                }
                if cur + 1 < N && !visited[cur + 1] {
                    queue.append(cur + 1)
                    visited[cur + 1] = true
                }
                if let indices = map[arr[cur]] {
                    for index in indices where !visited[index]{
                        if index == N - 1 {
                            return depth
                        }
                        visited[index] = true
                        queue.append(index)
                    }
                }
            }
            queue.removeFirst(length)
        }
        return -1
    }
 }