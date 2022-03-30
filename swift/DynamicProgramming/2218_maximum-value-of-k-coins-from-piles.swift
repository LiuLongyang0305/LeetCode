// https://leetcode.com/problems/maximum-value-of-k-coins-from-piles/
class Solution {
    func maxValueOfCoins(_ piles: [[Int]], _ k: Int) -> Int {

        var counter = caculate(of: piles[0])
        var ans = counter[k] ?? 0
        for pile in piles.dropFirst() {
            let curCounter = caculate(of: pile)

            var newCounter = [Int:Int]()

            for (c1,v1) in counter {
                for (c2,v2) in curCounter {
                    let (totalC,totalV) = (c1 + c2,v1 + v2)
                    guard totalC <= k else {continue}
                    if let v = newCounter[totalC] {
                        newCounter[totalC] = max(totalV, v)
                    } else {
                        newCounter[totalC] = totalV
                    }
                }
            }

            ans = max(ans, newCounter[k] ?? 0)
            counter = newCounter
        }
        return ans
    }

    private func caculate(of arr: [Int]) -> [Int:Int] {
        var ans = [0:0]
        var curSum = 0
        for idx in 0..<arr.count {
            curSum += arr[idx]
            ans[idx + 1] = curSum
        }
        return ans
    }
}
