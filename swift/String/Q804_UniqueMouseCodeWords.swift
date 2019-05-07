class Q804_Solution {
    var transformeResults : Set<String> = Set<String>()
    let charToMorse = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        for word in words {
            var result = ""
            let chars = word.utf8.map { (val) -> Int in
                return Int(val) - 97
            }
            for char in chars {
                result += charToMorse[char]
            }
            if !transformeResults.contains(result) {
                transformeResults.insert(result)
            }
        }
        return transformeResults.count
    }
}