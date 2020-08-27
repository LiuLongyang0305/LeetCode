// https://leetcode.com/problems/most-visited-sector-in-a-circular-track/
class Solution {
    func mostVisited(_ n: Int, _ rounds: [Int]) -> [Int] {
        var ans = [Int]()
        var passby = Array<Int>(repeating: 0, count: n + 1)
        for i in 1..<rounds.count {
            
            let f = rounds[i - 1]
            let t = rounds[i]
            
            if t > f {
                for j in (f + 1)...t {
                    passby[j] += 1
                }
            } else {
                if f < n {
                    for j in (f + 1)...n {
                        passby[j] += 1
                    }
                }
                for j in 1...t {
                    passby[j] += 1
                }
            }
        }
        passby[rounds[0]] += 1
        let maxTime = passby.max()!
        for i in 1...n {
            if passby[i] == maxTime {
                ans.append(i)
            }
        }
        return ans
    }
}