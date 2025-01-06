FROM node:18-alpine

COPY . /app

# Set the working directory
WORKDIR /app

# Install pnpm
RUN npm install -g pnpm

WORKDIR /app/packages/app
RUN cp .env.example .env.local
RUN pnpm install --frozen-lockfile

RUN pnpm build

# Expose the port Next.js runs on
EXPOSE 3000

# Run the Next.js start script
CMD ["pnpm", "start"]
