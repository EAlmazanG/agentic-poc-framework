FROM node:20-alpine AS deps
WORKDIR /workspace/apps/web
COPY apps/web/package.json apps/web/package-lock.json ./
RUN npm ci

FROM deps AS dev
COPY apps/web ./
EXPOSE 3000
CMD ["npm", "run", "dev", "--", "--hostname", "0.0.0.0", "--port", "3000"]

FROM deps AS builder
COPY apps/web ./
RUN npm run build

FROM node:20-alpine AS runner
WORKDIR /workspace/apps/web
ENV NODE_ENV=production
COPY --from=builder /workspace/apps/web/.next/standalone ./
COPY --from=builder /workspace/apps/web/.next/static ./.next/static
COPY --from=builder /workspace/apps/web/public ./public
EXPOSE 3000
CMD ["node", "server.js"]
