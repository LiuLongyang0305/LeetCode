//https://leetcode.cn/problems/count-valid-paths-in-a-tree/
var isPrime = [Bool](repeating: true, count: 100001)

func sieveOfEratosthenes() {
    isPrime[0] = false
    isPrime[1] = false
    for number in 2...Int(sqrt(100000)) {
        if isPrime[number] {
            var multiple = number * number
            while multiple <= 100000 {
                isPrime[multiple] = false
                multiple += number
            }
        }
    }
}
sieveOfEratosthenes()

class Solution {
    func countPaths(_ n: Int, _ edges: [[Int]]) -> Int {
        var tree = [[Int]](repeating: [], count: n + 1)
        for e in edges {
            let u = e[0], v = e[1]
            tree[u].append(v)
            tree[v].append(u)
        }

        var compomentSize = [Int](repeating: 0, count: n + 1)
        var visited = [Bool](repeating: false, count: n + 1)

        // ✅ 用栈代替递归 & Set
        func dfsComponent(_ start: Int) {
            var stack = [start]
            visited[start] = true
            var nodes = [Int]()

            while !stack.isEmpty {
                let node = stack.popLast()!
                nodes.append(node)

                for next in tree[node] {
                    if !visited[next] && !isPrime[next] {
                        visited[next] = true
                        stack.append(next)
                    }
                }
            }

            // ✅ 只设置一次
            for node in nodes {
                compomentSize[node] = nodes.count
            }
        }

        // ✅ 每个连通块只处理一次
        for node in 1...n {
            if !isPrime[node] && !visited[node] {
                dfsComponent(node)
            }
        }

        func cal(_ primeNode: Int) -> Int {
            var res = 0
            var total = 0

            for next in tree[primeNode] {
                let cur = compomentSize[next]
                if cur > 0 {
                    res += cur
                    res += cur * total
                    total += cur
                }
            }
            return res
        }

        var ans = 0
        for node in 1...n where isPrime[node] {
            ans += cal(node)
        }
        return ans
    }
}
