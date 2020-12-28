// https://leetcode.com/problems/number-of-students-unable-to-eat-lunch/
class Solution {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        var studentsCopy = students
        var sandwichesCopy = sandwiches
        
        while !sandwichesCopy.isEmpty {
            guard let firstIdx = studentsCopy.firstIndex(of: sandwichesCopy.first!) else {
                break
            }
//            print( "students = \(studentsCopy)  sanswichs = \(sandwichesCopy)  idx = \(firstIdx)")
            var i = 0
            while i < firstIdx {
                studentsCopy.append(studentsCopy.first!)
                studentsCopy.removeFirst()
                i += 1
            }
            sandwichesCopy.removeFirst()
            studentsCopy.removeFirst()

        }
        
        return studentsCopy.count
    }
}