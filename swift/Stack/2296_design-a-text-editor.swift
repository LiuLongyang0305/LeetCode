// https://leetcode.com/problems/design-a-text-editor/
class TextEditor {

    private var leftStack = [Character]()
    private var rightStack = [Character]()


    init() {
    }

    func addText(_ text: String) {
        leftStack.append(contentsOf: text)
    }

    func deleteText(_ k: Int) -> Int {
        let maxLen = min(k, leftStack.count)
        leftStack.removeLast(maxLen)
        return maxLen
    }

    func cursorLeft(_ k: Int) -> String {
        let maxLen = min(k, leftStack.count)
        rightStack.insert(contentsOf: leftStack.suffix(maxLen), at: 0)
        leftStack.removeLast(maxLen)
        return String(leftStack.suffix(10))
    }

    func cursorRight(_ k: Int) -> String {
        let maxLen = min(k, rightStack.count)
        leftStack.append(contentsOf: rightStack.prefix(maxLen))
        rightStack.removeFirst(maxLen)
        return String(leftStack.suffix(10))    
    }
}


/**
 * Your TextEditor object will be instantiated and called as such:
 * let obj = TextEditor()
 * obj.addText(text)
 * let ret_2: Int = obj.deleteText(k)
 * let ret_3: String = obj.cursorLeft(k)
 * let ret_4: String = obj.cursorRight(k)
 */