// https://leetcode.com/problems/number-of-pairs-of-interchangeable-rectangles/
class Solution {
    func interchangeableRectangles(_ rectangles: [[Int]]) -> Int {
        var counter = [String:Int]()
        var ans = 0
        for rec in rectangles {
            let (w,h) = (rec[0],rec[1])
            let t = gcd(w, h)
            let key = "\(w/t)-\(h/t)"
            if let c = counter[key] {
                ans += c
            }
            counter[key, default: 0 ] += 1
        }
        return ans
    }
    
    private func gcd(_ a: Int,_ b: Int) -> Int {
        return b > 0 ? gcd(b, a % b) : a
    }
}