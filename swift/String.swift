class Q13_Solution {
    let charToInt: Dictionary<Character, Int> = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
    let stringToInt : Dictionary<String,Int> = ["IV":4,"Ix":9,"XL":40,"XC":90,"CD":500,"CM":900]
    let set : Set<Character> = ["I","X","C"]
    func romanToInt(_ s: String) -> Int {
        var result : Int = 0
        var index = s.startIndex
        while index < s.endIndex {
            if set.contains(s[index]) && s.index(after: index) < s.endIndex{
                let tempIndex = s.index(after: index)
                var str = String(s[index])
                str.append(s[tempIndex])
                if let val =  stringToInt[str] {
                    result += val
                    index = s.index(after: tempIndex)
                } else {
                    result += charToInt[s[index]]!
                    index = tempIndex
                }
            } else {
                result += charToInt[s[index]]!
                index = s.index(after: index)
            }
        }
        return result
    }
}
class Q14_Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        if strs.count < 2 {
            return strs.count == 0 ? "" : strs[0]
        }
        var result : String = commonPrefixOfTwoString(s1: strs[0], s2: strs[1])
        if result != "" {
            for i in 2..<strs.count {
                result = commonPrefixOfTwoString(s1: result, s2: strs[i])
                if result == "" {
                    break
                }
            }
        }
        return result
    }
    private func commonPrefixOfTwoString(s1: String,s2: String) -> String {
        if s1.count == 0 || s2.count == 0 {
            return ""
        }
        var result = ""
        var index1 = s1.startIndex
        var index2 = s2.startIndex
        while index1 < s1.endIndex && index2 < s2.endIndex  && s1[index1] == s2[index2]{
            result.append(s1[index1])
            index2 = s2.index(after: index2)
            index1 = s1.index(after: index1)
        }
        return result
    }
}

class Q20_Solution {
    let parenthesesPairs : Dictionary<Character,Character> = ["}":"{",")":"(","]":"["]
    func isValid(_ s: String) -> Bool {
        var parentheses : Array<Character> = Array<Character>()
        for char in s {
            if char == "{" || char == "["  || char == "(" {
                parentheses.append(char)
            } else {
                if parentheses.isEmpty{
                    return false
                }
                let last = parentheses.removeLast()
                if last != parenthesesPairs[char]{
                    return false
                }
            }
        }
        return parentheses.isEmpty
    }
}
class Q28_Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        if needle.count == 0 {
            return 0
        }
        if haystack.count < needle.count {
            return -1
        }
        let haystackLength = haystack.count
        let needleLength = needle.count
        
        let haystackChars = Array<Character>(haystack)
        let needleChars = Array<Character>(needle)
        
        var i = 0
        var j = 0
        var next = getNext(pattern: needleChars)
        while i < haystackLength && j < needleLength {
            if haystackChars[i] == needleChars[j] {
                j += 1
                i += 1
            } else {
                j = next[j]
            }
        }
        if j >= needleLength {
            return i - needleLength
        }
        return -1
    }
    
    func getNext(pattern: [Character]) -> [Int] {
        let length = pattern.count
        var next = Array<Int>(repeating: -1, count: length)
        var j = 0;
        var k = -1;
        while j < length - 1 {
            if -1 ==  k || pattern[j] == pattern[k] {
                k += 1
                j += 1
                next[j] = k
            } else {
                k = next[k]
            }
        }
        return next
    }
}
class Q58_Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var temp = s
        while !temp.isEmpty && temp.first! == " " {
            temp.removeFirst()
        }
        while !temp.isEmpty && temp.last! == " "  {
            temp.removeLast()
        }
        if temp.isEmpty {
            return 0
        }
        if let index = temp.lastIndex(of: " ") {
            return temp.distance(from: index, to: temp.endIndex)
        }
        return temp.count
    }
}

