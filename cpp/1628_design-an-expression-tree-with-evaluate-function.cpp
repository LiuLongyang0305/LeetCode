// https://leetcode.com/problems/design-an-expression-tree-with-evaluate-function/
/**
 * This is the interface for the expression tree Node.
 * You should not remove it, and you can define some classes to implement it.
 */
class Node {
public:
    virtual ~Node() {};

    virtual int evaluate() const = 0;

protected:
    // define your fields here
};

enum struct NodeType {
    OPERAND,
    ADD,
    SUBTRACT,
    MULTIPLY,
    DIVIDE
};

class NodeImpl : public Node {
public:
    NodeType type;
    int val;
    Node *left;
    Node *right;
     NodeImpl(NodeType type, int val = 0) : type(type), val(val), left(nullptr), right(nullptr) {}

    virtual int evaluate() const override {
        switch (type) {
            case NodeType::OPERAND:
                return val;
            case NodeType::ADD:
                return left->evaluate() + right->evaluate();
            case NodeType::SUBTRACT:
                return left->evaluate() - right->evaluate();
            case NodeType::MULTIPLY:
                return left->evaluate() * right->evaluate();
            case NodeType::DIVIDE:
                return left->evaluate() / right->evaluate();
        }
        return 0;
    }
    virtual ~NodeImpl() {
        delete left;
        delete right;
    }
};

/**
 * This is the TreeBuilder class.
 * You can treat it as the driver code that takes the postinfix input 
 * and returns the expression tree represnting it as a Node.
 */

class TreeBuilder {
public:
    Node *buildTree(vector<string> &postfix) {
        stack<Node *> stack;
        for (string &s: postfix) {
            NodeType type;
            if (s == "+") {
                type = NodeType::ADD;
            } else if (s == "-") {
                type = NodeType::SUBTRACT;
            } else if (s == "*") {
                type = NodeType::MULTIPLY;
            } else if (s == "/") {
                type = NodeType::DIVIDE;
            } else {
                type = NodeType::OPERAND;
            }
            if (type == NodeType::OPERAND) {
                stack.push(new NodeImpl(type, stoi(s)));
            } else {
                NodeImpl* node = new NodeImpl(type);
                node->right = stack.top();
                stack.pop();
                node->left = stack.top();
                stack.pop();
                stack.push(node);
            }
        }
        return  stack.top();
    }
};

/**
 * Your TreeBuilder object will be instantiated and called as such:
 * TreeBuilder* obj = new TreeBuilder();
 * Node* expTree = obj->buildTree(postfix);
 * int ans = expTree->evaluate();
 */