//https://leetcode.com/problems/masking-personal-information/
class Solution {
    
    func maskPII(_ S: String) -> String {
        if S.contains("@") {
            return maskEmailAddress(emeil: S)
        }
        return maskPhoneNumbers(phoneNumber: S)
    }
    
    private func maskEmailAddress(emeil: String) -> String {
        
//        let seperator = CharacterSet(charactersIn: "@.")
//        let parts = emeil.lowercased().components(separatedBy: seperator)
//        return  "\(parts[0].first!)*****\(parts[0].last!)@\(parts[1]).\(parts[2])"
        
        let stars  = "*****"
        var ans = emeil.lowercased()
        let index = ans.firstIndex(of: "@")!
        let to = ans.index(before: index)
        let from = ans.index(after: ans.startIndex)
        if to == from {
            ans.insert(contentsOf: stars, at: from)
        } else {
            ans.replaceSubrange(Range<String.Index>(uncheckedBounds: (lower: from, upper: to)), with: stars)
        }
        return ans
    }
    
    private func maskPhoneNumbers(phoneNumber: String) -> String {
        let numbers  = phoneNumber.filter { (ch) -> Bool in
            ch.isNumber
        }
        var chars = Array<Character>(numbers)
        for i in 0..<(chars.count - 4) {
            chars[i] = "*"
        }
        var internationalNumber = ""
        while chars.count > 10 {
            internationalNumber.append(chars.removeFirst())
        }
        if chars.count == 10 {
            chars.insert("-", at: 3)
            chars.insert("-", at: 7)
        }
        return (internationalNumber.isEmpty ? ("") : ("+\(internationalNumber)-")) + String(chars)
    }
}

Solution().maskPII("1(234)567-890")
