#!/bin/bash

# 轻量级 nvm 实现，仅支持切换 node 版本，.nvmrc 文件中指定版本。
# export NVM_BASE_DIR="/d/nvm_min"
# [ -s "$NVM_BASE_DIR/nvm_min.sh" ] && \. "$NVM_BASE_DIR/nvm_min.sh"

# 列出当前已安装的 node 版本
local_node() {
  for dir in $(ls -dr "$NVM_BASE_DIR"/versions/node-v*-win-x64); do
    basename "$dir" | sed 's/node-v\(.*\)-win-x64/\1/'
  done
}

# 获取完成的版本号
_local_node_version() {
  local version=$(local_node | grep -E "^$1" | head -n 1)
  echo ${version:-$1}
}

# 加载 .nvmrc 文件中指定的 node 版本
load_nvmrc() {
  if [ -f .nvmrc ]; then
    local node_version=$(_local_node_version $(cat .nvmrc))
    local node_path="$NVM_BASE_DIR/versions/node-v$node_version-win-x64"
    if [ -d "$node_path" ]; then
      export PATH="$node_path:$PATH"
    else
      echo ".nvmrc version $node_version not found"
    fi
  fi
}

# 切换 node 版本
use_node() {
  echo "$1" > .nvmrc
  load_nvmrc
  local version=$(command node -v)
  echo "current node version: $version"
}

# 初始化加载当前目录的 .nvmrc 文件
load_nvmrc
