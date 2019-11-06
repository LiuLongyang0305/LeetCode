//https://leetcode.com/problems/minimum-moves-to-reach-target-with-rotations/submissions/
class Solution {
    
    struct Position: Hashable {
        var x : Int
        var y : Int
        init(_ x: Int, _ y: Int) {
            self.x = x
            self.y = y
        }
    }
    enum Posture {
        case horizontal
        case vertical
    }
    struct Snake: Hashable {
        var head: Position
        var tail: Position
    }
    
    typealias SnakeState = (snake: Snake, posture: Posture)
    private var grid = [[Int]]()
    private var length = -1
    func minimumMoves(_ grid: [[Int]]) -> Int {
        self.grid = grid
        self.length  = grid.count
        let endState: SnakeState = (Snake(head: Position(length - 1,length - 1), tail: Position(length - 1,length - 2)),.horizontal)
        var potentialStates = [SnakeState]()
        potentialStates.append((Snake(head: Position(0,1), tail: Position(0,0)),.horizontal))
        var visited = Set<Snake>()
        visited.insert(Snake(head: Position(0,1), tail: Position(0,0)))
        var  depth = 0
        while !potentialStates.isEmpty {
            depth += 1
            let length = potentialStates.count
            for _ in 0..<length {
                let s =  potentialStates.removeFirst()
                let nextLevelStates = createNextLevelSnakeStates(current: s)
                for nextLevelState in nextLevelStates {
                    if nextLevelState == endState {
                        return depth
                    }
                    if !visited.contains(nextLevelState.snake) {
                        visited.insert(nextLevelState.snake)
                        potentialStates.append(nextLevelState)
                    }
                }
            }
        }
        return -1
    }
    private func createNextLevelSnakeStates(current state: SnakeState) -> [SnakeState] {
        var ans = [SnakeState]()
        let head = state.snake.head
        let tail = state.snake.tail
        //right
        if state.posture == .horizontal && head.y < length - 1 && grid[head.x][head.y + 1] == 0 {
            var temp = state
            temp.snake.head.y += 1
            temp.snake.tail.y += 1
            ans.append(temp)
        }
        //down
        if state.posture == .vertical &&  head.x < length - 1 && grid[head.x + 1][head.y] == 0 {
            var temp = state
            temp.snake.head.x += 1
            temp.snake.tail.x += 1
            ans.append(temp)
        }
        if state.posture == .horizontal && head.x < length - 1 && grid[head.x + 1][head.y] == 0 &&  grid[tail.x + 1][tail.y] == 0 {
            //clockwise
            var temp = state
            temp.snake.head.x += 1
            temp.snake.head.y -= 1
            temp.posture = .vertical
            ans.append(temp)
            //down
            temp = state
            temp.snake.head.x += 1
            temp.snake.tail.x += 1
            ans.append(temp)
        }
        if state.posture == .vertical && head.y < length - 1 && grid[head.x][head.y  + 1] == 0 &&  grid[tail.x][tail.y + 1] == 0 {
            //counterclockwise
            var temp = state
            temp.snake.head.x -= 1
            temp.snake.head.y += 1
            temp.posture = .horizontal
            ans.append(temp)
            //right
            temp = state
            temp.snake.head.y += 1
            temp.snake.tail.y += 1
            ans.append(temp)
        }
        return ans
    }
}