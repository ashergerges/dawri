# Favorites (Wishlist) API — Backend Spec

Endpoints required by the **Favorites (المفضلة)** screen in the `dawri` mobile app — one place
listing everything the user has favourited anywhere in the app, split into four tabs.

- **Base host:** `https://api-dawry.sanam-ksa.com/`
- **Auth:** `Authorization: Bearer <token>` (user-scoped)
- **Headers:** `Accept: application/json`, plus the app's locale header

## Status: what exists vs. what's needed

| Endpoint | Status | Used for |
|---|---|---|
| `GET api/app/user/wishlist` | ⚠️ **route exists, unused by the app** — needs the contract below | The 4-tab favourites list + tab counts |
| `POST api/app/product/favorite` | ✅ **already exists** — no change | Un-favourite a product |
| `POST api/app/stadiums/favorite` | ✅ **already exists** — no change | Un-favourite a stadium |
| `POST api/app/championships/favorite` | ✅ **already exists** — no change | Un-favourite a championship |
| `POST api/app/participants/favorite` | ✅ **already exists** — no change | Un-favourite a player |

The four toggle endpoints are already used by the product / stadium / championship / partner details
screens, so **no new write endpoint is needed** — the favourites screen reuses them, routed by type.
The only real work is the **read** endpoint.

The client is fully implemented against the contract below and **is already wired to these live
endpoints** — `lib/features/favorites/data/repositories/remote/favorites_repository.dart`. The four
toggle calls work today; the list shows its error-with-retry state until `api/app/user/wishlist`
returns the shape below, at which point the screen works with no app change.

## Response envelope (mandatory)

The app's `NetworkService` treats **any** response without `status: true` as an error and surfaces
`result.message` or `message` to the user:

```json
{ "status": true, "message": "", "data": { } }
```

Failures must be `{ "status": false, "message": "localized, user-facing" }`. HTTP 200 with
`status: false` is fine — the client keys off `status`, not the HTTP code.

**Localization:** `title` and `subtitle` must come back already translated in the caller's locale.
The client does no translation of API content.

---

## 1. Favorites list — CONTRACT NEEDED

```
GET api/app/user/wishlist?type=1&page=1&limit=10
```

| Param | Type | Required | Notes |
|---|---|---|---|
| `type` | int | yes | `1` product · `2` stadium · `3` championship · `4` participant |
| `page` | int | yes | 1-based |
| `limit` | int | yes | Client currently sends `10` |

`type` is a **numeric enum** — see the table at the bottom. Each value maps 1:1 to one of the four
existing toggle endpoints, so the client can route a row back to its toggle with no extra lookup.

**200 — success**

```json
{
  "status": true,
  "message": "",
  "data": {
    "items": [
      {
        "id": 201,
        "type": 2,
        "title": "ملعب النرجس الرياضي",
        "image": "https://.../pitch.jpg",
        "subtitle": "ملعب خماسي - عشب صناعي",
        "city": "الرياض",
        "price": "250.00",
        "currency": "ر.س",
        "rating": 4.8,
        "reviews_count": 212,
        "is_available": true,
        "created_at": "2026-08-14 10:00:00"
      }
    ],
    "counts": {
      "products": 3,
      "stadiums": 2,
      "championships": 2,
      "participants": 2
    },
    "pagination": {
      "current_page": 1,
      "per_page": 10,
      "total_items": 2,
      "has_more": false
    }
  }
}
```

| Field | Type | Required | Notes |
|---|---|---|---|
| `items[]` | array | yes | May be empty. `data.wishlist` is also accepted as the key |
| `id` | int | yes | **Id of the entity** (product / stadium / …), *not* of the favourite record — it's what the toggle endpoints take, and what the app opens the details screen with |
| `type` | int | yes | Echo of the requested type as a numeric enum (`1`–`4`); the client falls back to the query value if omitted |
| `title` | string | yes | **Localized** name shown on the card |
| `image` | string | no | Absolute URL; blank / null renders a placeholder |
| `subtitle` | string | no | **Localized** one-liner — category, pitch type, sport + team count, position + level |
| `city` | string | no | Shown with a pin icon. Not meaningful for products |
| `price` | string | no | Display-formatted; product unit price or stadium hourly rate |
| `currency` | string | no | Required whenever `price` is present |
| `rating` | number | no | 0–5; hidden when absent or `0` |
| `reviews_count` | int | no | Rendered as `4.8 (212)` when present |
| `is_available` | bool | no | `false` greys the card and shows a "غير متاح" chip — sold out product, closed stadium, finished championship, inactive player. Defaults to `true` |
| `created_at` | string | no | When it was favourited; used for default ordering |
| `counts` | object | yes | Drives the four tab badges — **totals across all pages**, and **for all four types**, not just the requested one |
| `pagination` | object | yes | `has_more` / `has_next`, or `current_page` + `total_pages` |

