# RF-47 Network Server

Express API runner. Railway-ready, zero config.

## Deploy

1. Push repo ke GitHub
2. https://railway.app/new → **Deploy from GitHub repo** → pilih repo
3. Tunggu build selesai
4. Settings → Networking → **Generate Domain**
5. Done. No env var setup needed.

Railway auto inject `PORT` + `RAILWAY_PUBLIC_DOMAIN`. Server pickup otomatis.

## Hardcoded config (edit `server.js` kalau mau ubah)
- `API_KEY` = `rfpromax1337`
- `ping_enabled` = `true`
- `ping_interval` = `30000` ms
- `gas_url` = (Google Apps Script default)

## Endpoints
- `GET /health` — status + proxy count
- `GET /api?api_key=rfpromax1337&method=X&ip=HOST&port=PORT&time=SEC`

Methods: `tls`, `tlsv2`, `tlsv3`, `cf`, `fast`, `browser`, `gt`

## Example
```
https://your-app.up.railway.app/api?api_key=rfpromax1337&method=gt&ip=www.growtopia1.com&port=443&time=60&concurrent=50
```

## Local
```bash
npm install
node server.js
```
