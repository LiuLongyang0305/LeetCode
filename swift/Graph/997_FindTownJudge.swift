//https://leetcode.com/problems/find-the-town-judge/
class Solution {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        guard 1 != N else {
            return 1
        }
        var potentialJudges = Set<Int>(1...N)
        var trustersCounter = Dictionary<Int,Int>()
        for temp in trust {
            potentialJudges.remove(temp[0])
            if nil == trustersCounter[temp[1]] {
                trustersCounter[temp[1]] = 1
            } else {
                trustersCounter[temp[1]] = trustersCounter[temp[1]]! + 1
            }
        }
        if potentialJudges.isEmpty {
            return -1
        } else {
            for judge in potentialJudges {
                if trustersCounter[judge] == N - 1 {
                    return judge
                }
            }
        }
        return -1
    }
}


class Solution2 {
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
        guard 1 != N else {
            return 1
        }
        typealias NodeDgrees = (in0: Int, out: Int)
        var degrees = Array<NodeDgrees>(repeating: (0,0), count: N + 1)
        for tempTrust in trust {
            degrees[tempTrust[1]].in0 += 1
            degrees[tempTrust[0]].out += 1
        }
        for i in 1...N {
            if degrees[i].in0 == N - 1 && degrees[i].out == 0 {
                return i
            }
        }
        return -1
    }
}