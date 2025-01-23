# nvm_min

轻量，离线 nvm 版本

实现加载 .nvmrc 和切换 node 版本的功能

ps: 给内网使用，官方 nvm 内网断网环境初始化超级慢，导致卡终端。

## 使用

1. 官网下 win-x64 版本的包，解压到 versions 目录下即可。
如: node-v18.20.5-win-x64.zip 解压后 node-v18.20.5-win-x64 不需要改名字

2. 在用户根目录的 .bashrc 添加如下命令，然后重新打开控制台即可使用
```sh
export NVM_BASE_DIR="/d/nvm_min"
[ -s "$NVM_BASE_DIR/nvm_min.sh" ] && \. "$NVM_BASE_DIR/nvm_min.sh"
```

这里的 /d/nvm_min 需要更换你真实的目录


## 已知BUG

node-v20.8.0-win-x64
node-v20.18.2-win-x64

会使用 20.8.0 版本，是因为 ls 命令排序按 ascii 排序导致，暂不解决该bug，手动删除低版本即可。
