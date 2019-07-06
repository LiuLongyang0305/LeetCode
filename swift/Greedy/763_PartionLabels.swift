//https://leetcode.com/problems/partition-labels/
class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        var ans = [Int]()
        var lastIndex = Array<Int>(repeating: 0, count: 26)
        var sToArray = Array<Character>(S)
        let aToInt = Int(Character("a").asciiValue!)
        for i in 0..<S.count {
            lastIndex[Int(sToArray[i].asciiValue!) - aToInt] = i
        }
        var j = 0
        var anchor = 0
        for i in 0..<S.count {
            j = max(j, lastIndex[Int(sToArray[i].asciiValue!) - aToInt])
            if i == j {
                ans.append(i - anchor + 1)
                anchor = i + 1
            }
        }
        return ans
    }
}