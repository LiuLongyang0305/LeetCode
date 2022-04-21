// https://leetcode.com/problems/maximum-total-beauty-of-the-gardens/
class Solution {
    func maximumBeauty(_ flowers: [Int], _ newFlowers: Int, _ target: Int, _ full: Int, _ partial: Int) -> Int {

        var sortedFlowers = flowers.sorted()
        var curBeauty = 0

        if let firstIndex = sortedFlowers.firstIndex(where: {$0 >= target}) {
            curBeauty = full * (sortedFlowers.count - firstIndex)
            sortedFlowers = [Int](sortedFlowers[..<firstIndex])
        }
        guard !sortedFlowers.isEmpty else {
            return curBeauty
        }

        let N = sortedFlowers.count
        var preffix = [0] + sortedFlowers
        for i in 1...N {
            preffix[i] += preffix[i - 1]
        }

        func caculate(_ flowersLeft:Int,_ maxCnt: Int) -> Int {

            var left = 0
            var right = maxCnt - 1


            while left < right {
                let mid = (left + right + 1) >> 1
                let minFlowers =  sortedFlowers[mid]
                let need = minFlowers * (mid + 1) - preffix[mid + 1]
                if need <= flowersLeft {
                    left = mid
                } else {
                    right = mid - 1
                }

            }

            let t = flowersLeft - (sortedFlowers[left] * (left + 1) - preffix[left + 1])
            return min(sortedFlowers[left] + t / (left + 1),target - 1)
        }
        var ans = 0
        if preffix.last! + newFlowers >= target * N {
            ans = N * full
        }
        //  枚举完善花园的数量，并且贪心

        var fullGardenCnt = 0

        while fullGardenCnt < N {

            let need = target * fullGardenCnt - (preffix[N] - preffix[N - fullGardenCnt])
            guard need <= newFlowers else {break}

            let M = caculate(newFlowers - need, N - fullGardenCnt)
            ans = max(full * fullGardenCnt + M * partial,ans)
            fullGardenCnt += 1
        }
        return curBeauty + ans
    }
}