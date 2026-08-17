# Orders API — Backend Spec

Endpoints required by the **My Purchases & Orders (مشترياتي وطلباتي)** screens in the `dawri`
mobile app — the tabbed orders list, the order details screen with its shipment tracking timeline,
and the **"تتبع الطلب"** button on the checkout success modal.

- **Base host:** `https://api-dawry.sanam-ksa.com/`
- **Auth:** `Authorization: Bearer <token>` (all endpoints are user-scoped)
- **Headers:** `Accept: application/json`, plus the app's locale header

## Status: what exists vs. what's needed

| Endpoint | Status | Used for |
|---|---|---|
| `GET api/app/orders` | ❌ **NEW — please build** | The 3-tab orders list + tab count badges |
| `GET api/app/orders/{id}` | ❌ **NEW — please build** | Order details: items, totals, tracking timeline |
| `POST api/app/orders/{id}/cancel` | ❌ **NEW — please build** | The "إلغاء الطلب" action |
| `POST api/app/cart/checkout` | ⚠️ **exists — small change requested** | Must also return `order_id` / `order_number` |

There is currently **no orders endpoint of any kind** — `api/app/user/financial-transactions`
returns payment transactions, not fulfilment state, so it can't back this screen.

The client is fully implemented against the contract below and **is already wired to these live
endpoints** — `lib/features/my_orders/data/repositories/remote/my_orders_repository.dart`. Until
they exist the screens show their error-with-retry state; the moment the routes go up matching this
contract, the feature works with no app change.

## Response envelope (mandatory)

The app's `NetworkService` treats **any** response without `status: true` as an error and surfaces
`result.message` or `message` to the user:

```json
{ "status": true, "message": "", "data": { } }
```

Failures must be `{ "status": false, "message": "localized, user-facing" }`. HTTP 200 with
`status: false` is fine — the client keys off `status`, not the HTTP code.

**Localization:** `status_text` and every `tracking[].title` must come back already translated in
the caller's locale (per the locale header). The client does no translation of API content — it only
falls back to a generic tab label if `status_text` is empty.

**Money:** all amounts are **strings** already formatted for display (`"1,045.00"`), with a separate
`currency` field (`"ر.س"`). The client never does arithmetic on them.

---

## 1. Orders list — NEW

```
GET api/app/orders?status=1&page=1&limit=5
```

| Param | Type | Required | Notes |
|---|---|---|---|
| `status` | int | yes | Tab filter — `1` current, `2` delivered, `3` cancelled |
| `page` | int | yes | 1-based |
| `limit` | int | yes | Client currently sends `5` |

`status` is a **group**, not the granular per-order status: "current" covers everything in flight
(received / processing / shipped / out for delivery).

**200 — success**

```json
{
  "status": true,
  "message": "",
  "data": {
    "items": [
      {
        "id": 8492,
        "order_number": "DW-8492",
        "status": 2,
        "status_text": "جاري التجهيز",
        "status_group": 1,
        "created_at": "2026-08-16 14:22:00",
        "items_count": 3,
        "subtotal": "1,045.00",
        "shipping": "25.00",
        "discount": "0",
        "total": "1,070.00",
        "currency": "ر.س",
        "can_cancel": true,
        "items": [
          {
            "id": 1,
            "product_id": 102,
            "name": "كرة قدم Adidas Al Rihla",
            "image": "https://.../ball.jpg",
            "quantity": 2,
            "price": "180.00",
            "variant": null
          }
        ],
        "tracking": [
          {
            "key": "placed",
            "title": "تم استلام الطلب",
            "date": "2026-08-14 10:12",
            "is_done": true,
            "is_current": false
          },
          {
            "key": "processing",
            "title": "جاري التجهيز",
            "date": "2026-08-14 15:40",
            "is_done": false,
            "is_current": true
          }
        ]
      }
    ],
    "counts": { "current": 7, "delivered": 3, "cancelled": 2 },
    "pagination": {
      "current_page": 1,
      "per_page": 5,
      "total_items": 7,
      "has_more": true
    }
  }
}
```

