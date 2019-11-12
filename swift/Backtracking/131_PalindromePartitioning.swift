//https://leetcode-cn.com/problems/palindrome-partitioning
class Solution {
    func partition(_ s: String) -> [[String]] {
        guard s.count > 1 else {
            return [[s]]
        }
        var ans = [[String]]()
        var sCopy = s
        var temp = ""
        while !sCopy.isEmpty {
            temp.append(sCopy.removeFirst())
            if isPalindrome(temp) {
                if !sCopy.isEmpty {
                    var rightPartitions = partition(sCopy)
                    for i in 0..<rightPartitions.count {
                        rightPartitions[i].insert(temp, at: 0)
                    }
                    ans.append(contentsOf: rightPartitions)
                } else {
                    ans.append([temp])
                }
            }
        }
        return ans
    }
    private func isPalindrome(_ str: String) -> Bool {
        guard str.count > 1 else {
            return true
        }
        let length = str.count
        let chars = [Character](str)
        for i in 0..<length >> 1 {
            if chars[i] != chars[length - 1 - i] {
                return false
            }
        }
        return true
    }
}

//Memorization
class Solution2 {
    var set = [String:[[String]]]()
    func partition(_ s: String) -> [[String]] {
        guard s.count > 1 else {
            return [[s]]
        }
        var ans = [[String]]()
        var sCopy = s
        var temp = ""
        while !sCopy.isEmpty {
            temp.append(sCopy.removeFirst())
            if isPalindrome(temp) {
                if !sCopy.isEmpty {
                    var  rightPartitions = [[String]]()
                    if let strs = set[sCopy] {
                        rightPartitions = strs
                    } else {
                        rightPartitions = partition(sCopy)
                        set[sCopy] = rightPartitions
                    }
                    
                    for i in 0..<rightPartitions.count {
                        rightPartitions[i].insert(temp, at: 0)
                    }
                    ans.append(contentsOf: rightPartitions)
                } else {
                    ans.append([temp])
                }
            }
        }
        return ans
    }
    private func isPalindrome(_ str: String) -> Bool {
        guard str.count > 1 else {
            return true
        }
        let length = str.count
        let chars = [Character](str)
        for i in 0..<length >> 1 {
            if chars[i] != chars[length - 1 - i] {
                return false
            }
        }
        return true
    }
}