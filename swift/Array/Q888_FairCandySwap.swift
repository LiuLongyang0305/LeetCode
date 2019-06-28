//https://leetcode.com/problems/fair-candy-swap/
class Solution {
    func fairCandySwap(_ A: [Int], _ B: [Int]) -> [Int] {
        var aliceCandySum = 0
        var bobCandySum = 0
        let setB = Set<Int>(B)
        
        for ele in A {
            aliceCandySum += ele
        }
        
        for ele in B {
            bobCandySum += ele
        }
        
        let delta = (bobCandySum - aliceCandySum) / 2
        
        for ele in A {
            if setB.contains(ele + delta) {
                return [ele,ele + delta]
            }
        }
        return [Int]()
    }
}