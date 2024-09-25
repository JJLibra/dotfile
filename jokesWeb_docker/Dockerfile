# 使用官方的 Python 作为基础镜像
FROM python:3.9-slim

# 设置工作目录
WORKDIR /app

# 复制当前目录下的所有文件到容器的 /app 目录
COPY . .

# 安装 Flask 和 requests 库
RUN pip install Flask requests

# 设置 Flask 的环境变量
ENV FLASK_APP=app.py

# 暴露容器的5000端口
EXPOSE 5000

# 运行 Flask 应用
CMD ["flask", "run", "--host=0.0.0.0"]
