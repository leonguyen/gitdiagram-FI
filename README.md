# gitdiagram Fly.io Deployment

Ready-to-deploy Fly.io configuration for:
https://github.com/ahmedkhaleel2004/gitdiagram

## Features

- Bun runtime
- Multi-stage Docker build
- Fly Machines autosuspend
- Singapore region optimized for Asia
- Next.js standalone mode
- Health checks enabled

## Quick Start

### 1. Clone upstream repo

```bash
git clone https://github.com/ahmedkhaleel2004/gitdiagram.git
cd gitdiagram
```

### 2. Copy deployment files

Copy all files from this package into the repository root.

### 3. Install Fly CLI

```bash
curl -L https://fly.io/install.sh | sh
```

### 4. Login

```bash
fly auth login
```

### 5. Create app

```bash
fly launch --no-deploy
```

### 6. Set secrets

```bash
fly secrets set OPENAI_API_KEY=your_key_here
```

### 7. Deploy

```bash
fly deploy
```

## Recommended Settings

- Backend mode: next
- RAM: 2GB
- Region: sin

## Notes

This deployment uses:

```env
NEXT_PUBLIC_GENERATION_BACKEND=next
```

which avoids requiring a separate FastAPI backend.
