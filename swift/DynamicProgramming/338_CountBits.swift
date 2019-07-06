//https://leetcode.com/problems/counting-bits/
class Solution {
    func countBits(_ num: Int) -> [Int] {
        
        guard num > 0 else {
            return [0]
        }
        
        var tempArray = [0]
        let times = Int(log2(Double(num)))
        for _ in 1...(times + 1) {
            let delatArray = tempArray.map { (val) -> Int in
                val + 1
            }
            tempArray.append(contentsOf: delatArray)
        }
        
        return Array<Int>(tempArray[0...num])
    }
}


class Solution2 {
    func countBits(_ num: Int) -> [Int] {
        var ans = Array<Int>(repeating: 0, count: num + 1)
        guard num > 0 else {
            return ans
        }
        for i in 1...num {
            ans[i] = ans[i & (i - 1)] + 1
        }
        return ans
    }
    
}