//https://leetcode.com/problems/brace-expansion/
class Solution {
    func expand(_ S: String) -> [String] {
        var ans = [String]()
        ans.append("")
        var sCopy = S
        while !sCopy.isEmpty {
            guard let leftIndex = sCopy.firstIndex(of: "{") else {
                ans = ans.map({ $0 + sCopy})
                break
            }
            //开头是字母
            if leftIndex != sCopy.startIndex {
                let cur = String(sCopy[sCopy.startIndex..<leftIndex])
                ans = ans.map({$0 + cur})
            }
            //{}包围，则组合
            guard let rightIndex = sCopy.firstIndex(of: "}") else {
                break
            }
            var nextLevel = [String]()
            var index = sCopy.index(after: leftIndex)
            while index != rightIndex {
                if sCopy[index] != "," {
                    nextLevel.append(contentsOf: ans.map({ $0 + "\(sCopy[index])"}))
                }
                index = sCopy.index(after: index)
            }
            ans = nextLevel
            sCopy.removeFirst(sCopy.distance(from: sCopy.startIndex, to: rightIndex) + 1)
        }
        //排序
        ans.sort()
        return ans
    }
}


