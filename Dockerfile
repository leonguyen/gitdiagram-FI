# syntax=docker/dockerfile:1

FROM oven/bun:1.2 AS base
WORKDIR /app

# ---- deps ----
FROM base AS deps

COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

# ---- build ----
FROM base AS builder

COPY --from=deps /app/node_modules ./node_modules
COPY . .

ENV NEXT_TELEMETRY_DISABLED=1
ENV NODE_ENV=production

RUN bun run build

# ---- runtime ----
FROM oven/bun:1.2-slim AS runner

WORKDIR /app

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
ENV PORT=3000

COPY --from=builder /app ./

EXPOSE 3000

CMD ["bun", "run", "start"]
