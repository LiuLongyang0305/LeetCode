// https://leetcode.com/problems/maximum-white-tiles-covered-by-a-carpet/
class Solution {
    private typealias Tile = (left:Int,right: Int)
    private let INF = 10000000007
    func maximumWhiteTiles(_ ts: [[Int]], _ carpetLen: Int) -> Int {

        var sortedTiles = [Tile]()

        for t in ts {
            sortedTiles.append((t[0],t[1]))
        }
        sortedTiles.append((INF,INF))
        sortedTiles.sort {$0.left < $1.left}
        let N = sortedTiles.count

        let startPos = sortedTiles.map { $0.left}
        var preffix = [Int](repeating: 0, count: N + 1)
        for i in 1...sortedTiles.count {
            preffix[i] = preffix[i - 1] + sortedTiles[i - 1].right - sortedTiles[i - 1].left + 1
        }




        func  binarySearch(_ target: Int) -> Int {
            var left = 0
            var right = startPos.count

            while left < right {
                let mid = (left + right) >> 1
                if startPos[mid] <= target {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            return left
        }

        var ans = 0
        for i in 0..<N{
            let (s,e) = sortedTiles[i]
            if e >= s + carpetLen - 1 {return carpetLen}
            let endIdx = binarySearch(s + carpetLen - 1) - 1

            var compensate = 0
            if sortedTiles[endIdx].right > s + carpetLen - 1 {
                compensate = sortedTiles[endIdx].right - s - carpetLen + 1
            }
            ans = max(ans, preffix[endIdx + 1] - preffix[i] - compensate)
        }
        return  ans
    }
}