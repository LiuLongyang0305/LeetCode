//https://leetcode.com/problems/maximum-depth-of-n-ary-tree/
class Node {
public:
    int val;
    vector<Node *> children;

    Node() {}

    Node(int _val, vector<Node *> _children) {
        val = _val;
        children = _children;
    }
};

class Solution {
public:
    int maxDepth(Node *root) {
        if (nullptr == root) {
            return 0;
        }
        queue<Node *> nodes = queue<Node *>();
        int ans = 0;
        nodes.push(root);
        while (!nodes.empty()) {
            int length = nodes.size();
            ans += 1;
            for (int i = 0; i < length; ++i) {
                Node *temp = nodes.front();
                nodes.pop();
                for (auto node : temp->children) {
                    nodes.push(node);
                }
            }
        }
        return ans;
    }
};