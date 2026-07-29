// https://leetcode.cn/problems/maximum-number-of-items-from-sale-i/
class Solution {
    func maximumSaleItems(_ items: [[Int]], _ budget: Int) -> Int {
        // 使用 map 提取所有价格，找到最小值
        let prices = items.map { $0[1] }
        guard let minPrice = prices.min() else { return 0 }
        
        // 创建背包数组
        var dp = [Int](repeating: 0, count: budget + 1)
        
        // 处理每个物品
        for item in items {
            // 使用 filter 计算倍数数量
            let (factor, price) = (item[0],item[1])
            let cnt = items.filter { $0[0] % factor == 0 }.count
            
            // 0-1 背包更新
            for j in stride(from: budget, through: price, by: -1) {
                dp[j] = max(dp[j], dp[j - price] + cnt)
            }
        }
        
        // 计算最终答案
        return (0...budget).map { dp[$0] + ($0 < budget ? (budget - $0) / minPrice : 0) }.max() ?? 0
    }
}
