# P2.1 – How the Web Works and HTTP

From the MDN pages: Overview of HTTP, HTTP request methods, and HTTP response status codes.

## 1. Client and server

The web is basically one side asking and the other side answering.

- The **client** sends the request. Usually that's a browser, but it can be Postman, curl, a mobile app, or JMeter.
- The **server** receives the request, does some work (reads a database, runs some logic) and sends back a response.

The client always speaks first. A server never just sends you something out of nowhere; it only answers.

Example: I type `https://jsonplaceholder.typicode.com/posts/1` into the browser. The browser (client) asks the server for post 1, and the server answers with that post as JSON.

## 2. The parts of a URL

Taking `https://shop.example.com:8443/api/products?category=books&page=2`:

| Part | In the example | What it does |
|---|---|---|
| **Scheme** | `https` | Which protocol to use. `https` is HTTP with encryption (TLS); `http` is unencrypted. |
| **Host** | `shop.example.com` | Which server to talk to. DNS turns the name into an IP address. |
| **Port** | `8443` | Which "door" on that server. If you leave it out, it's 443 for https and 80 for http. |
| **Path** | `/api/products` | Which resource on the server you want. |
| **Query string** | `?category=books&page=2` | Extra options as `key=value` pairs. Starts with `?`, pairs are joined with `&`. Often used for filtering, searching and paging. |

## 3. What a request and a response look like

**A request has three parts:**
- **Method:** what I want to do (`GET`, `POST`, …).
- **Headers:** extra info as `Name: value` lines, like what format I'm sending (`Content-Type`), what I accept back (`Accept`), and who I am (`Authorization`, `Cookie`).
- **Body:** the data I'm sending. A GET usually has none; a POST or PUT usually carries JSON.

```
POST /posts HTTP/1.1
Host: jsonplaceholder.typicode.com
Content-Type: application/json

{"title": "perf primer", "body": "my first POST", "userId": 1}
```

**A response also has three parts:**
- **Status:** a number and short text saying how it went (`201 Created`).
- **Headers:** info about the response, like `Content-Type`, `Cache-Control`, `Location`, and `Set-Cookie`.
- **Body:** the actual content (JSON, HTML, an image…).

```
HTTP/1.1 201 Created
Content-Type: application/json; charset=utf-8
Location: https://jsonplaceholder.typicode.com/posts/101

{"title": "perf primer", "body": "my first POST", "userId": 1, "id": 101}
```

## 4. GET vs POST vs PUT vs DELETE

| Method | Means | Example | Body? |
|---|---|---|---|
| **GET** | Read something | `GET /posts/1` → give me post 1 | No |
| **POST** | Create something new | `POST /posts` with JSON → make a new post (server picks the id) | Yes |
| **PUT** | Replace something that exists | `PUT /posts/1` with JSON → overwrite post 1 with this | Yes |
| **DELETE** | Remove something | `DELETE /posts/1` → delete post 1 | No |

Two words from MDN worth remembering:
- **Safe:** the request doesn't change anything on the server. GET is safe; the other three aren't.
- **Idempotent:** sending it once or ten times leaves the server in the same state. GET, PUT and DELETE are idempotent. POST isn't: ten POSTs can create ten records.

This matters for load testing. Hammering a GET is harmless, but a load test full of POSTs fills the database with test data.

## 5. Status codes: the five classes

The first digit tells you the category:

| Class | Meaning | Two examples |
|---|---|---|
| **1xx Informational** | "Got it, carry on" | `100 Continue`, `101 Switching Protocols` (e.g. upgrading to WebSocket) |
| **2xx Success** | It worked | `200 OK` (here's what you asked for), `201 Created` (new thing made) |
| **3xx Redirection** | Look somewhere else | `301 Moved Permanently` (the URL changed for good), `302 Found` (temporary redirect) |
| **4xx Client error** | You did something wrong | `404 Not Found` (no such resource), `401 Unauthorized` (you're not logged in) |
| **5xx Server error** | The server messed up | `500 Internal Server Error` (code crashed), `503 Service Unavailable` (overloaded or down) |

Others I'll see a lot: `204 No Content`, `400 Bad Request`, `403 Forbidden` (logged in but not allowed), `429 Too Many Requests` (rate limited), `502 Bad Gateway` and `504 Gateway Timeout`.

In load tests, 5xx errors (especially 503 and 504) creeping up as users increase are a classic sign the server is struggling.

## 6. JSON, and how it differs from HTML

**JSON** (JavaScript Object Notation) is a text format for **data**: objects in `{}`, lists in `[]`, `"key": value` pairs, with strings, numbers, true/false, and null.

```json
{ "id": 1, "title": "hello", "tags": ["news", "tech"], "published": true }
```

**HTML** is a text format for **pages**: tags like `<h1>`, `<p>` and `<button>` that a browser turns into something you see.

```html
<h1>hello</h1><p>Tags: news, tech</p>
```

The difference in one line: HTML is meant to be **shown to people**, and JSON is meant to be **read by programs**. APIs return JSON (`Content-Type: application/json`); websites return HTML (`Content-Type: text/html`). In a load test I'll mostly be sending and checking JSON.

## 7. Why HTTP is called stateless

Every request stands completely on its own. The server doesn't automatically remember anything about my previous request. Request #2 has no built-in idea that request #1 came from the same person.

Example: I log in with one request. On the next request, HTTP itself has no idea I just logged in. So to "remember" me, the client has to send something with every request that identifies me, usually a **cookie** (session ID) or a **token** in the `Authorization` header. That's what P2.3 is about.

For load testing this means each virtual user has to carry its own cookie or token. Otherwise, after the login step, every request after it looks like an anonymous stranger.

## Self-check

**Split `https://localhost:5001/api/catalog-items?pageSize=10` into its parts and say what each one does.**

- `https`: scheme. Use HTTP over an encrypted TLS connection.
- `localhost`: host. The server is on my own machine (127.0.0.1).
- `5001`: port. The app is listening on port 5001 rather than the default 443.
- `/api/catalog-items`: path. The catalog items resource of the API.
- `?pageSize=10`: query string. One parameter, `pageSize` with value `10`, asking for 10 items per page.
