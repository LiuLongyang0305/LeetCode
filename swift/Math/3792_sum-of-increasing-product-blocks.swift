    // https://leetcode.cn/problems/sum-of-increasing-product-blocks/
    /// 模数 10^9 + 7
let mod: Int = 1_000_000_007


func getBlocksProduct() -> [Int] {
        /// 块的总数
    let blockCount = 1000

        /// 存储每个块的结果
    var blockResults: [Int] = []
        /// 记录下一块的起始整数（第1块从1开始）
    var currentStart = 1

    for i in 1...blockCount {
            // 第 i 块包含 i 个连续整数：currentStart, currentStart+1, ..., currentStart+i-1
        var product: Int = 1

        for j in 0..<i {
            let num = currentStart + j
            product = (product * num) % mod
        }

            // 保存结果
        blockResults.append(product)

            // 更新下一块的起始数字
        let blockEnd = currentStart + i - 1
        currentStart = blockEnd + 1
    }
    return blockResults
}

func getPreffix() -> [Int] {
    var pre = [0]
    let bp = getBlocksProduct()
    for v in bp {
        pre.append((pre.last! + v) % mod)
    }
    return pre
}
let preffixSum = getPreffix()
class Solution {
    func sumOfBlocks(_ n: Int) -> Int {
        return preffixSum[n]
    }
}
