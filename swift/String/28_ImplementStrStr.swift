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