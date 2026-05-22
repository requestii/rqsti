# Requestii System Architecture

## High-Level
- Flutter mobile app + admin web (Flutter web) consume FastAPI.
- FastAPI modules: Auth, Marketplace, Jobs, Wallet, Escrow, Messaging, Reviews, Notifications, Admin.
- PostgreSQL + PostGIS for core and geo queries.
- Redis for caching/rate-limit/session/pubsub.
- Celery for async jobs (notifications, payouts, moderation).
- Cloudflare R2 for media/attachments.
- WebSocket gateway for real-time chat + typing/read receipts.

## Security
JWT access/refresh, RBAC, password hashing (bcrypt), input validation (Pydantic), upload validation, audit logs, rate limiting.

## Phase Plan
1. Auth/Profile/Categories/Services
2. Jobs/Proposals/Messaging
3. Wallet/Escrow/Payments
4. Ratings/Notifications/Analytics
5. Admin/Security hardening/Performance
