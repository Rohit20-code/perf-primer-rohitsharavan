# P2 – Self-check

## 1. HTTP (P2.1)

**Split `https://localhost:5001/api/catalog-items?pageSize=10` into its parts and say what each one does.**

- `https`: the scheme. Talk HTTP over an encrypted connection.
- `localhost`: the host. The server is my own machine.
- `5001`: the port the app is listening on (not the usual 443).
- `/api/catalog-items`: the path. The catalog items resource in the API.
- `?pageSize=10`: the query string. One option, `pageSize=10`, meaning give me 10 items per page.

## 2. Postman (P2.2)

**A request returns 200 OK but the body says `{"error":"not found"}`. Did it pass? What would you check to decide?**

I wouldn't call it a pass just because of the 200. The status only says the server answered; the body says it couldn't find what I asked for. I'd look at the body: is there an `error` field, and is the data I expected actually there (right id, right fields)? I'd also check the `Content-Type` is what I expected. Then I'd add an assertion on the body, not just the status, so this kind of response gets counted as a failure.

## 3. Sessions and tokens (P2.3)

**You log in once and the next request is still recognised. Name two ways the server could know it is you.**

1. **Session cookie.** At login the server sets a cookie with a session ID, and the browser automatically sends it back on every request. The server looks it up.
2. **Bearer token / JWT.** At login the server gives me a token, and my client adds `Authorization: Bearer <token>` to every request. The server checks the signature and knows who I am.
