FROM node:20-alpine AS deps
WORKDIR /workspace/apps/web
COPY apps/web/package.json ./
RUN npm install

FROM node:20-alpine AS builder
WORKDIR /workspace/apps/web
COPY --from=deps /workspace/apps/web/node_modules ./node_modules
COPY apps/web ./
RUN npm run build

FROM node:20-alpine AS runner
WORKDIR /workspace/apps/web
ENV NODE_ENV=production
COPY --from=builder /workspace/apps/web/.next ./.next
COPY --from=builder /workspace/apps/web/public ./public
COPY --from=builder /workspace/apps/web/package.json ./package.json
COPY --from=builder /workspace/apps/web/node_modules ./node_modules
COPY --from=builder /workspace/apps/web/next.config.js ./next.config.js
EXPOSE 3000
CMD ["npm", "run", "start"]