| Field | Type | Required | Notes |
|---|---|---|---|
| `items[]` | array | yes | May be empty. `data.orders` is also accepted as the key |
| `id` | int | yes | Used for details / cancel |
| `order_number` | string | yes | Human-facing, shown on the card and success modal |
| `status` | int | yes | Granular status id (see enum below) |
| `status_text` | string | yes | **Localized** label shown in the pill |
| `status_group` | int | yes | `1` / `2` / `3` — must match the `status` filter values |
| `created_at` | string | yes | `Y-m-d H:i:s`; the card shows the date part only |
| `items_count` | int | yes | Total line items, even if `items[]` is trimmed for the list |
| `subtotal` `shipping` `discount` `total` | string | yes | Display-formatted amounts |
| `currency` | string | yes | e.g. `ر.س` |
| `can_cancel` | bool | yes | **Server decides.** The client never infers cancellability |
| `items[]` | array | no | Up to 4 are enough for the list (the card shows 3 + "+N") |
| `tracking[]` | array | no | Only the current step is used on the card; full list on details |
| `counts` | object | yes | Drives the tab badges — **totals across all pages**, not page counts |
| `pagination` | object | yes | `has_more` / `has_next`, or `current_page` + `total_pages` |

**Errors:** `401` unauthenticated → `{status: false, message: "..."}`. An empty list is a success
with `items: []`, not an error.

> **Ask:** please keep `counts` on **every** page of the response, not just page 1 — the client
> refreshes badges from whatever page it last loaded.

---

## 2. Order details — NEW

```
GET api/app/orders/{id}
```

| Param | Type | Required | Notes |
|---|---|---|---|
| `id` | int | yes | Path segment |

Returns the same order object as the list, but **complete**: every line item, the full tracking
timeline, the totals breakdown, and the shipping address.

**200 — success**

```json
{
  "status": true,
  "message": "",
  "data": {
    "id": 8492,
    "order_number": "DW-8492",
    "status": 2,
    "status_text": "جاري التجهيز",
    "status_group": 1,
    "created_at": "2026-08-16 14:22:00",
    "items_count": 3,
    "subtotal": "1,045.00",
    "shipping": "25.00",
    "discount": "0",
    "total": "1,070.00",
    "currency": "ر.س",
    "payment_method": "بطاقة مدى",
    "shipping_address": "الرياض - حي النرجس - شارع الأمير سلطان، مبنى 12",
    "can_cancel": true,
    "items": [
      {
        "id": 1,
        "product_id": 102,
        "name": "كرة قدم Adidas Al Rihla",
        "image": "https://.../ball.jpg",
        "quantity": 2,
        "price": "180.00",
        "variant": "أزرق · L"
      }
    ],
    "tracking": [
      { "key": "placed",           "title": "تم استلام الطلب", "date": "2026-08-14 10:12", "is_done": true,  "is_current": false },
      { "key": "processing",       "title": "جاري التجهيز",     "date": "2026-08-14 15:40", "is_done": false, "is_current": true  },
      { "key": "shipped",          "title": "تم الشحن",         "date": null,               "is_done": false, "is_current": false },
      { "key": "out_for_delivery", "title": "خرج للتوصيل",      "date": null,               "is_done": false, "is_current": false },
      { "key": "delivered",        "title": "تم التسليم",       "date": null,               "is_done": false, "is_current": false }
    ]
  }
}
```

`{ "data": { "order": { ... } } }` is also accepted if that's more natural on your side.

| Field | Type | Required | Notes |
|---|---|---|---|
| `payment_method` | string | no | **Localized**; row hidden when absent |
| `shipping_address` | string | no | One pre-formatted line; section hidden when absent |
| `items[].variant` | string | no | Size / colour, pre-formatted (`"أزرق · L"`) |
| `items[].price` | string | yes | **Unit** price — the client renders `qty × price` |
| `tracking[].key` | string | yes | Picks the icon; unknown keys get a neutral dot |
| `tracking[].title` | string | yes | **Localized** — this is what's rendered, never the key |
| `tracking[].date` | string / null | no | `null` for steps that haven't happened yet |
| `tracking[].is_done` | bool | yes | Past steps — drawn filled with a solid connector |
| `tracking[].is_current` | bool | yes | Exactly **one** step at most; drawn as an outlined ring |

