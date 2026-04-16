# Smart Study Buddy - NLP Based Student Helpdesk Assistant

A complete full-stack web app with:
- React 18 + TypeScript + Vite + Tailwind + shadcn-style UI components
- Node.js + Express backend
- Supabase PostgreSQL knowledge base (`faqs` table)
- TF-IDF + cosine similarity NLP matching engine
- Admin panel to add and update FAQs
- Confidence score + matched keyword chips
- Dark mode toggle

## Project Structure

```text
smart-study-buddy/
  frontend/   # React UI
  backend/    # Express API + NLP engine
  database/   # PostgreSQL schema + sample FAQ data
```

## 1) Prerequisites

- Node.js 20+
- npm 10+
- Supabase project (URL + service role key)

## 2) Database Setup (Supabase)

1. Open Supabase SQL editor.
2. Run [`database/schema.sql`](./database/schema.sql).
3. Verify the `faqs` table contains at least 10 rows.

## 3) Backend Setup

1. Open terminal in `smart-study-buddy/backend`.
2. Install dependencies:
   ```bash
   npm install
   ```
3. Create `.env` from `.env.example`:
   ```bash
   cp .env.example .env
   ```
4. Update `.env`:
   - `SUPABASE_URL`
   - `SUPABASE_SERVICE_ROLE_KEY`
   - `ADMIN_TOKEN`
5. Start backend:
   ```bash
   npm run dev
   ```

Backend runs at `http://localhost:4000`.

### Backend API

#### `POST /chat`
Request:
```json
{
  "message": "When are exams?"
}
```

Response:
```json
{
  "reply": "Semester exams begin on March 10 and end on March 25. The detailed timetable is published in the student portal.",
  "confidence": 0.87,
  "matchedKeywords": ["exams", "schedule"]
}
```

#### `GET /faqs`
Returns all FAQs.

#### `POST /faqs`
Adds FAQ (requires `x-admin-token`).

#### `PUT /faqs/:id`
Updates FAQ (requires `x-admin-token`).

## 4) Frontend Setup

1. Open terminal in `smart-study-buddy/frontend`.
2. Install dependencies:
   ```bash
   npm install
   ```
3. Create `.env` from `.env.example`:
   ```bash
   cp .env.example .env
   ```
4. Set values:
   - `VITE_API_BASE_URL=http://localhost:4000`
   - `VITE_ADMIN_TOKEN` (same as backend `ADMIN_TOKEN`)
5. Start frontend:
   ```bash
   npm run dev
   ```

Frontend runs at `http://localhost:5173`.

## Features Implemented

- Real-time chat style UI
- User/bot message styling with timestamps
- Typing indicator animation
- Auto-scroll to latest message
- Quick action buttons (fees, exams, timetable, library)
- NLP pipeline:
  - lowercasing
  - tokenization
  - stopword removal
  - TF-IDF vectorization
  - cosine similarity scoring
- Fallback reply under threshold (`NLP_SIMILARITY_THRESHOLD`, default `0.30`)
- Confidence score returned to UI
- Matched keyword highlighting as chips
- Admin panel for adding/updating FAQs
- Responsive layout for desktop and mobile
- Dark mode toggle with local preference storage

## Notes

- The backend computes TF-IDF on each chat request from live FAQ data, so FAQ updates are instantly reflected.
- Keep `SUPABASE_SERVICE_ROLE_KEY` secret. Do not expose it on frontend.
