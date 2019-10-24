//https://leetcode.com/problems/populating-next-right-pointers-in-each-node-ii/
class Node {
public:
    int val;
    Node *left;
    Node *right;
    Node *next;

    Node() {}

    Node(int _val, Node *_left, Node *_right, Node *_next) {
        val = _val;
        left = _left;
        right = _right;
        next = _next;
    }
};
class Solution {
public:
    Node *connect(Node *root) {
        if (!root){
            return root;
        }
        queue<Node*> nodes;
        nodes.push(root);
        while (!nodes.empty()) {
            int length = nodes.size();
            for (int i = 0; i < length; ++i) {
                Node *temp = nodes.front();
                nodes.pop();
                if(i == length - 1) {
                    temp->next = nullptr;
                } else {
                    temp->next = nodes.front();
                }
                if(temp->left){
                    nodes.push(temp->left);
                }
                if(temp->right){
                    nodes.push(temp->right);
                }
            }
        }
        return  root;
    }
};