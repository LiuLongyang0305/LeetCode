// https://leetcode.com/problems/cinema-seat-allocation/
class Solution {
    func maxNumberOfFamilies(_ n: Int, _ reservedSeats: [[Int]]) -> Int {
        
        var ans =  n << 1
        var seats = [Int:[Bool]]()
        for reseredSeat in reservedSeats {
            if nil == seats[reseredSeat[0]] {
                seats[reseredSeat[0]] = Array<Bool>(repeating: true, count: 11)
            }
            seats[reseredSeat[0]]?[reseredSeat[1]] = false
        }
        for (_,currentSeats) in seats {
            if currentSeats[2] && currentSeats[3] && currentSeats[4] && currentSeats[5] && currentSeats[6] && currentSeats[7] && currentSeats[8] && currentSeats[9] {
                continue
            }
            if (currentSeats[2] && currentSeats[3] && currentSeats[4] && currentSeats[5]) || (currentSeats[4] && currentSeats[5] && currentSeats[6] && currentSeats[7]) || (currentSeats[6] && currentSeats[7] && currentSeats[8] && currentSeats[9] ) {
                ans -= 1
                continue
            }

            ans -= 2
        }
        return ans
    }
}