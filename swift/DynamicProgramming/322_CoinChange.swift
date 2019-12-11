 //https://leetcode.com/problems/coin-change/
 class Solution1 {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else {
            return amount == 0 ? 0 : -1
        }
        var queue = Array<Int>()
        var visited = Set<Int>()
        visited.insert(amount)
        for coin in coins {
            if amount > coin {
                queue.append(amount - coin)
            } else if amount == coin {
                return 1
            }
        }
        guard !queue.isEmpty else {
            return -1
        }
        var depth = 0
        while !queue.isEmpty {
            depth += 1
            let length = queue.count
            for _ in 0..<length {
                let target = queue.removeFirst()
                for coin in coins {
                    let next = target - coin
                    guard next != 0 else {
                        return depth + 1
                    }
                    if next > 0 && !visited.contains(next){
                        visited.insert(next)
                        queue.append(next)
                    }
                }
            }
        }
        return -1
    }
 }
 class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard amount > 0 else {
            return amount == 0 ? 0 : -1
        }
        let sortedCoins = coins.sorted()
        var dp = Array<Int>(repeating: Int.max, count: amount + 1)
        dp[0] = 0
        for coin in coins {
            if coin <= amount {
                dp[coin] = 1
            }
        }
        for i in 1...amount {
            if dp[i] == 1 {
                continue
            }
            var minCoinsNumber = Int.max
            for coin in sortedCoins {
                if coin > i {
                    break
                }
                minCoinsNumber = min(minCoinsNumber, dp[i  - coin])
            }
            if minCoinsNumber != Int.max {
                dp[i] = minCoinsNumber + 1
            }
        }
        return dp.last! == Int.max ? -1: dp.last!
    }
 }
