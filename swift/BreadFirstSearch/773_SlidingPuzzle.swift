
//https://leetcode.com/problems/sliding-puzzle/
class Solution {
    func slidingPuzzle(_ board: [[Int]]) -> Int {
        let answer = [1,2,3,4,5,0]
        var firstGuess = [Int](board[0])
        firstGuess.append(contentsOf: board[1])
        guard firstGuess != answer else {
            return 0
        }
        var visited = Set<[Int]>()
        visited.insert(firstGuess)
        var depth = 0
        var potentialAnswers = [firstGuess]
        while !potentialAnswers.isEmpty {
            let count = potentialAnswers.count
            depth += 1
            for _ in 0..<count {
                let guess = potentialAnswers.removeFirst()
                let nextLevelGuesses = createNextLevelArrarys(guess)
                for nextLevelGuess in nextLevelGuesses {
                    if nextLevelGuess == answer {
                        return depth
                    }
                    if !visited.contains(nextLevelGuess) {
                        visited.insert(nextLevelGuess)
                        potentialAnswers.append(nextLevelGuess)
                    }
                }
            }
        }
        return -1
    }
    private func createNextLevelArrarys(_ arr: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        let zeroIndex = arr.firstIndex(of: 0)!
        //up or down
        var temp = arr
        temp.swapAt(zeroIndex, zeroIndex - 3 >= 0 ? zeroIndex - 3 : zeroIndex + 3)
        ans.append(temp)
        
        //left
        if zeroIndex != 0 && zeroIndex != 3 {
            temp = arr
            temp.swapAt(zeroIndex, zeroIndex - 1)
            ans.append(temp)
        }
        //right
        if zeroIndex != 2  && zeroIndex != 5 {
            temp = arr
            temp.swapAt(zeroIndex, zeroIndex + 1)
            ans.append(temp)
        }
        return ans
    }
}