class Q67_Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        if a.isEmpty || b.isEmpty {
            return a + b
        }
        let charToIntDic : Dictionary<Character,Int> = ["1" : 1, "0": 0]
        let intToCharDic: Dictionary<Int,Character> = [1 : "1", 0 : "0"]
        var result = ""
        var str1Chars = Array<Character>(a)
        var str2Chars = Array<Character>(b)
        var x : Int = 0
        var y : Int = 0
        var carry : Int = 0
        while !str1Chars.isEmpty || !str2Chars.isEmpty {
            x = str1Chars.isEmpty ? 0 : charToIntDic[str1Chars.removeLast()]!
            y = str2Chars.isEmpty ? 0 : charToIntDic[str2Chars.removeLast()]!
            let temp = x + y + carry
            result.insert((intToCharDic[temp % 2]!), at: result.startIndex)
            carry =  temp / 2
        }
        if carry == 1 {
            result.insert("1", at: result.startIndex)
        } else if carry == 2{
            result.insert("0", at: result.startIndex)
            result.insert("1", at: result.startIndex)
        }
        return result
    }
}
class Q125_Solution {
    func isPalindrome(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        var arr = Array<UInt8>()
        for item in s.utf8 {
            if item >= 97 && item <= 122 {
                arr.append(item)
            }
            if item >= 65 && item <= 90 {
                arr.append(item + 32)
            }
            if item >= 48 && item <= 57 {
                arr.append(item)
            }
        }
        
        var i = 0
        var j = arr.count - 1
        while i < j {
            if arr[i] == arr[j] {
                j -= 1
                i += 1
            } else {
                return false
            }
        }
        return true
    }
}
class Q344_Solution {
    func reverseString(_ s: inout [Character]) {
        var i = 0
        var j = s.count - 1
        while i < j {
            (s[i],s[j]) = (s[j],s[i])
            i += 1
            j -= 1
        }
    }
}
class Q345_Solution {
    var vowels : Set<Character> = ["a","e","i","o","u","A","E","O","I","U"]
    func reverseVowels(_ s: String) -> String {
        if s.count <= 1 {
            return s
        }
        var str = Array<Character>(s)
        var i = 0
        let length = str.count
        var j = length - 1
        while i < j {
            while i < length && !vowels.contains(str[i]) {
                i += 1
            }
            if i == length {
                return String(str)
            }
            while j > i && !vowels.contains(str[j]){
                j -= 1
            }
            if j != i {
                str.swapAt(i, j)
            }
        }
        return String(str)
    }
}

class Q383_Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var ransomNoteCounts : Dictionary<Character,Int> = Dictionary<Character,Int>()
        for char in ransomNote {
            if nil == ransomNoteCounts[char] {
                ransomNoteCounts[char] = 1
            } else {
                ransomNoteCounts[char]  = ransomNoteCounts[char]! + 1
            }
        }
        for char in magazine {
            if nil != ransomNoteCounts[char] {
                ransomNoteCounts[char] =  ransomNoteCounts[char]! - 1
                if 0 == ransomNoteCounts[char]! {
                    ransomNoteCounts.removeValue(forKey: char)
                }
                if ransomNoteCounts.isEmpty {
                    return true
                }
            }
        }
        return ransomNoteCounts.isEmpty
    }
}

class Q415_Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        if num1.isEmpty || num2.isEmpty {
            return num2 + num1
        }
        let charToInt : Dictionary<Character,Int> = ["0":0,"1":1,"2":2,"3":3,"4":4,"5":5,"6":6,"7":7,"8":8,"9":9]
        let intToChar : Array<Character> = ["0","1","2","3","4","5","6","7","8","9"]
        var index1 = num1.index(before: num1.endIndex)
        var index2 = num2.index(before: num2.endIndex)
        let startIndex1 = num1.startIndex
        let startIndex2 = num2.startIndex
        var carry : Int = 0
        var flagNum2End = false
        var flagNum1End = false
        var result = ""
        while !flagNum1End || !flagNum2End {
            let x = flagNum2End ? 0 : charToInt[num2[index2]]!
            let y = flagNum1End ? 0 : charToInt[num1[index1]]!
            if !flagNum2End{
                if index2 == startIndex2 {
                    flagNum2End = true
                } else {
                    index2 = num2.index(before: index2)
                }
            }
            if !flagNum1End{
                if index1 == startIndex1 {
                    flagNum1End = true
                } else {
                    index1 = num1.index(before: index1)
                }
            }
            let temp = x + y + carry
            result.insert(intToChar[temp % 10], at: result.startIndex)
            carry = temp / 10
        }
        if carry != 0 {
            result.insert(intToChar[carry], at: result.startIndex)
        }
        return result
    }
}
class Q434_Solution {
    func countSegments(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        var count = 0
        var index  = s.startIndex
        while index < s.endIndex  && s[index] == " " {
            index = s.index(after: index)
        }
        if index == s.endIndex {
            return 0
        }
        var index2 = s.index(before: s.endIndex)
        while index2 >= index && s[index2] == " " {
            index2 =  s.index(before: index2)
        }
        
        while index <= index2 {
            if s[index] == " " && s[s.index(before: index)] != " "{
                count += 1
            }
            index = s.index(after: index)
        }
        return count + 1
    }
}

