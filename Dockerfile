FROM node:20-bookworm-slim
WORKDIR /app
COPY leaply-src.tar.gz .
RUN tar xzf leaply-src.tar.gz && rm leaply-src.tar.gz
RUN npm install --no-audit --no-fund && npm run build
ENV NODE_ENV=production
ENV LEAPLY_DB_PATH=/data/leaply.db
ENV PORT=3000
RUN mkdir -p /data
EXPOSE 3000
CMD ["npm","start"]
