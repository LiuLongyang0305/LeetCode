// https://leetcode.cn/problems/unit-conversion-ii/
class Solution {
    let MOD: Int = 1_000_000_007

        // MARK: - 快速幂
    func modPow(_ base: Int, _ exp: Int) -> Int {
        var b = base % MOD
        var e = exp
        var res: Int = 1
        while e > 0 {
            if e & 1 == 1 {
                res = (res * b) % MOD
            }
            b = (b * b) % MOD
            e >>= 1
        }
        return res
    }

        // MARK: - 模逆元 (费马小定理)
    func modInverse(_ x: Int) -> Int {
        return modPow(x, MOD - 2)
    }

        // MARK: - 主函数
    func queryConversions(
        _ conversions: [[Int]],
        _ queries: [[Int]]
    ) -> [Int] {
            // 邻接表: [node: [(neighbor, factor, forward)]]
            // forward == true  : node 是 source，neighbor 是 target (1 node = factor neighbor)
            // forward == false : neighbor 是 source，node 是 target (1 neighbor = factor node)
        var adj: [Int: [(Int, Int, Bool)]] = [:]
        for conv in conversions {
            let u = conv[0], v = conv[1], f = conv[2]
            let factor = f
            adj[u, default: []].append((v, factor, true))
            adj[v, default: []].append((u, factor, false))
        }

            // rootVal[i] = 1 个 i 等价于多少个 root(0)，模 MOD 下的值
        var rootVal = [Int](repeating: 0, count: conversions.count + 1)
        rootVal[0] = 1

            // BFS 预处理（避免递归深度问题）
        var queue: [Int] = [0]
        var head = 0
        var visited = Set<Int>()
        visited.insert(0)

        while head < queue.count {
            let u = queue[head]
            head += 1
            guard let neighbors = adj[u] else { continue }
            for (v, factor, forward) in neighbors {
                if visited.contains(v) { continue }
                visited.insert(v)
                if forward {
                        // 1 u = factor v  =>  v 的价值 = u 的价值 / factor
                    rootVal[v] = (rootVal[u] * modInverse(factor)) % MOD
                } else {
                        // 1 v = factor u  =>  v 的价值 = u 的价值 * factor
                    rootVal[v] = (rootVal[u] * factor) % MOD
                }
                queue.append(v)
            }
        }

            // 处理每个查询
        var answers: [Int] = []
        for q in queries {
            let a = q[0], b = q[1]
            if a == b {
                answers.append(1)
            } else {
                let valA = rootVal[a]
                let valB = rootVal[b]
                    // 1 个 a = valA / valB 个 b  (在模意义下就是 valA * inv(valB))
                let invB = modInverse(valB)
                let ans = (valA * invB) % MOD
                answers.append(Int(ans))
            }
        }

        return answers
    }
}
