// https://leetcode.com/problems/most-beautiful-item-for-each-query/
class Solution {
    func maximumBeauty(_ items: [[Int]], _ queries: [Int]) -> [Int] {
        let N = queries.count
        let M = items.count
        var ans = [Int](repeating: -1, count: N)
        let sortedQueryIdx = (0..<N).sorted { queries[$0] > queries[$1]}
        let sortedItemsIdx = (0..<M).sorted { i, j in
            items[i][1] > items[j][1]
        }
        var  itemIdx = 0
        for idx in sortedQueryIdx {
            let limitPrice = queries[idx]
            while itemIdx < M  && items[sortedItemsIdx[itemIdx]][0] > limitPrice {
                itemIdx += 1
            }
            if itemIdx == M  {
                ans[idx] = 0
            } else {
                ans[idx] = items[sortedItemsIdx[itemIdx]][1]
            }
        }
        return ans
    }
}