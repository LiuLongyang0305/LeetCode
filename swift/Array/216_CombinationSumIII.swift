//https://leetcode.com/problems/combination-sum-iii/
class Solution {
    var ans = Set<[Int]>()
    var k = -1
    var n = -1
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        guard k > 0 &&  k < 10 else {
            return []
        }
        guard n > 0 && n <= k * (19 - k) / 2 else {
            return []
        }
        guard k != 1 else {
            return [[n]]
        }
        
        self.k = k
        self.n = n
        
        for i in 1...8 {
            getNumber(currentArr: [i], sum: i, unusedNumbers: Set<Int>((i + 1)...9))
        }
        return Array<[Int]>(ans)
    }
    private func getNumber(currentArr:[Int],sum: Int,unusedNumbers: Set<Int>) {
        
        guard sum < n else {
            return
        }
        
        if currentArr.count == k - 1 {
            let  target = n - sum
            if unusedNumbers.contains(target)  {
                var arr = currentArr
                arr.append(target)
                ans.insert(arr.sorted())
            }
            return
        }
        
        var arr = currentArr
        var unusedNumbersCopy = unusedNumbers
        for ele in unusedNumbers.sorted() {
            if sum + ele < n {
                arr.append(ele)
                unusedNumbersCopy.remove(ele)
                getNumber(currentArr: arr, sum: sum + ele, unusedNumbers: unusedNumbersCopy)
                arr.removeLast()
                unusedNumbersCopy.insert(ele)
            }
        }
    }
}