/**
 * Cloudflare Edge Worker for 52etf.net — "Markdown for Agents" Content Negotiation
 *
 * Implements Cloudflare's Agent-Friendly Web Standard:
 * 1. If a client or AI agent sends `Accept: text/markdown` (or `?format=md`) on any page URL
 *    (e.g. `https://52etf.net/` or `https://52etf.net/05-crypto/crypto-hyperliquid-onchain-long-short/`),
 *    automatically serves the pre-rendered Markdown twin (`.../index.md`) with:
 *      - `Content-Type: text/markdown; charset=utf-8`
 *      - `Content-Signal: search=yes, ai-input=yes, ai-train=no`
 *      - `X-Markdown-Tokens`: estimated token count (~chars / 4)
 *      - `Vary: Accept`
 * 2. Adds Link & Content-Signal discovery headers and CORS (`Access-Control-Allow-Origin: *`)
 *    to all responses so browser WebMCP and external MCP clients can fetch seamlessly.
 */

export default {
  async fetch(request) {
    const url = new URL(request.url);
    const accept = request.headers.get("Accept") || "";
    const wantsMarkdown =
      accept.includes("text/markdown") ||
      url.searchParams.get("format") === "md" ||
      url.searchParams.get("format") === "markdown";

    if (request.method === "OPTIONS") {
      return new Response(null, {
        status: 204,
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "GET, HEAD, OPTIONS",
          "Access-Control-Allow-Headers": "Accept, Content-Type",
        },
      });
    }

    let targetUrl = new URL(request.url);
    const isHtmlRoute =
      targetUrl.pathname.endsWith("/") ||
      !targetUrl.pathname.split("/").pop().includes(".");

    if (wantsMarkdown && isHtmlRoute) {
      const mdPath = targetUrl.pathname.endsWith("/")
        ? `${targetUrl.pathname}index.md`
        : `${targetUrl.pathname}/index.md`;
      targetUrl.pathname = mdPath;
    }

    const upstreamResp = await fetch(targetUrl.toString(), request);
    const headers = new Headers(upstreamResp.headers);

    headers.set("Content-Signal", "search=yes, ai-input=yes, ai-train=no");
    headers.set("Access-Control-Allow-Origin", "*");
    headers.set("Vary", "Accept");
    headers.set(
      "Link",
      '</llms.txt>; rel="llms-txt", </llms-full.txt>; rel="alternate"; type="text/plain", </index.json>; rel="alternate"; type="application/json", </.well-known/mcp.json>; rel="service-desc", </.well-known/agent.json>; rel="agent-card"'
    );

    if (wantsMarkdown && isHtmlRoute && upstreamResp.ok) {
      const bodyText = await upstreamResp.text();
      const approxTokens = Math.max(1, Math.ceil(bodyText.length / 4));
      headers.set("Content-Type", "text/markdown; charset=utf-8");
      headers.set("X-Markdown-Tokens", String(approxTokens));
      return new Response(bodyText, {
        status: upstreamResp.status,
        headers,
      });
    }

    return new Response(upstreamResp.body, {
      status: upstreamResp.status,
      headers,
    });
  },
};
