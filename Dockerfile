# שלב 1: בנייה ובדיקה
FROM node:20-alpine AS builder

# --- NETFREE CERT INTSALL ---
ADD https://netfree.link/dl/unix-ca2.sh /home/netfree-unix-ca.sh
RUN cat  /home/netfree-unix-ca.sh | sh
ENV NODE_EXTRA_CA_CERTS=/etc/ca-bundle.crt
ENV REQUESTS_CA_BUNDLE=/etc/ca-bundle.crt
ENV SSL_CERT_FILE=/etc/ca-bundle.crt
# --- END NETFREE CERT INTSALL ---

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm test

# שלב 2: הרצה
FROM node:20-alpine
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/app.js .
COPY --from=builder /app/package.json .
EXPOSE 3000
CMD ["node", "app.js"]