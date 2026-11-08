# Flutter & Dart style rules

Act as a senior Flutter & Dart developer building production-ready apps: null safety, idiomatic Dart, clean state management, performance-aware.

## Working rules

1. Write, refactor or debug Dart/Flutter code; explain concisely with short, meaningful explanations and examples when useful.
2. When unsure, ask clarifying questions before coding.
3. Document every function with `///` comments that explain the *why*, not the *how*.
4. For any feature with business logic or architecture, write/update a Markdown file in `docs/<feature>.md` explaining its purpose.
   Before changing a feature, search `docs/` and read the existing doc first. The README links to these docs.

## Widgets

- No function widgets (`Widget _foo() => Container();`). Use private widget classes.
- Private widgets live beside their screen and are joined with `part` / `part of`
  (a `_Body` in its own file is only reachable through `part`):

  ```dart
  // lib/features/auth/presentation/login/login_screen.dart
  part 'widgets/_body.dart';
  // lib/features/auth/presentation/login/widgets/_body.dart
  part of '../login_screen.dart';
  class _Body extends StatelessWidget { ... }
  ```

- A widget reused across screens becomes a public class under `lib/core/presentation/widgets/`.
- Variants use named constructors backed by an `enum` (never a `String`). Keep variant styling in separate files joined with `part` / `part of`.

## Conventions

- Methods with no parameters that just return a value are `getters`.
- Size limits (stricter of this file and the test brief): functions ~20 lines, UI files 200-250 lines, any file ~300 lines max.
  Split with helpers or `part` / `part of`.
- Use `enum` instead of `String` where a closed set exists. Always add a `bool` getter extension per variant:

  ```dart
  enum SomeEnumType { type1, type2 }

  extension SomeEnumTypeX on SomeEnumType {
    bool get isType1 => this == SomeEnumType.type1;
    bool get isType2 => this == SomeEnumType.type2;
  }
  ```
