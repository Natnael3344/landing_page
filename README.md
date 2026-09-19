# webapp — Flutter Landing Page

A single-screen, responsive marketing landing page built with **Flutter Web**. The
Dart package is named `webapp`; it was built as a practice project while following
a Flutter Web tutorial on building responsive layouts, and it is deployed as a
static site to GitHub Pages from the `docs/` folder.

The page renders a fictional brand called **"Advid Technologies"** and swaps its
entire layout and copy depending on viewport width:

- **Large screens (> 800px):** a nav bar plus a hero section reading "Online
  Library Management System" next to an illustration (`assets/book.png`) and an
  email sign-up field.
- **Small screens (≤ 800px):** a stacked, mobile-friendly layout with a
  "Mingalarbar!" greeting, a cat illustration (`assets/cat-lady.png`), and the
  same email sign-up field.

There is no backend — the "Notify" button next to the email field is present in
the UI but its `onTap` handler is empty, so submitting the form does nothing.
This is a front-end/UI layout exercise rather than a functioning product.

## Features (verified in code)

- Responsive layout switch between a "large" and "small" view via
  `lib/utils/responsiveLayout.dart`, which checks `MediaQuery` width against an
  800px breakpoint.
- Custom nav bar (`lib/widgets/navbar.dart`) with a gradient "Advid
  Technologies" logo badge and text links: Products, Solutions, Customers,
  Resources, Login (links are static text, not routed to anything).
- On small screens the nav bar collapses to a hamburger icon
  (`assets/icons8-menu.png`); it is decorative and does not open a menu.
- Email capture UI (`lib/widgets/search.dart`) — a rounded text field with the
  hint "Your Email Address" — paired with a "Notify" call-to-action button
  (`lib/widgets/sendbtn.dart`) that has a paper-plane icon
  (`assets/icons8-paper_plane.png`). The button is not wired to any submit
  logic or API.
- Custom illustrations and icons under `assets/` (book, cat, paper-plane,
  menu icons — via icons8 and freepik, credited in `lib/main.dart` and the
  original README).
- Pre-built static output checked into `docs/` (the output of
  `flutter build web`) so GitHub Pages can serve the site directly from the
  `master` branch's `docs/` folder.

## Tech stack

From `pubspec.yaml`:

- **Flutter** (SDK dependency, targets the Flutter Web renderer)
- **Dart** SDK constraint `>=2.7.0 <3.0.0` (pre-null-safety Dart; the project
  predates Dart's sound null-safety migration)
- [`cupertino_icons`](https://pub.dev/packages/cupertino_icons) `^0.1.3`
- `flutter_test` (dev dependency, SDK-bundled)

No HTTP client, state-management, or backend package is declared or used
anywhere in `lib/` — the app is entirely static UI.

## Project structure

```
lib/
  main.dart                    # App entry point, HomePage, LargeChild/SmallChild layouts
  utils/
    responsiveLayout.dart      # Breakpoint helper widget (small/medium/large)
  widgets/
    navbar.dart                # Top nav bar with brand badge + nav links
    search.dart                # Email input + SendBtn row
    sendbtn.dart                # "Notify" gradient button
assets/                        # Images used by the widgets above
web/                           # Flutter web scaffold (index.html, manifest, icons)
docs/                          # Pre-built `flutter build web` output, served by GitHub Pages
android/, ios/                 # Default Flutter platform scaffolding (not the deployment target)
test/
  widget_test.dart             # Default Flutter counter-app smoke test (stale, does not match this app — see GUIDE.md)
```

## Getting started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) with web support
  enabled (`flutter config --enable-web`)

### Install dependencies

```bash
flutter pub get
```

### Run locally (web)

```bash
flutter run -d chrome
```

### Build for production

```bash
flutter build web
```

The build output is written to `build/web/`. To publish an update to GitHub
Pages, copy the contents of `build/web/` into `docs/` (overwriting the
existing files) and commit, since GitHub Pages is configured to serve from
`master` → `/docs`.

See `GUIDE.md` for more detail on the deployment workflow and known rough
edges in this project.
