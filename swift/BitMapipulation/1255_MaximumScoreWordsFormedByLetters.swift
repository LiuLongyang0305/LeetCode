//https://leetcode.com/problems/maximum-score-words-formed-by-letters/
 extension Sequence where Element == Character  {
    var counter: [Character:Int] {
        var ans = [Character:Int]()
        for ch in self {
            if let c = ans[ch] {
                ans.updateValue(c + 1, forKey: ch)
            }  else {
                ans.updateValue(1, forKey: ch)
            }
        }
        return ans
    }
 }
 
 typealias Counter = Dictionary<Character,Int>
 extension Counter {
    func canFormed(another counter: Counter) -> Bool {
        for (ch,c) in counter {
            guard let num = self[ch], num >= c else {
                return false
            }
        }
        return  true
    }
    mutating func add(another  counter: Counter) {
        for (ch,val) in counter {
            if let c = self[ch] {
                self.updateValue(c + val, forKey: ch)
            } else {
                self.updateValue(val, forKey: ch)
            }
        }
    }
 }
 
 extension Int {
    var binaryDigitArr: [Bool] {
        var temp = self
        var ans = [Bool]()
        while temp > 0 {
            ans.append(temp & 1 == 1)
            temp >>= 1
        }
        return ans
    }
 }
 
 class Solution {
    private static let permunation = (0...16384).map{$0.binaryDigitArr}
    private let aAsciiValue  =  Character("a").asciiValue!
    func maxScoreWords(_ words: [String], _ letters: [Character], _ score: [Int]) -> Int {
        
        let lettersCounter = letters.counter
        var letterScore = [Character:Int]()
        let wordsCounter = words.map {$0.counter}.filter { lettersCounter.canFormed(another: $0)}
        for letter in letters {
            let index = Int(letter.asciiValue! - aAsciiValue)
            if nil == letterScore[letter] {
                letterScore[letter] = score[index]
            }
        }
        
        func calculateScore(_ counter: Counter) ->  Int {
            var ans = 0
            for (ch,val) in counter {
                if  let s = letterScore[ch] {
                    ans += s * val
                }
            }
            return ans
        }
        var ans = 0
        for i in 1..<Int(pow(2.0, Double(wordsCounter.count))) {
            var tempCounter = [Character:Int]()
            let arr = Solution.permunation[i]
            for j in 0..<arr.count {
                if arr[j] {
                    tempCounter.add(another: wordsCounter[j])
                }
            }
            if lettersCounter.canFormed(another: tempCounter){
                ans = max(ans, calculateScore(tempCounter))
            }
        }
        return ans
    }
 }