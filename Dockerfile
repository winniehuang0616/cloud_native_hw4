# 選擇基礎映像檔
FROM python:3.9-slim

# 設定工作目錄
WORKDIR /app

# 複製應用程式原始碼
COPY src/ .

# 指定容器啟動指令
CMD ["python", "main.py"]

