import { hello } from './target/js/release/build/hello.js';

export default {
  async fetch(request, env, ctx) {
    return new Response(hello(), {
      headers: { 'content-type': 'text/plain' },
    });
  }
}