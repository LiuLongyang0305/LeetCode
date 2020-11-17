// https://leetcode.com/problems/basic-calculator-iii/
class Solution {
    private let operatorsSet = Set<Character>("+-*/")
    func calculate(_ s: String) -> Int {
        var deleteSpaceS = s
        if s.contains(" ") {
            deleteSpaceS = s.replacingOccurrences(of: " ", with: "", options: String.CompareOptions.literal, range: nil)
        }
        while deleteSpaceS.contains("(") {
            var i: Int = -1
            var j: Int = -1
            var idx = 0
            for ch in deleteSpaceS {
                if ch == "(" {
                    i = idx
                }
                if ch == ")" {
                    j = idx
                    break
                }
                idx += 1
            }
            let leftIdx = s.index(s.startIndex, offsetBy: i)
            let rightIdx = s.index(s.startIndex, offsetBy: j)
            let subStr = String(deleteSpaceS[deleteSpaceS.index(after: leftIdx)..<rightIdx])
            deleteSpaceS.replaceSubrange(Range<String.Index>(uncheckedBounds: (lower: leftIdx, upper: deleteSpaceS.index(after: rightIdx))), with: getResultOf(noPathesis: subStr))
            
        }
        return Int(getResultOf(noPathesis:deleteSpaceS)) ?? 0
    }
    
    private func getResultOf(noPathesis s: String) -> String {
        guard !s.isEmpty else {
            return ""
        }
        var nums = [Int]()
        var operators = [Character]()
        var str = ""
        
        for ch in s {
            if operatorsSet.contains(ch) {
                if str.isEmpty {
                    str.append(ch)
                } else {
//                    if let num = Int(str) {
//                        nums.append(num)
//                    } else {
//                        print("string to Int error, str = \(str)")
//                    }
                    nums.append(Int(str)!)
                    str = ""
                    operators.append(ch)
                }
            } else {
                str.append(ch)
            }
        }
        nums.append(Int(str)!)
//        if let num = Int(str) {
//            nums.append(num)
//        } else {
//            print("string to Int error, str = \(str)")
//        }
        while let idx = operators.firstIndex(where: { "*/".contains($0)}) {
            nums[idx] = operators[idx] == "*" ? (nums[idx] * nums[idx + 1]) : (nums[idx] / nums[idx + 1])
            nums.remove(at: idx + 1)
            operators.remove(at: idx)
        }
        while !operators.isEmpty {
            let operation = operators.removeFirst()
            if operation == "+" {
                nums[0] += nums[1]
            } else {
                nums[0] -= nums[1]
            }
            nums.remove(at: 1)
        }
        return "\(nums[0])"
    }
}


