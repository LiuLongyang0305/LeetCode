// https://leetcode.com/problems/number-of-different-integers-in-a-string/
class Solution {
    func numDifferentIntegers(_ word: String) -> Int {
        var numbers = Set<String>()
        var number = ""
        
        func update() {
            guard !number.isEmpty else {
                return
            }
            while let f = number.first, f == "0" {
                number.removeFirst()
            }
            if number.isEmpty {
                number = "0"
            }
            if !numbers.contains(number) {
                numbers.insert(number)
            }
            number = ""
        }
        
        for ch in word {
            if ch.isLetter  {
                update()
            } else if ch.isNumber  {
                number.append(ch)
            }
        }
        update()
        return numbers.count
    }
}

