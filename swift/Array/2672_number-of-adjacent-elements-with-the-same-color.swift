//https://leetcode.com/problems/number-of-adjacent-elements-with-the-same-color/
class Solution {
    func colorTheArray(_ n: Int, _ queries: [[Int]]) -> [Int] {

        guard n > 1 else {return [Int](repeating: 0, count: queries.count)}

        var colors = [Int](repeating: 0, count: n)

        func  update(_ idx: Int, _ color: Int) -> Int {
            var delta = 0
            //left
            if idx > 0 {

                if colors[idx] == colors[idx - 1] && colors[idx] != 0 {
                    delta -= 1
                }

                if colors[idx - 1] == color {
                    delta += 1
                }
            }
            //right
            if idx < n - 1 {

                if colors[idx] == colors[idx + 1] && colors[idx] != 0 {
                    delta -= 1
                }
                if colors[idx + 1] == color {
                    delta += 1
                }

            }
            colors[idx] = color
            return delta
        }


        var cur = 0
        var ans = [Int]()
        for q in queries {
            cur += update(q[0], q[1])
            ans.append(cur)
        }

        return ans
    }
}
