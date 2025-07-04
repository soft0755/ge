FROM python:3.12-slim

WORKDIR /app

COPY . .

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
RUN pip install uv
RUN uv pip install --system --no-cache-dir -r requirements.txt -i https://pypi.tuna.tsinghua.edu.cn/simple

EXPOSE 7860

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "7860"]