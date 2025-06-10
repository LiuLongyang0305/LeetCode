// https://leetcode.com/problems/find-the-number-of-ways-to-place-people-i/
class Solution {
    func numberOfPairs(_ points: [[Int]]) -> Int {
        let M = points.count

        func check(_ leftTop: Int,  _ rightBottom: Int) -> Bool {

            let (x1,y1) = (points[leftTop][0],points[leftTop][1])
            let (x2,y2) = (points[rightBottom][0], points[rightBottom][1])

            guard x1 <= x2 && y1 >= y2 else {return false}
            for i in 0..<M {
                guard i != leftTop && i != rightBottom else {continue}
                let (x,y) = (points[i][0],points[i][1])
                guard !( x >= x1 && x <= x2 && y >= y2 && y <= y1) else {return false}
            }


            return true
        }


        var ans = 0

        for i in 0..<M {
            for j in 0..<M {
                if i != j {
                    if check(i, j) {
                        ans += 1
                    }
                }
            }
        }
        return ans
    }
}
