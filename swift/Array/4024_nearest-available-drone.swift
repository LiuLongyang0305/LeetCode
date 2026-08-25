    //https://leetcode.cn/problems/nearest-available-drone/
    class Solution {
        func nearestDrone(_ drones: [[Int]], _ target: [Int]) -> Int {

            var sb = -1
            var minDis = Int.max
            let (tx,ty) = (target[0],target[1])
            for (i,d) in drones.enumerated() {
                let (x,y,r) = (d[0],d[1],d[2])
                let dis = abs(x - tx) + abs(y - ty)
                guard dis <= r  else{continue}
                if dis < minDis {
                    sb = i
                    minDis = dis
                }
            }
            return sb
        }
    }
