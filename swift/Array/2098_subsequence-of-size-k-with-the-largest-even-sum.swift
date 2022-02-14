//  https://leetcode.com/problems/subsequence-of-size-k-with-the-largest-even-sum/
class Solution {
    func largestEvenSum(_ nums: [Int], _ k: Int) -> Int {
        
        var oddNumbers = [Int]()
        var evenNumbers = [Int]()
        for num in nums {
            if num & 1 == 0 {
                evenNumbers.append(num)
            } else {
                oddNumbers.append(num)
            }
        }
        
        oddNumbers.sort {$0 > $1}
        evenNumbers.sort{$0 > $1}
        let oddNumbersPreffix = getPreffix(oddNumbers)
        let evenNumbersPreffix = getPreffix(evenNumbers)
        guard !oddNumbers.isEmpty else {
            if k > evenNumbers.count {
                return -1
            }
            return evenNumbersPreffix[k]
        }
        guard !evenNumbers.isEmpty else {
            if k % 2 == 1 {
                return -1
            }
            if k > oddNumbers.count {
                return -1
            }
            return oddNumbersPreffix[k]
        }

        var ans = -1
        for evenNumberCnt in 0...min(k, evenNumbers.count) {
            let oddNumberCnt = k - evenNumberCnt
            guard oddNumberCnt & 1 == 0 && oddNumberCnt <= oddNumbers.count else {continue}
            ans = max(ans, evenNumbersPreffix[evenNumberCnt] + oddNumbersPreffix[oddNumberCnt])
        }
        return ans
    }
    
    private func getPreffix(_ nums: [Int]) -> [Int] {
        var ans = [0]
        nums.forEach {ans.append(ans.last! + $0)}
        return ans
    }
}