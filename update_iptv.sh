#!/bin/bash

# 设置 GitHub API 访问令牌
TOKEN="your_github_token"

# 设置文件路径和文件名
FILE_PATH="/path/to/your/IPTV.m3u"

# 获取直播源信息
LIVE_STREAMS=$(curl -s https://s.netimed.cn/iptv)

# 将直播源信息保存到文件
echo "$LIVE_STREAMS" > "$FILE_PATH"

# 提交更改到 GitHub
curl -X PUT \
  -H "Authorization: token $TOKEN" \
  -H "Content-Type: application/octet-stream" \
  --data-binary @"$FILE_PATH" \
  "https://uploads.github.com/repos/your_username/your_repository/contents/IPTV.m3u"
