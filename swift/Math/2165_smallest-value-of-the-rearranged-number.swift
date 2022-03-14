// https://leetcode.com/problems/smallest-value-of-the-rearranged-number/
class Solution {
    func smallestNumber(_ num: Int) -> Int {
        guard num != 0 else {return 0}
        return num > 0 ? getSmallestNumber(of: num) : -getLargestNumber(of: -num)
    }
    
    
    private func getSmallestNumber(of num: Int) -> Int {
        let numStr = "\(num)"

        guard numStr.contains("0") else {
            return Int(String(numStr.sorted())) ?? 0
        }
        
        
        var zeroCnt = 0
        var newStr = ""
        for ch in numStr {
            if ch == "0" {
                zeroCnt += 1
            } else {
                newStr.append(ch)
            }
        }
        
        var sortedNewStr = newStr.sorted()
        if zeroCnt != 0 {
            sortedNewStr.insert(contentsOf: String(repeating: "0", count: zeroCnt), at: 1)
        }
        
        return Int(String(sortedNewStr)) ?? 0
    }
    
    private func getLargestNumber(of num: Int) -> Int {
        return Int(String("\(num)".sorted(by: { $0 > $1}))) ?? 0
    }
    
}