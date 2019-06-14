//https://leetcode.com/problems/evaluate-division/
class Solution {
    
    struct FindResult {
        var root: String?
        var path: [String]
    }
    
    struct ConnectedResult {
        var isConnected: Bool
        var devidentPath: [String]
        var divisorPath: [String]
    }
    
    
    class UnionFind {
        
        var parents =  Dictionary<String,String>()
        
        public func union(devidend: String, divisor: String) {
            parents[divisor] = devidend
        }
        
        public func find(node : String) -> FindResult {
            if nil == parents[node] {
                return FindResult(root: nil, path: [String]())
            }
            var path = [String]()
            var currentRoot: String = node
            while currentRoot != parents[currentRoot] {
                path.insert(currentRoot, at: 0)
                currentRoot = parents[currentRoot]!
            }
            path.insert(currentRoot, at: 0)
            return FindResult(root: currentRoot, path: path)
        }
        
        public func connected(devident: String, divisor: String) -> ConnectedResult {
            let devidentRootAndPath = find(node: devident)
            let divisorRootAndPath = find(node: divisor)
            return ConnectedResult(isConnected: divisorRootAndPath.root == devidentRootAndPath.root && divisorRootAndPath.root != nil, devidentPath: devidentRootAndPath.path, divisorPath: divisorRootAndPath.path)
        }
        
        func getQueryValue(devident: String, divisor: String, expressionAndValue: inout Dictionary<String,Double>) -> Double {
            var rel = 1.0
            if devident == divisor {
                rel = expressionAndValue[devident + devident] == nil ? -1.0 : 1.0
            } else {
                if expressionAndValue[devident + divisor] != nil || expressionAndValue[divisor + devident] != nil {
                    rel = expressionAndValue[devident + divisor] != nil ? expressionAndValue[devident + divisor]! : 1.0 / expressionAndValue[divisor + devident]!
                } else {
                    let connectedResult = connected(devident: devident, divisor: divisor)
                    if !connectedResult.isConnected {
                        rel = -1.0
                    } else {
                        var devidentPath = connectedResult.devidentPath
                        var divisorPath = connectedResult.divisorPath
                        var commonRootIndex = 0
                        
                        let minCount = min(devidentPath.count, divisorPath.count)
                        for commonRootIndex in 0..<minCount {
                            if devidentPath[commonRootIndex] != divisorPath[commonRootIndex] {
                                break
                            }
                        }
                        
                        if minCount == commonRootIndex {
                            commonRootIndex = minCount - 1
                        }
                        
                        if commonRootIndex != 0 {
                            for _ in 0..<commonRootIndex {
                                devidentPath.removeFirst()
                                devidentPath.removeFirst()
                            }
                        }
                        
                        if 1 == devidentPath.count || 1 == divisorPath.count {
                            let path = 1 == devidentPath.count ? divisorPath : devidentPath
                            for i in 1..<path.count {
                                rel *= expressionAndValue[path[i - 1] + path[i]]!
                            }
                            if 1 == divisorPath.count {
                                rel = 1.0 / rel
                            }
                        } else {
                            
                            for j in 1..<devidentPath.count {
                                rel *= expressionAndValue[devidentPath[j - 1] + devidentPath[j]]!
                            }
                            rel = 1.0 / rel
                            for j in 1..<divisorPath.count {
                                rel *= expressionAndValue[divisorPath[j - 1] + divisorPath[j]]!
                            }
                        }
                        expressionAndValue[devident + divisor] = rel
                    }
                }
                
            }
            return rel
        }
    }
    
    
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        var result = [Double]()
        var expressionAndValue = Dictionary<String,Double>()
        
        let unionFind = UnionFind()
        let unionFindReversed = UnionFind()
        
        
        for i in 0..<equations.count {
            
            let devident = equations[i][0]
            let divisor = equations[i][1]
            
            if unionFind.parents[devident] == nil {
                unionFind.parents[devident] = devident
            }
            
            unionFind.union(devidend: devident, divisor: divisor)
            
            if unionFindReversed.parents[divisor] == nil {
                unionFindReversed.parents[divisor] = divisor
            }
            
            unionFindReversed.union(devidend: divisor, divisor: devident)
            
            expressionAndValue[devident + divisor] = values[i]
            expressionAndValue[divisor + devident] = 1.0 / values[i]
            
            expressionAndValue[devident + devident] = 1.0
            expressionAndValue[divisor + divisor] = 1.0
        }
        
        
        for query in queries {
            let devident = query[0]
            let divisor = query[1]
            var rel = unionFind.getQueryValue(devident: devident, divisor: divisor, expressionAndValue: &expressionAndValue)
            if rel.isEqual(to: -1.0) {
                rel = unionFindReversed.getQueryValue(devident: devident, divisor: divisor, expressionAndValue: &expressionAndValue)
            }
            result.append(rel)
        }
        return result
    }
}