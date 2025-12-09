FROM node:20-alpine3.20

# 设置应用程序的工作目录为 /app
WORKDIR /app

# 复制应用程序文件到 /app 目录
COPY index.js package.json ./

EXPOSE 3000

# 安装依赖并设置权限
RUN apk update && apk add --no-cache bash openssl curl && \
    chmod +x index.js && \
    npm install

# 容器启动时运行的命令
CMD ["node", "index.js"]
