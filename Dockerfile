FROM node:20-bookworm-slim
WORKDIR /app
COPY leaply-src.tar.gz .
RUN tar xzf leaply-src.tar.gz && rm leaply-src.tar.gz
# .next este pre-construit și inclus în tarball — NU se mai rulează `next build` pe server
# (build-ul pe server eșua din lipsă de memorie și producea output incomplet, fără CSS)
RUN npm install --omit=dev --no-audit --no-fund
ENV NODE_ENV=production
ENV LEAPLY_DB_PATH=/data/leaply.db
ENV PORT=3000
RUN mkdir -p /data
VOLUME /data
EXPOSE 3000
CMD ["npm","start"]
