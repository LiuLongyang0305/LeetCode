//https://leetcode.com/problems/contain-virus/
class Solution {
    private struct InfectedZone {
        var infected: Set<Int>
        var willBeInfected: Set<Int>
        var needWalls: Int
    }
    
    private let dx = [0,0,1,-1]
    private let dy = [1,-1,0,0]
    
    func containVirus(_ grid: [[Int]]) -> Int {
        
        
        let M = grid.count
        let N = grid[0].count
        
        var gridCopy = grid
        var totalWalls = 0
        
        var infected = Set<Int>()
        var blocked = Set<Int>()
        
        func valid(_ x: Int, _ y: Int) -> Bool {
            return x < M && x >= 0 && y >= 0 && y < N
        }
        
        var varius = [Int:InfectedZone]() //key: infected source value: varius
        func dfs(currentPosition: Int, source: Int) {
            for index in 0..<4 {
                let nextX = currentPosition >> 8 + dx[index]
                let nextY = currentPosition & 0xff + dy[index]
                if valid(nextX, nextY) {
                    let p = nextX << 8 | nextY
                    if gridCopy[nextX][nextY] == 0 {
                        varius[source]?.willBeInfected.insert(p)
                        varius[source]?.needWalls += 1
                    }
                    if gridCopy[nextX][nextY] == 1 && !infected.contains(p) && !blocked.contains(p){
                        infected.insert(p)
                        varius[source]?.infected.insert(p)
                        dfs(currentPosition: p, source: source)
                    }
                }
            }
        }
        
        while true {
            
            varius = [:]
            infected = []
            var infectedCount = 0

            for r in 0..<M {
                for c in 0..<N {
                    if gridCopy[r][c] == 1 {
                        infectedCount += 1
                        let source = r << 8 | c
                        if !infected.contains(source) && !blocked.contains(source) {
                            infected.insert(source)
                            varius[source] = InfectedZone(infected: [source], willBeInfected: [], needWalls: 0)
                            dfs(currentPosition: source, source: source)
                        }
                    }
                }
            }
            
            if varius.isEmpty || infectedCount == M * N{
                break
            }
            if varius.count == 1 {
                totalWalls += (varius.first?.value.needWalls ?? 0)
                break
            }
            let sortedVarius = varius.sorted { (varius1, varius2) -> Bool in
                varius1.value.willBeInfected.count > varius2.value.willBeInfected.count
            }
            totalWalls += sortedVarius[0].value.needWalls
            blocked = blocked.union(sortedVarius[0].value.infected)
            for index in 1..<sortedVarius.count {
                for nxt in sortedVarius[index].value.willBeInfected {
                    gridCopy[nxt >> 8][nxt & 0xff] = 1
                }
            }
        }

        return totalWalls
    }
 }