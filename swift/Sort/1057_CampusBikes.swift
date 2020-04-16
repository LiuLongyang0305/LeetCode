// https://leetcode.com/problems/campus-bikes/
class Solution {
    private typealias Pair = (worker:Int,bike: Int)
    func assignBikes(_ workers: [[Int]], _ bikes: [[Int]]) -> [Int] {
        let bikesNumber = bikes.count
        let workerNumber = workers.count
        var map = [Int:[Pair]]()
        for i in 0..<workerNumber {
            for j in 0..<bikesNumber {
                let dis = abs(workers[i][0] - bikes[j][0]) + abs(workers[i][1] - bikes[j][1])
                if nil == map[dis] {
                    map[dis] = []
                }
                map[dis]?.append((i,j))
            }
        }

        
        var ans = Array<Int>(repeating: -1, count: workerNumber)
        var visitedBike = Array<Bool>(repeating: false, count: bikesNumber)
        var visitedWorker = Array<Bool>(repeating: false, count: workerNumber)
        let sortedMap = map.sorted { (dic1, dic2) -> Bool in
            dic1.key < dic2.key
        }
        for (_,pairs) in sortedMap {
            let sortedPair = pairs.sorted { (p1, p2) -> Bool in
                if p1.worker == p2.worker {
                    return p1.bike < p2.bike
                }
                return p1.worker < p2.worker
            }
            for pair in sortedPair {
                if !visitedWorker[pair.worker] && !visitedBike[pair.bike] {
                    visitedWorker[pair.worker]  = true
                    visitedBike[pair.bike] = true
                    ans[pair.worker] = pair.bike
                }
            }
        }
        return ans
    }
}
