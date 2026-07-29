import BitCollections
    // https://leetcode.cn/problems/maximum-number-of-items-from-sale-ii/
    class Solution {
        private typealias Pair = (price: Int, cnt:Int)
        func maximumSaleItems(_ items: [[Int]], _ budget: Int) -> Int {
            let N = items.count
            var cntFactor = [Int](repeating: 0, count: N + 1)
            var minPrice = Int.max
            for item in items {
                cntFactor[item[0]] += 1
                minPrice = min(minPrice,item[1])
            }
            var cntMulti = [Int](repeating: 0, count: N + 1)
            var itemAndFreeItemCnt = [Pair]()
            for item in items {
                let (factor,price) = (item[0],item[1])
                guard price < minPrice * 2 else {continue}
                if cntMulti[factor] == 0 {
                    var j = factor
                    while j <= N {
                        cntMulti[factor] += cntFactor[j]
                        j += factor
                    }
                }
                let cnt = cntMulti[factor] - 1
                if cnt > 0 {
                    itemAndFreeItemCnt.append((price,cnt))
                }
            }
            itemAndFreeItemCnt.sort { p1, p2 in
                return p1.price < p2.price
            }
            var sb = 0
            var remainBudget = budget
            for (p,c) in itemAndFreeItemCnt {
                guard remainBudget >= p else {continue}
                let cnt = min(c,remainBudget / p)
                remainBudget -= p * cnt
                sb += cnt * 2
            }
            sb += remainBudget / minPrice
            return sb
        }
    }
