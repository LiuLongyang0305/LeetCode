// https://leetcode.com/problems/minimum-number-of-frogs-croaking/
class Solution {
    private let chars = Set<Character>("croak")
    private let mapLast: [Character:Character] = ["r":"c","o":"r","a":"o","k":"a"]
    func minNumberOfFrogs(_ croakOfFrogs: String) -> Int {
        let N = croakOfFrogs.count
        guard N % 5 == 0 else {
            return -1
        }
        var ans = Int.min
        var frogs = [Character:Int]()
        var total = 0
        func update(_ ch: Character) -> Bool{
            if ch == "c" {
                
                frogs.updateValue((frogs[ch] ?? 0) + 1, forKey: ch)
                total += 1
                ans = max(ans, total)
                return true
            }
            guard let c = frogs[mapLast[ch]!], c > 0 else {
                return false
            }
            frogs[mapLast[ch]!] = c - 1

            if ch != "k" {
                frogs.updateValue((frogs[ch] ?? 0) + 1, forKey: ch)
            } else {
                total -= 1
            }
            return true
        }
        for ch in croakOfFrogs {
            guard chars.contains(ch) else {
                return -1
            }
            if !update(ch) {
                return -1
            }
        }
        return ans
    }
}


