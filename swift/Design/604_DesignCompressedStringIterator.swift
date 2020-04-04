// https://leetcode.com/problems/design-compressed-string-iterator/
class StringIterator {
    private typealias Node = (ch: Character,count: Int)
    private var letters = [Node]()
    init(_ compressedString: String) {
        var char: Character = " "
        var count = ""
        for ch in compressedString {
            if ch.isLetter {
                if !count.isEmpty {
                    letters.append((char,Int(count)!))
                }
                char = ch
                count = ""
            } else if ch.isNumber {
                count.append(ch)
            }
        }
        letters.append((char,Int(count)!))
    }
    
    func next() -> Character {
        guard !letters.isEmpty else {
            return " "
        }
        if letters[0].count == 1 {
            let ans = letters[0].ch
            letters.removeFirst()
            return ans
        }
        letters[0].count -= 1
        return letters[0].ch
    }
    
    func hasNext() -> Bool {
        
        return !letters.isEmpty
    }
}


/**
 * Your StringIterator object will be instantiated and called as such:
 * let obj = StringIterator(compressedString)
 * let ret_1: Character = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */