# Auth validation (Task 1)

Pure functions in `lib/features/auth/domain/validators/`, no Flutter imports, one file per field.
Each returns `null` when valid, otherwise a per-field enum error (with `isX` getters). Presentation maps the enum to an l10n message, so the domain never holds UI text.

| Field | Rule | Notes |
|---|---|---|
| Phone | after `+95`: strip spaces/dashes and one leading 0; result = `9` + 7-9 digits | `toE164('09254135592') == '+959254135592'` |
| OTP | exactly 6 digits | correctness (`123456`) is decided by the repository, not the validator. 3 wrong attempts lock until Resend (`maxOtpAttempts`). `sanitizeOtpPaste` fills all 6 boxes. |
| First name | required, 1-50 chars after trim, letters/marks/spaces only | Myanmar script allowed via `\p{L}\p{M}`; digits and punctuation rejected |
| Last name | optional, same character rules | many Myanmar names have no family name |
| Date of birth | real calendar date, not in the future, age >= `minimumRegistrationAge` (13) | `now` is injected for deterministic tests; `DateTime` rolls 31 Apr to 1 May, so parts are compared back |

Tests: `test/features/auth/domain/validators/` (one test file per validator).
