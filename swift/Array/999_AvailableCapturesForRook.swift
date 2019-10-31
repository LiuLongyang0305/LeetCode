//https://leetcode.com/problems/available-captures-for-rook/submissions/
class Solution {
    func numRookCaptures(_ board: [[Character]]) -> Int {
        var rootX = -1
        var rootY = -1
        var found = false
        for i in 0...7 {
            for j in 0...7 {
                if board[i][j] == "R" {
                    rootX = i
                    rootY = j
                    found = true
                    break
                }
            }
            if found {
                break
            }
        }
        
        var ans = 0
        //up
        var i = rootY -  1
        while i >= 0 {
            if board[rootX][i] == "B" {
                break
            }
            if board[rootX][i] == "p" {
                ans += 1
                break
            }
            i -= 1
        }
        //down
        i = rootY + 1
        while i < 8 {
            if board[rootX][i] == "B" {
                break
            }
            if board[rootX][i] == "p" {
                ans += 1
                break
            }
            i += 1
        }
        //left
        i = rootX - 1
        while i  >= 0 {
            if board[i][rootY] == "B" {
                break
            }
            if board[i][rootY] == "p" {
                ans += 1
                break
            }
            i -= 1
        }
        //right
        i = rootX + 1
        while i < 8 {
            if board[i][rootY] == "B" {
                break
            }
            if board[i][rootY] == "p" {
                ans += 1
                break
            }
            i += 1
        }
        return ans
    }
}