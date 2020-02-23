// https://leetcode.com/problems/closest-divisors/
class Solution {
    func closestDivisors(_ num: Int) -> [Int] {
        func getTwoNearestFactors(_ n: Int) -> [Int] {
            let mid = Int(sqrt(Double(n)))
            var temp = mid
            while temp > 0 {
                if n % temp == 0 {
                    return [temp,n / temp]
                }
                temp -= 1
            }
            return []
        }
        let pair1 = getTwoNearestFactors(num + 1)
        guard pair1[0] != pair1[1] else {
            return pair1
        }
        let pair2 = getTwoNearestFactors(num + 2)
        return abs(pair1[1] - pair1[0]) > abs(pair2[1] - pair2[0]) ? pair2 : pair1
    }
 }