**Errors:** `404` when the order doesn't exist or belongs to another user.

> **Tracking is server-driven by design.** The client renders whatever array you send, in order, and
> assumes nothing about its length. You can add, rename, reorder, or drop steps — including
> per-shipping-provider timelines — without an app release. For a **cancelled** order, end the
> timeline on a step titled "تم إلغاء الطلب" with `is_current: true`; the client paints the active
> step red instead of green when `status_group == 3`.

---

## 3. Cancel an order — NEW

```
POST api/app/orders/{id}/cancel
```

No body.

**200 — success**

```json
{ "status": true, "message": "تم إلغاء الطلب بنجاح", "data": null }
```

The client shows `message` as a success toast (falling back to its own copy if empty), drops the
order from the current tab, and bumps the tab badges.

**Errors:** must fail with `status: false` and a localized `message` when the order is no longer
cancellable (already shipped / delivered / cancelled) — the client relies on this rather than
re-checking the rules. `can_cancel` in the payload is the primary gate; this is the race guard.

---

## 4. Checkout — CHANGE REQUESTED

```
POST api/app/cart/checkout
```

Today this returns only a message:

```json
{ "status": true, "message": "تم الطلب بنجاح" }
```

Please add the created order to `data`:

```json
{
  "status": true,
  "message": "تم الطلب بنجاح",
  "data": { "order_id": 8492, "order_number": "DW-8492" }
}
```

| Field | Type | Required | Notes |
|---|---|---|---|
| `order_id` | int | yes | Deep-link target for **"تتبع الطلب"** |
| `order_number` | string | yes | Interpolated into the success message |

> **This is the one blocking ask.** Without `order_id` the success modal can't open the order the
> user just placed — it falls back to the orders list, and the confirmation text drops the order
> number entirely (it used to be hardcoded as `#DW-8492`, which was wrong for every real order).
> Both fields are read defensively, so shipping them is a pure improvement with no app release.

---

## Status enum

Please fix and document these values; the client hardcodes them.

**`status_group`** — the tab filter, also sent as the `status` query param:

| Value | Meaning | Tab |
|---|---|---|
| `1` | In flight | الحالية |
| `2` | Delivered | تم التسليم |
| `3` | Cancelled | ملغية |

**`status`** — granular, shown via `status_text`. Suggested set (tell us if yours differs):

| Value | Meaning | Group |
|---|---|---|
| `1` | Received / under review | 1 |
| `2` | Processing | 1 |
| `3` | Shipped | 1 |
| `4` | Out for delivery | 1 |
| `5` | Delivered | 2 |
| `6` | Cancelled | 3 |

The client only ever branches on `status_group`; `status` is passed through for display and future
use, so adding values there is safe.

## Client-side summary

| UI element | Data source |
|---|---|
| Tab labels | Local translations (`myOrdersTab*`) |
| Tab count badges | `data.counts.{current,delivered,cancelled}` |
| Card title | `order_number` |
| Card status pill | `status_text`, coloured by `status_group` |
| Card thumbnails | First 3 of `items[].image`, then a `+N` tile |
| Card highlight strip | The `tracking[]` entry with `is_current: true` |
| Card / details total | `total` + `currency` |
| Cancel button | Rendered only when `can_cancel == true` |
| Details timeline | `tracking[]`, rendered in array order |
| Details totals rows | `subtotal`, `shipping`, `discount` (row hidden when `0`), `total` |
| Details address | `shipping_address` (section hidden when absent) |
| Pull-to-refresh / infinite scroll | `page` + `limit` + `pagination` |
| "تتبع الطلب" on checkout | `data.order_id` from `cart/checkout` |

**Offline / failure behaviour:** there is no bundled fallback for orders — a failed list request
shows an error state with a retry button, and a failed details request shows the same. This is
deliberate: stale order state is worse than no order state.
