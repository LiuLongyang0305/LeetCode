// https://leetcode.com/problems/grid-illumination/
class Solution {
    func gridIllumination(_ n: Int, _ lamps: [[Int]], _ queries: [[Int]]) -> [Int] {
        
        var rows = [Int: Int]()
        var cols = [Int: Int]()
        var pies = [Int:Int]()
        var nas = [Int:Int]()
        var lampsSet = Set<Int>()
        
        for lamp in lamps {
            let key = (lamp[0] << 30) | lamp[1]
            guard !lampsSet.contains(key) else {
                continue
            }
            rows[lamp[0],default: 0] += 1
            cols[lamp[1], default: 0 ] += 1
            pies[lamp[1] - lamp[0],default:0 ] += 1
            nas[lamp[1] + lamp[0],default: 0] += 1
            lampsSet.insert(key)
        }
        
        
        var ans = [Int]()
        
        for query in queries {
            let (x,y) = (query[0],query[1])
            
            if let _ = rows[x] {
                ans.append(1)
            } else if let _ = cols[y] {
                ans.append(1)
            } else if let _ = pies[y - x] {
                ans.append(1)
            } else if let _ = nas[y + x] {
                ans.append(1)
            } else {
                ans.append(0)
            }
            
            
            for dx in [-1,0,1] {
                let nx = x + dx
                guard nx >= 0 && nx < n else {
                    continue
                }
                for dy in [-1,0,1] {
                    let ny = y + dy
                    guard ny >= 0 && ny < n else {
                        continue
                    }
                    
                    let key = (nx << 30) | ny
                    if lampsSet.contains(key) {
                        lampsSet.remove(key)
                        if let c = rows[nx] {
                            if c == 1 {
                                rows.removeValue(forKey: nx)
                            } else {
                                rows[nx] = c - 1
                            }
                        }
                        if let c = cols[ny] {
                            if c == 1 {
                                cols.removeValue(forKey: ny)
                            } else {
                                cols[ny] = c - 1
                            }
                        }
                        
                        if let c = pies[ny - nx] {
                            if c == 1 {
                                pies.removeValue(forKey: ny - nx)
                            } else {
                                pies[ny - nx] = c - 1
                            }
                        }
                        if let c = nas[nx + ny] {
                            if c == 1 {
                                nas.removeValue(forKey: nx + ny)
                            } else {
                                nas[nx + ny] = c - 1
                            }
                        }
                        
                        
                    }
                }
            }
        }
        
        return ans
    }
}