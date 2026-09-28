# macaffeine.app

The website for [Macaffeine](https://github.com/devopscodepro/macaffeine) — a tiny, native macOS menu bar utility that keeps your Mac awake while you're away.

**Live:** [macaffeine.app](https://macaffeine.app)

## What's inside

A single static page: plain HTML and CSS, no framework, no build step, no web fonts and no third-party requests. The goal is a fast page with a perfect Lighthouse score.

```
public/          everything that gets deployed
  index.html
  assets/        images, icons, styles
  _headers       caching and security headers for Cloudflare Pages
```

## Run it locally

```sh
python3 -m http.server 8080 -d public
```

Then open http://localhost:8080.

## Deploy

GitHub Actions publishes `public/` to Cloudflare Pages: `main` goes to macaffeine.app, `dev` to a preview URL. Every push is also checked with Lighthouse.

## Contributing

Typos, better wording and translations are welcome — see [CONTRIBUTING.md](CONTRIBUTING.md). Ideas about the app itself belong in the [app repository](https://github.com/devopscodepro/macaffeine/discussions).

## License

[MIT](LICENSE) © 2026 Aleksei Popov
