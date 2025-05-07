### 專案簡介

使用 Docker 建立標籤與 Docker Image
透過 GitHub Actions 實現全自動化的版本控制

### 如何透過 Docker Build 打包應用程式

1. 確保 Dockerfile 存在，範例 :
```bash
FROM python:3.9-slim
COPY src/ /app
WORKDIR /app
CMD ["python", "main.py"]
```

2. 使用 Docker Build 指令打包
`docker build -t 2025cloud:latest .`
- `-t 2025cloud:latest`：指定標籤（latest 為預設標籤)

### 如何透過 Docker Run 運行 Container Image

1. 確保 Docker Image 已建立
`docker images`
- 確保 2025cloud:latest 存在。

2. 使用 Docker Run 啟動容器
`docker run --name myapp -d winniehuang0616/2025cloud:latest`
- --name myapp：指定容器名稱。
- -d：在背景執行容器。

3. 查看容器日誌 ( 程式主要內容 )
`docker logs myapp`
- 應該會出現 hello world

### 自動化 Docker Image 產生與 Tagging 邏輯圖示

- 圖示
            ┌──────────────────────────┐
            │ GitHub Push Event        │
            └─────────────┬────────────┘
                          │
            ┌─────────────▼─────────────┐
            │ 分支檢查：                 │
            │ - main   => latest        │
            │ - release/* => versioned  │
            │ - 其他分支 => commit SHA   │
            └─────────────┬─────────────┘
                          │
            ┌─────────────▼─────────────┐
            │ Docker Build and Push     │
            │ - 2025cloud:latest        │
            │ - 2025cloud:2025.05.07    │
            │ - 2025cloud:<commit SHA>  │
            └───────────────────────────┘

- 文字說明 : 
如此可自動根據不同分支將檔案存成不同版本，
使得軟體本身更容易追蹤、溯源與維護，
在這樣的架構下，只有 latest 為預先設定的 Image，
其他為 push 之後自動生成的 Image
