// https://leetcode.com/problems/tree-of-coprimes
class Solution {
    private typealias Pair = (level:Int,node:Int)
    private static var primerNumbers = Array<Array<Int>>(repeating: [], count: 55)
    func getCoprimes(_ nums: [Int], _ edges: [[Int]]) -> [Int] {
        let N = nums.count
        var ans = Array<Int>(repeating: -1, count: N)
        var tree = Array<Array<Int>>(repeating: [], count: N)
        for edge in edges {
            tree[edge[0]].append(edge[1])
            tree[edge[1]].append(edge[0])
        }
        var stack = Array<Array<Pair>>(repeating: Array<Pair>(), count: 55)
        func dfs(_ node: Int, _ pre: Int, _ level: Int) {
            var res = -1
            var lev = -1
            if Solution.primerNumbers[nums[node]].isEmpty {
                Solution.primerNumbers[nums[node]] = getPrimerNumbers(of: nums[node])
            }
            for idx in Solution.primerNumbers[nums[node]] {
                if !stack[idx].isEmpty {
                    if let pair = stack[idx].last, pair.level > lev {
                        res = pair.node
                        lev = pair.level
                    }
                }
            }
            ans[node] = res
            for child in tree[node] {
                if child != pre {
                    stack[nums[node]].append((level, node))
                    dfs(child, node, level + 1)
                    stack[nums[node]].removeLast()
                }
            }
        }
        dfs(0, -1, 0)
        return ans
    }
    private func getPrimerNumbers(of num: Int) -> [Int] {
        var ans = [Int]()
        for another in 1...50 {
            if gcd(num, another) == 1 {
                ans.append(another)
            }
        }
        return ans
    }
    private func gcd(_ a: Int, _ b: Int) -> Int {
        return  a % b == 0 ? b : gcd(b, a % b)
    }
}


