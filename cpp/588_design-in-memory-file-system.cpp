 // https://leetcode.com/problems/design-in-memory-file-system/
class FileSystemNode {
public:
    string name;
    string contents = "";
    vector<FileSystemNode*> children = vector<FileSystemNode*>();
    bool isFile;
    FileSystemNode(string name, bool isFile = false):name(name),isFile(isFile) {}

};

class FileSystem {
private:
    FileSystemNode* root = new FileSystemNode("root");
public:
    FileSystem() {
    }

    vector<string> ls(string path) {
        vector<string> ans;
        vector<string> files = getPath(path);
        FileSystemNode* node = root;
        for (int i = 1; i < files.size(); ++i) {
            bool flag = false;
            for (auto child: node->children) {
                if(child->name == files[i]) {
                    flag = true;
                    node = child;
                    break;
                }
            }
            if(!flag) {
                return ans;
            }
        }
        if(node->isFile) {
            ans.push_back(node->name);
        } else {
            for(auto child : node->children) {
                ans.push_back(child->name);
            }
        }
       sort(ans.begin(),ans.end());
        return ans;
    }

    void mkdir(string path) {
        vector<string> files = getPath(path);
        FileSystemNode *node = root;
        for (int i = 1; i < files.size(); ++i) {
            bool flag = false;
            for(auto dir: node->children) {
                if(dir->name == files[i]){
                    flag = true;
                    node = dir;
                }
            }
            if(!flag) {
                auto newNode = new FileSystemNode(files[i]);
                node->children.push_back(newNode);
                node = newNode;
            }
        }
    }

    void addContentToFile(string filePath, string content) {
        vector<string> files = getPath(filePath);
        FileSystemNode *node = root;
        for (int i = 1; i < files.size(); ++i) {
            bool flag = false;
            for(auto dir: node->children) {
                if(dir->name == files[i]){
                    flag = true;
                    node = dir;
                }
            }
            if(!flag) {
                auto newNode = new FileSystemNode(files[i]);
                node->children.push_back(newNode);
                node = newNode;
            }
        }
        node->isFile = true;
        node->contents.append(content);
    }

    string readContentFromFile(string filePath) {
        vector<string> files = getPath(filePath);
        FileSystemNode *node = root;
        for (int i = 1; i < files.size(); ++i) {
            bool flag = false;
            for(auto dir: node->children) {
                if(dir->name == files[i]){
                    flag = true;
                    node = dir;
                }
            }
            if(!flag) return "";
        }
        return node->contents;
    }

private:
    vector<string> getPath(string path) {
        vector<string> files;
        string  cur = "";
        for (auto ch:path) {
            if(ch == '/') {
                if(cur.empty()) {
                    files.push_back("root");
                } else {
                    files.push_back(cur);
                }
                cur = "";
                continue;
            }
            cur.push_back(ch);
        }
        if(!cur.empty()) {
            files.push_back(cur);
        }
        return files;
    }
};
/**
 * Your FileSystem object will be instantiated and called as such:
 * FileSystem* obj = new FileSystem();
 * vector<string> param_1 = obj->ls(path);
 * obj->mkdir(path);
 * obj->addContentToFile(filePath,content);
 * string param_4 = obj->readContentFromFile(filePath);
 */