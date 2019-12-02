// https://leetcode.com/problems/bulls-and-cows/
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
 class Solution {
     func getHint(_ secret: String, _ guess: String) -> String {
        let secretChars = [Character](secret)
        let guessChars = [Character](guess)
        var secretCharsCounter = secret.counter
        var guessCharsCounter = guess.counter
        var aCount = 0
        var bCount = 0
        for i in 0..<secretChars.count {
            if guessChars[i] == secretChars[i] {
                aCount += 1
                if let c = secretCharsCounter[guessChars[i]] {
                    secretCharsCounter.updateValue(c - 1, forKey: guessChars[i])
                }
                if let c = guessCharsCounter[guessChars[i]] {
                    guessCharsCounter.updateValue(c - 1, forKey: guessChars[i])
                }
            }
        }
        for (ch,remainCount) in guessCharsCounter {
            if let c = secretCharsCounter[ch] {
                let val = min(c, remainCount)
                bCount +=  val
                secretCharsCounter.updateValue(c - val, forKey: ch)
            }
        }
        return "\(aCount)A\(bCount)B"
     }
 }