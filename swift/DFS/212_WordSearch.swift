//   https://leetcode.com/problems/word-search-ii/
class Solution {
    private struct Node: Hashable {
        var row: Int
        var col: Int
        var ch: Character
    }
    private typealias Direction = (dx:Int,dy:Int)
    private let directions: [Direction] = [(0,1),(0,-1),(-1,0),(1,0)]
    
    private var tree = [Node: [Node]]()
    private var mapCharacterToNodes = [Character:[Node]]()
    private var board: [[Character]] = []
    private var visited = Set<Node>()
    
    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        guard !board.isEmpty && !board[0].isEmpty else {
            return []
        }
        
        self.board = board
        buildTree()
        
        var ans = [String]()
        for word in words {
            //优化的地方在于：如果单词的前缀有一半都是同一个字母，那么久翻转单词检索
            let half = String(repeating: word.first!, count: word.count >> 1)
            if search(word.hasPrefix(half) ? String(word.reversed()) : word ) {
                ans.append(word)
            }
        }
        return ans
    }
    
    // 根据board创建树：四叉树
    private  func buildTree() {
        
        let M = board.count
        let N = board[0].count
        tree = [:]
        mapCharacterToNodes = [:]

        var nodes = Array<Array<Node>>(repeating: Array<Solution.Node>(repeating: Solution.Node(row: -1, col: -1, ch: " "), count: N), count: M)
        for i in 0..<M {
            for j in 0..<N {
                nodes[i][j] = Node(row: i, col: j, ch: board[i][j])
                if mapCharacterToNodes[board[i][j]] == nil {
                    mapCharacterToNodes[board[i][j]] = []
                }
                mapCharacterToNodes[board[i][j]]?.append(nodes[i][j])
            }
        }
        
        for i in 0..<M {
            for j in 0..<N {
                tree[nodes[i][j]] = []
                for dir in directions {
                    let nextX = i + dir.dx
                    let nextY = j + dir.dy
                    if nextX >= 0 && nextX < M && nextY >= 0 && nextY < N {
                        tree[nodes[i][j]]?.append(nodes[nextX][nextY])
                    }
                }
            }
        }
    }
    
    //DFS在树中查找单词
    private func search(_ word: String) -> Bool {
        guard let startNodes = mapCharacterToNodes[word.first!] else {
            return false
        }
        let chars = [Character](word)
        let wordLength = word.count
        
        func innerSearch(_ node: Node,_ index: Int) -> Bool {
            
            guard  index != wordLength - 1 else {
                return true
            }
            guard let nextPossibleNodes = tree[node] else {
                return false
            }
            
            for next in nextPossibleNodes where next.ch == chars[index + 1] && !visited.contains(next){
                visited.insert(next)
                if innerSearch(next, index + 1) {
                    return true
                }
                visited.remove(next)
            }
            return false
        }
        
        
        for node in startNodes {
            visited = []
            visited.insert(node)
            if innerSearch(node, 0) {
                return true
            }
        }
        return false
    }
 }