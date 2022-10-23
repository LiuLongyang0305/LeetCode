// https://leetcode.com/problems/minimum-cost-to-make-array-equal/
class Solution{
    private typealias Pair = (num: Int,cost: Int)
    func minCost(_ nums: [Int], _ cost: [Int]) -> Int {


        guard nums.count > 1 else {return 0}
        let N = nums.count


        let sortedPairs:[Pair] = (0..<N).map { (nums[$0],cost[$0])}.sorted { p1, p2 in
            p1.num < p2.num
        }

        var productPreffix = [0]
        var costPreffix = [0]
        for pair in sortedPairs {
            productPreffix.append(productPreffix.last! + pair.num * pair.cost)
            costPreffix.append(costPreffix.last! + pair.cost)
        }

        let costTotal = costPreffix.last!
        let productTotal = productPreffix.last!

        func binarySearch(target: Int) -> Int {
            var left = 0
            var right = N - 1
            while left < right {
                let mid = (left + right) >> 1
                if sortedPairs[mid].num > target {
                    right = mid
                } else {
                    left = mid + 1
                }
            }
            return left
        }

        let minEle = sortedPairs[0].num
        let maxEle = sortedPairs[N - 1].num
        guard maxEle > minEle else {return 0}

        var ans = min(productTotal - minEle * costTotal, maxEle * costTotal - productTotal)
        var targetNum = minEle + 1
        while targetNum < maxEle {
            let split = binarySearch(target: targetNum)
            ans = min(ans,targetNum * (2 * costPreffix[split] - costTotal) + productTotal - 2 * productPreffix[split])
            targetNum += 1
        }



       return ans
    }
}
