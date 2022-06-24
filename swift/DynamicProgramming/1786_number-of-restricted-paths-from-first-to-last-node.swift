// https://leetcode.com/problems/number-of-restricted-paths-from-first-to-last-node/
import CoreFoundation
typealias PII = (dis:Int,src:Int)
extension CFBinaryHeap {
    static public func getMinHeapOfPII() -> CFBinaryHeap {
        var callbacks = CFBinaryHeapCallBacks()
        callbacks.compare = { a, b,_ in
            let x = a!.load(as: PII.self)
            let y = b!.load(as: PII.self)
            return x.dis == y.dis ? .compareEqualTo : (x.dis < y.dis ? .compareLessThan : .compareGreaterThan)
        }
        return CFBinaryHeapCreate(nil, 0, &callbacks, nil)
    }
}




class Solution {

    private typealias Edge = (node:Int,weight:Int)
    private let INF = 10000000000
    private let MOD = 1000000007

    func countRestrictedPaths(_ n: Int, _ edges: [[Int]]) -> Int {

        var graph = [[Edge]](repeating: [], count: n)
        edges.forEach { e in
            let f = e[0] - 1,s = e[1] - 1, d = e[2]
            graph[f].append((s,d))
            graph[s].append((f,d))
        }

        ///Dijkstra's algorithm

        var dis = [Int](repeating: INF, count: n)
        var visited = [Bool](repeating: false, count: n)
        var pointer: UnsafeMutablePointer<PII> = .allocate(capacity: 1)
        let minHeap = CFBinaryHeap.getMinHeapOfPII()
        pointer.initialize(to: (0,n - 1))
        CFBinaryHeapAddValue(minHeap, pointer)

        while CFBinaryHeapGetCount(minHeap) > 0 {
            let (d,cur) = CFBinaryHeapGetMinimum(minHeap).load(as: PII.self)
            CFBinaryHeapRemoveMinimumValue(minHeap)
            guard !visited[cur] else {continue}
            dis[cur] = d
            visited[cur] = true

            for (next,w) in graph[cur] {
                guard !visited[next] else {continue}
                pointer = .allocate(capacity: 1)
                pointer.initialize(to: (d + w,next))
                CFBinaryHeapAddValue(minHeap, pointer)
            }
        }


        //记忆化DFS
        var memo = [Int](repeating: -1, count: n)

        func dfs(_ cur: Int) -> Int {
            guard cur != n - 1 else {return 1}
            guard -1 == memo[cur] else {return memo[cur]}
            var ans = 0
            for (next,_) in graph[cur] {
                guard dis[next] < dis[cur] else {continue}
                ans += dfs(next)
                ans %= MOD
            }
            memo[cur] = ans
            return ans
        }


        return dfs(0)
    }
}