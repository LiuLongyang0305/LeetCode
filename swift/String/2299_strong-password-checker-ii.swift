// https://leetcode.com/problems/strong-password-checker-ii/
class Solution {

    let specialSymbols = Set<Character>("!@#$%^&*()-+")
    func strongPasswordCheckerII(_ password: String) -> Bool {
        return password.count >= 8 &&  containsUpperCase(password) && containsDidit(password) && containsLowwerCase(password) && containsTwoSameLinkedChars(password) && containsSymbol(password)
    }

    private func  containsUpperCase(_ p: String) -> Bool {
        for ch in p {
            if ch.isUppercase {
                return true
            }
        }
        return false
    }
    private func  containsLowwerCase(_ p: String) -> Bool {
        for ch in p {
            if ch.isLowercase {
                return true
            }
        }
        return false
    }
    private func  containsDidit(_ p: String) -> Bool {
        for ch in p {
            if ch.isNumber {
                return true
            }
        }
        return false
    }

    private func containsSymbol(_ p: String) -> Bool {

        for ch in p {
            if specialSymbols.contains(ch) {
                return true
            }
        }
        return false
    }

    private func containsTwoSameLinkedChars(_ p: String) -> Bool {


        var last: Character? = nil
        for ch in p {
            if let l = last {
                guard l != ch else {return false}
            }
            last = ch
        }
        return true
    }
}