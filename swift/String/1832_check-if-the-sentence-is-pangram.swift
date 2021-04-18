// https://leetcode.com/problems/check-if-the-sentence-is-pangram/
class Solution {
    func checkIfPangram(_ sentence: String) -> Bool {
        return Set<Character>(sentence).count == 26
    }
}