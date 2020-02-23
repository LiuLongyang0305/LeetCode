// https://leetcode.com/problems/filter-restaurants-by-vegan-friendly-price-and-distance/
class Solution {
    func filterRestaurants(_ restaurants: [[Int]], _ veganFriendly: Int, _ maxPrice: Int, _ maxDistance: Int) -> [Int] {
        return restaurants.filter {($0[2] == veganFriendly || veganFriendly == 0) && $0[3] <= maxPrice && $0[4] <= maxDistance}.sorted { (res1, res2) -> Bool in
            if res1[1] == res2[1] {
                return res1[0] > res2[0]
            }
            return res1[1] > res2[1]
        }.map {$0[0]}
    }
 }