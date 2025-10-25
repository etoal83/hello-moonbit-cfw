# hello-moonbit-cfw

A Cloudflare Workers application written in [MoonBit](https://www.moonbitlang.com/), demonstrating how to compile MoonBit code to JavaScript and run it on Cloudflare's edge network.

## Overview

This project showcases the integration of MoonBit language with Cloudflare Workers. MoonBit functions are compiled to JavaScript and invoked by the Worker's fetch handler to respond to HTTP requests.

## Quick Start

```bash
# Install dependencies
npm install

# Start local development server
npm run dev

# Deploy to Cloudflare Workers
npm run deploy
```

## Development

### MoonBit Commands
- `moon build` - Compile MoonBit code to JavaScript
- `moon test` - Run MoonBit tests
- `moon test --update` - Update test snapshots

### JavaScript Commands
- `npm test` - Run Vitest tests in Workers environment

## Architecture

- **MoonBit Library** (`hello.mbt`) - Core logic written in MoonBit, exported to JavaScript
- **Worker Entry** (`index.js`) - Cloudflare Workers fetch handler that imports compiled MoonBit functions
- **Build Output** (`target/js/release/build/`) - JavaScript files generated from MoonBit compilation

## License

Apache-2.0