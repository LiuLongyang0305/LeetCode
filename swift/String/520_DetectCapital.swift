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