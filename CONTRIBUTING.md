# Contributing

Thanks for helping with the Macaffeine website!

## Branches

- `dev` is where work happens. **Open pull requests against `dev`.** Every push to `dev` gets a preview deployment.
- `main` is what's live on macaffeine.app.

## Ground rules

The site has to stay fast and simple:

- No frameworks, bundlers or web fonts.
- No third-party scripts, analytics, embeds or CDNs — everything is served from our own domain.
- Images in AVIF/WebP with explicit width and height.
- The Lighthouse check on pull requests has to stay at 100 in every category.

## Working locally

```sh
python3 -m http.server 8080 -d public
```

## Commits

Small commits, one change each, with a short imperative subject: `Fix contrast of the download button`. Add a line to `CHANGELOG.md` under `[Unreleased]` for visible changes.

## License

By contributing you agree that your work is released under the [MIT License](LICENSE).
