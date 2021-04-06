// https://leetcode.com/problems/determine-color-of-a-chessboard-square/
class Solution {
    func squareIsWhite(_ coordinates: String) -> Bool {
        return Int(coordinates.first!.asciiValue! - 97 + coordinates.last!.asciiValue! - 48) & 1 == 0
    }
}