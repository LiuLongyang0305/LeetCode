// https://leetcode.com/problems/k-th-smallest-prime-fraction/
class Solution {
    private typealias Triple = (numerator: Int,denominator: Int, fraction: Double)
    func kthSmallestPrimeFraction(_ arr: [Int], _ k: Int) -> [Int] {
        let N = arr.count
        var fractions = [Triple]()
        for i in 0..<(N - 1) {
            for j in (i + 1)..<N {
                fractions.append((arr[i],arr[j],Double(arr[i]) / Double(arr[j])))
            }
        }
        fractions.sort { (t1, t2) -> Bool in
            t1.fraction < t2.fraction
        }
        // print(fractions)
        return [fractions[k - 1].numerator,fractions[k - 1].denominator]
    }
}