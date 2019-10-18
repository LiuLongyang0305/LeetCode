//https://leetcode.com/problems/longest-uncommon-subsequence-ii/
extension  Int {
    func toArray() -> [Bool] {
        var ans = [Bool]()
        var n = self
        while n >  0 {
            ans.append(n & 1 == 1)
            n >>= 1
        }
        return ans
    }
}

class Solution1 {
    func findLUSlength(_ strs: [String]) -> Int {
        
        var inclusion = Array<Set<String>>(repeating: Set<String>(), count: 11)
        var exclusion = Array<Set<String>>(repeating: Set<String>(), count: 11)
        let strsToChars = strs.map {[Character]($0)}
        let maxNumbers = strs.map { (str) -> Int in
            return Int(pow(2.0, Double(str.count))) - 1
        }
        let maxNumber = maxNumbers.max()!
        let numberToArray = (0...maxNumber).map {$0.toArray()}
        for i in 1...maxNumber {
            let numberArr = numberToArray[i]
            for j in 0..<strs.count {
                if i <= maxNumbers[j] {
                    var temp = ""
                    for k in 0..<numberArr.count {
                        if numberArr[k] {
                            temp.append(strsToChars[j][k])
                        }
                    }
                    if !exclusion[temp.count].contains(temp) {
                        if inclusion[temp.count].contains(temp) {
                            exclusion[temp.count].insert(temp)
                            inclusion[temp.count].remove(temp)
                        } else {
                            inclusion[temp.count].insert(temp)
                        }
                    }
                }
            }
        }
        for i in (1...10).reversed() {
            if !inclusion[i].isEmpty  {
                return i
            }
        }
        return -1
    }
}
class Solution {
    func findLUSlength(_ strs: [String]) -> Int {
        
        var inclusion = Set<String>()
        var exclusion = Set<String>()
        let strsToChars = strs.map {[Character]($0)}
        let maxNumbers = strs.map { (str) -> Int in
            return Int(pow(2.0, Double(str.count))) - 1
        }
        let maxNumber = maxNumbers.max()!
        let numberToArray = (0...maxNumber).map {$0.toArray()}
        for i in 1...maxNumber {
            let numberArr = numberToArray[i]
            for j in 0..<strs.count {
                if i <= maxNumbers[j] {
                    var temp = ""
                    for k in 0..<numberArr.count {
                        if numberArr[k] {
                            temp.append(strsToChars[j][k])
                        }
                    }
                    if !exclusion.contains(temp) {
                        if inclusion.contains(temp) {
                            exclusion.insert(temp)
                            inclusion.remove(temp)
                        } else {
                            inclusion.insert(temp)
                        }
                    }
                }
            }
        }
        guard !inclusion.isEmpty else {
            return -1
        }
        var ans = 0
        inclusion.forEach { ans = max(ans, $0.count)}
        return ans
    }
}

class Solution2 {
    func findLUSlength(_ strs: [String]) -> Int {
        var strCounter = [String:Int]()
        for str in strs {
            if let c = strCounter[str] {
                strCounter[str] = c + 1
            } else {
                strCounter[str] = 1
            }
        }
        let sortedStrs =  strCounter.sorted { (dic1, dic2) -> Bool in
            dic1.key.count > dic2.key.count
        }
        guard sortedStrs[0].value != 1 else {
            return sortedStrs[0].key.count
        }
        let maxNumber = Int(pow(2.0, Double(sortedStrs[0].key.count))) - 1
        let numToArray = (0...maxNumber).map { $0.toArray()}
        var inclusion = Array<Set<String>>(repeating: Set<String>(), count: 11)
        var exclusion = Array<Set<String>>(repeating: Set<String>(), count: 11)
        for j in 0..<sortedStrs.count {
            let (str,count) = sortedStrs[j]
            let temp = Int(pow(2.0, Double(str.count))) - 1
            let chars = Array<Character>(str)
            //重复的字符串
            if count != 1 {
                //处理原串
                exclusion[str.count].insert(str)
                //处理子串
                for i in 1..<temp {
                    let substr = getSubstring(chars, numToArray[i])
                    exclusion[substr.count].insert(substr)
                }
                continue
            }
            
            //仅出现一次的字符串
            //处理原串
            if !exclusion[str.count].contains(str){
                guard inclusion[str.count].contains(str) else {
                    return str.count
                }
                inclusion[str.count].remove(str)
                exclusion[str.count].insert(str)
            }
            //处理子串
            for i in 1..<temp {
                let subStr = getSubstring(chars, numToArray[i])
                if !exclusion[subStr.count].contains(subStr) {
                    if !inclusion[subStr.count].contains(subStr) {
                        guard !(j == sortedStrs.count - 1 || sortedStrs[j + 1].key.count <= subStr.count) else {
                            return subStr.count
                        }
                        inclusion[subStr.count].insert(subStr)
                        continue
                    }
                    inclusion[subStr.count].remove(subStr)
                    exclusion[subStr.count].insert(subStr)
                }
            }
            
        }
        
        for i in (0..<11).reversed() {
            if !inclusion[i].isEmpty {
                return i
            }
        }
        return -1
    }
    
    private func getSubstring(_ chars: [Character],_ mask: [Bool]) -> String {
        var ans = ""
        for k in 0..<mask.count {
            if mask[k] {
                ans.append(chars[k])
            }
        }
        return ans
    }
}
