//https://leetcode.com/problems/integer-replacement/
class Solution {
    func integerReplacement(_ n: Int) -> Int {
        guard n != 1 else {
            return 0
        }
        var nodes = Array<Int>()
        nodes.append(n)
        var visited = Set<Int>()
        var depth = 0
        while !nodes.isEmpty {
            let length = nodes.count
            depth += 1
            for _ in 0..<length {
                let node = nodes.removeFirst()
                if  node % 2  == 0 {
                    let val = node >> 1
                    if val == 1 {
                        return depth
                    }
                    if !visited.contains(val) {
                        visited.insert(val)
                        nodes.append(val)
                    }
                } else {
                    var val = node + 1
                    if val == 1 {
                        return depth
                    }
                    if !visited.contains(val) {
                        visited.insert(val)
                        nodes.append(val)
                    }
                    val = node - 1
                    if val == 1 {
                        return depth
                    }
                    if !visited.contains(val) {
                        visited.insert(val)
                        nodes.append(val)
                    }
                }
            }
        }
        return  depth
    }
}

class Solution2 {
    private var memo = [Int:Int]()
    func integerReplacement(_ n: Int) -> Int {
        guard n != 1 else {
            return 0
        }
        guard nil == memo[n] else {
            return memo[n]!
        }
        var ans = 0
        if n & 1 == 0 {
            ans = 1 + integerReplacement(n >> 1)
        } else {
            ans = 1 + min(integerReplacement(n + 1), integerReplacement(n - 1))
        }
        memo[n] = ans
        return ans
    }
}
