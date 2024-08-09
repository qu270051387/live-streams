#!/bin/bash

# ���� GitHub API ��������
TOKEN="your_github_token"

# �����ļ�·�����ļ���
FILE_PATH="/path/to/your/IPTV.m3u"

# ��ȡֱ��Դ��Ϣ
LIVE_STREAMS=$(curl -s https://s.netimed.cn/iptv)

# ��ֱ��Դ��Ϣ���浽�ļ�
echo "$LIVE_STREAMS" > "$FILE_PATH"

# �ύ���ĵ� GitHub
curl -X PUT \
  -H "Authorization: token $TOKEN" \
  -H "Content-Type: application/octet-stream" \
  --data-binary @"$FILE_PATH" \
  "https://uploads.github.com/repos/your_username/your_repository/contents/IPTV.m3u"
