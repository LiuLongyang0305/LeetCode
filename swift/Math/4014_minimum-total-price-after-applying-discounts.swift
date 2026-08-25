    // https://leetcode.cn/problems/minimum-total-price-after-applying-discounts/
    class Solution {
        func minPrice(_ prices: [Int], _ discounts: [Int]) -> Double {
            var heapPrices = Heap<Int>(prices)
            var heapDiscounts = Heap<Int>(discounts)
            var sb:Double = 0
            while let top = heapPrices.popMax() {
                let dis = heapDiscounts.popMax() ?? 0
                sb += Double(top * (100 - dis)) / 100.0
            }
            return sb
        }
    }
