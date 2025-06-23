// https://leetcode.com/problems/find-maximum-area-of-a-triangle
class Solution {
    private typealias Pair = (max: Int,min:Int)
    func maxArea(_ coords: [[Int]]) -> Int {

        var xMin = Int.max / 2, xMax = Int.min / 2, yMin = Int.max / 2 ,yMax = Int.min / 2
        var yToXs = [Int:Pair]()
        var xToYs = [Int:Pair]()
        for c in coords {
            let (x,y) = (c[0],c[1])
            xMin = min(xMin,x)
            xMax = max(xMax,x)
            yMin = min(yMin,y)
            yMax = max(yMax,y)

            if let (ym,yn) = yToXs[y] {
                yToXs[y] = (max(ym,x),min(yn,x))
            } else {
                yToXs[y] = (x,x)
            }
            if let (xm,xn) = xToYs[x] {
                xToYs[x] = (max(xm,y),min(xn,y))
            } else {
                xToYs[x] = (y,y)
            }
        }

        var ans = 0

        for (y,(xm,xn)) in yToXs {
            ans = max(ans, (xm - xn) * max(y - yMin,yMax - y))
        }

        for (x,(ym,yn)) in xToYs {
            ans = max(ans,(ym - yn) * max(x - xMin,xMax - x))
        }
        return  ans == 0 ? -1 : ans
    }
}