**Ordering:** most-recently-favourited first (`created_at DESC`).

**Errors:** `401` unauthenticated. An empty tab is a success with `items: []`, not an error.

> **Ask 1 — one normalised shape.** The four entities have very different columns; please flatten
> them into the row above server-side rather than returning four different payload shapes. The
> screen renders a single card type, and a per-type shape would push entity-specific parsing into
> the client for no benefit.

> **Ask 2 — `counts` on every response.** The badges for all four tabs must be correct as soon as
> the *first* tab loads, so `counts` needs to cover all four types on every call, regardless of the
> `type` filter. Without this the user sees `0` on tabs they haven't opened yet.

> **Ask 3 — orphan rows.** If a favourited entity is deleted or hidden, please drop it from the list
> rather than returning a row with a null title. The client has no sensible way to render it.

---

## 2. Un-favourite — EXISTING, no change

The screen's heart button reuses the endpoint that already backs each entity's details screen. They
are **toggles**, not deletes — calling one on a non-favourited entity re-adds it.

| `type` | Entity | Route | Id sent as |
|---|---|---|---|
| `1` | product | `POST api/app/product/favorite` | body `{ "id": 101 }` |
| `2` | stadium | `POST api/app/stadiums/favorite` | body `{ "id": 201 }` |
| `3` | championship | `POST api/app/championships/favorite` | body `{ "id": 301 }` |
| `4` | participant | `POST api/app/participants/favorite` | query `?id=401` |

**200 — success**

```json
{ "status": true, "message": "تمت الإزالة من المفضلة", "data": null }
```

The client shows `message` as a success toast (falling back to its own copy if empty), removes the
row from the list, and decrements that tab's badge.

> **Nice-to-have, not blocking:** `participants/favorite` takes its id in the **query string** while
> the other three take a **body**. That inconsistency is already baked into the details screens, so
> the client handles both — but if you ever normalise it, tell us and we'll follow.

> **Also nice-to-have:** returning the resulting state (`"data": { "is_favorite": false }`) would let
> the client show the correct heart after a toggle instead of assuming the row is gone. Not needed
> for this screen, which only ever un-favourites.

## Type enum

Please fix and document these values; the client hardcodes them
(`FavoriteType` in `lib/features/favorites/data/models/favorite_model.dart`).

| Value | Entity | Tab |
|---|---|---|
| `1` | Product | المنتجات |
| `2` | Stadium | الملاعب |
| `3` | Championship | البطولات |
| `4` | Participant (player) | اللاعبين |

Values must be **integers**, not numeric strings — `"type": 2` not `"type": "2"`. Adding a fifth
type later is safe: the client renders unknown types with a neutral icon and simply doesn't make
the card tappable.

## Client-side summary

| UI element | Data source |
|---|---|
| Tab labels | Local translations (`favoritesTab*`) |
| Tab count badges | `data.counts.{products,stadiums,championships,participants}` |
| Card thumbnail | `image`, with a small type icon overlaid |
| Card title / subtitle | `title` / `subtitle` |
| Card meta row | `rating` + `reviews_count`, `city`, `price` + `currency` |
| "غير متاح" chip | `is_available == false` |
| Heart button | The per-type toggle endpoint above |
| Card tap | `type` (1–4) picks the route, `id` is the argument — product / stadium / championship / partner details |
| Pull-to-refresh / infinite scroll | `page` + `limit` + `pagination` |

**Offline / failure behaviour:** no bundled fallback — a failed request shows an error state with a
retry button. The list is re-fetched when returning from an entity's details screen, since the
favourite can be toggled there too.
