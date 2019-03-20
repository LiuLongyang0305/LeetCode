class Q70_Solution {
    func climbStairs(_ n: Int) -> Int {
        if n <= 2 {
            return n
        } else {
            var oneStepBefore = 2
            var twoStepBefore = 1
            for _ in 3...n {
                let temp = oneStepBefore + twoStepBefore
                twoStepBefore = oneStepBefore
                oneStepBefore = temp
            }
            return oneStepBefore
        }
    }
}
class Q120_Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.count == 1 {
            return triangle[0].min()!
        }
        var minResult : [[Int]] = [triangle.last!]
        let length = triangle.count
        for i in 2...length {
            var currentLevel = Array<Int>(repeating: 0, count: triangle[length - i].count)
            for j in 0..<triangle[length - i].count {
                currentLevel[j] = min(minResult.first![j], minResult.first![j + 1]) + triangle[length - i][j]
            }
            minResult.insert(currentLevel, at: 0)
        }
        return minResult[0][0]
    }
    
    func minimumTotalCompressed(_ triangle: [[Int]]) -> Int {
        if triangle.count == 1 {
            return triangle[0].min()!
        }
        var minResult : [Int] = triangle.last!
        let length = triangle.count
        for i in 2...length {
            for j in 0..<triangle[length - i].count {
                minResult[j] = min(minResult[j], minResult[j + 1]) + triangle[length - i][j]
            }
        }
        return minResult[0]
    }
}
class Q152_Solution {
    func maxProduct(_ nums: [Int]) -> Int {
        typealias SubArrayProduct = (min:Int,max:Int)
        var result = nums[0]
        var products : SubArrayProduct = (nums[0],nums[0])
        for i in 1..<nums.count {
            let p1 = nums[i] * products.max
            let p2 = nums[i] * products.min
            products.max = max(max(p1, p2),nums[i])
            products.min = min(min(p1, p2),nums[i])
            if products.max > result {
                result = products.max
            }
        }
        return result
    }
}

class Q122_Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }
        var maxProfit = 0
        var dp : [[Int]] = Array<[Int]>(repeating: Array<Int>(repeating: 0, count: 2), count: prices.count)
        dp[0][0] = 0
        dp[0][1] = -prices[0]
        for i in 1..<prices.count {
            dp[i][0] = max(dp[i - 1][0], dp[i - 1][1] + prices[i])
            dp[i][1] = max(dp[i - 1][1], dp[i - 1][0] - prices[i])
            if dp[i][0] > maxProfit {
                maxProfit = dp[i][0]
            }
            if dp[i][1] > maxProfit {
                maxProfit = dp[i][1]
            }
        }
        return maxProfit
    }
}

class Q121_Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.count < 2 {
            return 0
        }
        var minPrice = prices[0]
        var maxProfit = 0
        for i in 1..<prices.count {
            let currentPrice = prices[i]
            if currentPrice < minPrice {
                minPrice = prices[i]
            }
            let currentProfit = currentPrice - minPrice
            if currentProfit > maxProfit {
                maxProfit = currentProfit
            }
        }
        return maxProfit
    }
}