class Q443_Solution {
    let intToChar : Array<Character> = ["0","1","2","3","4","5","6","7","8","9"]
    func compress(_ chars: inout [Character]) -> Int {
        if chars.count < 2 {
            return chars.count
        }
        var result = ""
        result.append(chars[0])
        var count = 1
        for i in 1..<chars.count {
            if chars[i] == chars[ i - 1]{
                count += 1
            } else {
                if count != 1 {
                    result += getCountStr(count)
                }
                count = 1
                result.append(chars[i])
            }
        }
        if count > 1 {
            result += getCountStr(count)
        }
        chars = Array<Character>(result)
        return chars.count
    }
    private func getCountStr(_ num : Int) -> String {
        var count = num
        var str = ""
        if count < 10 {
            str.append(intToChar[count])
        } else {
            while count > 0 {
                if str.isEmpty {
                    str.append(intToChar[count % 10])
                } else {
                    str.insert(intToChar[count % 10], at: str.startIndex)
                }
                count /= 10
            }
        }
        return str
    }
}

class Q520_Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        typealias LetterCount = (captal:Int,lower:Int)
        var count : LetterCount = (0,0)
        var index = 0
        var isTheFirstCharCaptical = false
        for item in word.utf8 {
            if item >= 65 && item <= 90 {
                count.captal += 1
                if index == 0 {
                    isTheFirstCharCaptical = true
                }
            }
            if item >= 97 && item <= 122 {
                count.lower += 1
            }
            index += 1
        }
        word.first!
        return count.captal == 0 || (count.captal == 1 && isTheFirstCharCaptical) || count.lower == 0
    }
}
class Q521_Solution {
    func findLUSlength(_ a: String, _ b: String) -> Int {
        if a == b {
            return -1
        }
        return max(a.count, b.count)
    }
}

class Q541_Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        if k < 1 {
            return s
        }
        var str = Array<Character>(s)
        let length = s.count
        if k > s.count {
            reverseElementsBetween(arr: &str, startIndex: 0, endIndex: length - 1)
        } else {
            let times = length / k
            for i in 0..<times {
                if i % 2 == 0 {
                    reverseElementsBetween(arr: &str, startIndex: k * i, endIndex: k * (i + 1) - 1)
                }
            }
            if times % 2 == 0{
                reverseElementsBetween(arr: &str, startIndex: k * times, endIndex: length - 1 )
            }
        }
        return String(str)
    }
    private func reverseElementsBetween(arr : inout Array<Character>, startIndex: Int, endIndex: Int ) {
        var j = startIndex
        var k = endIndex
        while j < k {
            arr.swapAt(j, k)
            j += 1
            k -= 1
        }
    }
}

class Q551_Solution {
    func checkRecord(_ s: String) -> Bool {
        let first = s.firstIndex(of: "A")
        let last = s.lastIndex(of: "A")
        guard nil == first || last == first else {
            return false
        }
        var index = s.firstIndex(of: "L")
        guard nil != index else {
            return true
        }
        let endIndex = s.lastIndex(of: "L")
        guard index != endIndex else {
            return true
        }
        
        while index! < endIndex! {
            if s[index!] == "L" {
                let next = s.index(after: index!)
                if next != s.endIndex{
                    if s[next] == "L" {
                        let temp = s.index(after: next)
                        if temp != s.endIndex {
                            if s[temp] == "L" {
                                return false
                            }
                        }
                    }
                }
            }
            index = s.index(after: index!)
        }
        return true
    }
}
class Q557_Solution {
    func reverseWords(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
        var result = ""
        let subStrs = s.split(separator: " ")
        for substr in subStrs {
            let reverseWord = reverseSubString(sourceStr: substr)
            result += reverseWord
        }
        result.removeLast()
        return result
    }
    private func reverseSubString(sourceStr: Substring) -> String{
        var arr = Array<Character>(sourceStr)
        var j = 0
        var k = sourceStr.count - 1
        while j < k {
            arr.swapAt(j, k)
            j += 1
            k -= 1
        }
        arr.append(" ")
        return String(arr)
    }
}
class Q657_Solution {
    func judgeCircle(_ moves: String) -> Bool {
        typealias StepCount = (Up:Int,Right:Int)
        var stepCounter : StepCount = (0,0)
        for step in moves {
            switch step {
            case "U":
                stepCounter.Up += 1
            case "R":
                stepCounter.Right += 1
            case "L":
                stepCounter.Right -= 1
            case "D":
                stepCounter.Up -= 1
            default:
                break
            }
        }
        return stepCounter.Right == 0 && stepCounter.Up == 0
    }
}
class Q680_Solution {
    func validPalindrome(_ s: String) -> Bool {
        let chars = Array<Character>(s)
        var i = 0
        var j = chars.count - 1
        while i < j {
            if chars[i] != chars[j] {
                return isPalindromeRange(arr: chars, start: i + 1, end: j) || isPalindromeRange(arr: chars, start: i, end: j - 1)
            }
            i += 1
            j -= 1
        }
        return true
    }
    private func isPalindromeRange(arr : [Character], start : Int, end : Int) -> Bool {
        var i = start
        var j = end
        while i < j {
            if arr[i] != arr[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}
