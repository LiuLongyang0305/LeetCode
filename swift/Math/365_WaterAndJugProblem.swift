//https://leetcode.com/problems/water-and-jug-problem/
class Solution {
    func canMeasureWater(_ x: Int, _ y: Int, _ z: Int) -> Bool {
        guard z != 0 else {
            return true
        }
        guard x + y >= z else {
            return false
        }
        func gcd(_ a: Int, _ b: Int) -> Int {
            return b == 0 ? a : gcd(b, a % b)
        }
        let div =  gcd(x, y)
        guard div != 0 else {
            return false
        }
        return z % div == 0
    }
}