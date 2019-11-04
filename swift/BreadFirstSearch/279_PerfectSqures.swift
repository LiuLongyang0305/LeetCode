//https://leetcode.com/problems/perfect-squares/
class Solution {
    func numSquares(_ n: Int) -> Int {
        var dp = Array<Int>(repeating: 0, count: max(5,n + 1))
        dp[0] = 0
        dp[1] = 1
        dp[2] = 2
        dp[3] = 3
        dp[4] = 1
        guard n > 4 else {
            return dp[n]
        }
        let sq = Int(sqrt(Double(n)))
        guard sq * sq != n else {
            return 1
        }
        let squreNumbers =  (1...sq).map{$0 * $0}
        let squreNumbersSet = Set<Int>(squreNumbers)
        for i in 5...n {
            if squreNumbersSet.contains(i) {
                dp[i] = 1
            } else {
                dp[i] = i
                var j = 0
                while j < squreNumbers.count && squreNumbers[j] < i {
                    dp[i] = min(dp[i], dp[squreNumbers[j]] + dp[i - squreNumbers[j]])
                    j += 1
                }
            }
        }
        return dp[n]
    }
}

class Solution2 {
    func numSquares(_ n: Int) -> Int {
        var temp = n
        while temp % 4 == 0 {
            temp /=  4
        }
        if temp % 8 == 7 {
            return 4
        }
        
        let sq = Int(sqrt(Double(n)))
        let squreNumbers =  (0...sq).map{$0 * $0}
        let squreNumbersSet = Set<Int>(squreNumbers)
        for squre in squreNumbers {
            if squreNumbersSet.contains(temp - squre) {
                return squre != 0 && temp - squre != 0 ? 2 : 1
            }
        }
        return 3
    }
}
class Solution3 {
    typealias State = (val:Int, level: Int)
    func numSquares(_ n: Int) -> Int {
        var visited =  Set<Int>()
        let sq = Int(sqrt(Double(n)))
        guard sq  * sq != n else {
            return 1
        }
        let squreNumbers =  (1...sq).map{$0 * $0}
        var nodes =  Array<State>()
        nodes.append((n,0))
        while !nodes.isEmpty {
            let length = nodes.count
            print(nodes)
            for _ in 0..<length {
                let (currentVal, currentLevel) = nodes.removeFirst()
                var i =  0
                while i < squreNumbers.count && squreNumbers[i] <= currentVal {
                    let nodeVal = currentVal - squreNumbers[i]
                    if nodeVal == 0 {
                        return currentLevel + 1
                    }
                    if !visited.contains(nodeVal) {
                        visited.insert(nodeVal)
                        nodes.append((nodeVal,currentLevel + 1))
                    }
                    i += 1
                }
            }
        }
        return 0
    }
}