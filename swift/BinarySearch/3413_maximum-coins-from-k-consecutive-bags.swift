//leetcode.com/problems/maximum-coins-from-k-consecutive-bags
class Solution {
    private typealias RangeInfo = (left:Int,right:Int,cnt: Int)
    func maximumCoins(_ coins: [[Int]], _ k: Int) -> Int {
        var ranges = coins.map { coin in
            return RangeInfo(coin[0],coin[1],coin[2])
        }.sorted { $0.left < $1.left}
        ranges.insert((-1_000_000_007,ranges[0].left - 1,0), at: 0)
        if let l = ranges.last {
            ranges.append((l.right + 1,1_000_000_007,0))
        }



        var prffix = [0]
        for range in ranges {
            prffix.append(prffix.last! + (range.right - range.left + 1) * range.cnt)
        }

        //第一个左端点大于target
         func binarySearch1(_ target: Int) -> Int {
            var l = 0
            var r = ranges.count - 1
            while l < r {
                let mid = (l + r) >> 1
                if ranges[mid].left > target {
                    r = mid
                } else {
                    l = mid + 1
                }
            }
            return l
        }



       var ans = 0
        //从左至右
        for leftIdx in 0..<ranges.count {
            let (l,r,c) = ranges[leftIdx]
            let rightLimit = l + k - 1
            if rightLimit <= r {
                ans = max(ans, k * c)
                continue
            }

            let rightIndex = binarySearch1(rightLimit)
            let possibleIdx = rightIndex - 1

            if ranges[possibleIdx].right >= rightLimit {
                let t = prffix[possibleIdx] - prffix[leftIdx] + (rightLimit - ranges[possibleIdx].left + 1) * ranges[possibleIdx].cnt
                ans = max(ans,t)
            } else {
                ans = max(ans,prffix[rightIndex] - prffix[leftIdx])
            }


        }

        //right --> left
        for rightIdx in stride(from: ranges.count - 1, through: 0, by: -1) {
            let (l,r,c) = ranges[rightIdx]
            let leftLimit = r - k + 1
            if leftLimit >= l {
                ans = max(ans,k * c)
                continue
            }

            let leftIdx = binarySearch1(leftLimit)
            let possibleIdx = leftIdx - 1
            if leftLimit > ranges[possibleIdx].right {
                ans = max(ans,prffix[rightIdx + 1] - prffix[leftIdx])
            } else {
                let t = prffix[rightIdx + 1] - prffix[leftIdx] + (ranges[possibleIdx].right - leftLimit + 1) * ranges[possibleIdx].cnt
                ans = max(ans,t)
            }

        }


        return ans
    }
}
