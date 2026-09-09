# qTower Element Bridge client

This fork changes only how Element presents three encryption trust states for
qTower's exclusive bridge ghost namespaces. `UNSIGNED_DEVICE`,
`MISMATCHED_SENDER`, and `AUTHENTICITY_NOT_GUARANTEED` events from `line_*`,
`discord_*`, `whatsapp_*`, and `gmessages_*` users on
`matrix.q.davafons.cc` receive a neutral icon and an explicit local-bridge
explanation.

The Matrix cryptographic result is not changed or promoted. Every other sender
and warning reason retains Element's standard presentation.

Build the parallel macOS application with:

```bash
davafons/build-macos
```

Use `apps/desktop/dist/mac-arm64/Element Bridge.app`. The generated DMG and ZIP
precede the final local ad-hoc signature. Official updates are disabled because
they would replace this fork's behavior.

Run the focused test with:

```bash
cd apps/web
NODE_OPTIONS=--localstorage-file=/tmp/element-bridge-vitest-localstorage \
  npx --yes pnpm@11.22.0 test:vitest -- \
  src/viewmodels/room/timeline/event-tile/EventTileE2eViewModel.test.ts
```
