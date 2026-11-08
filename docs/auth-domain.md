# Auth domain and fake data (Task 1)

**Why**: the UI depends only on `AuthRepository` (`domain/repositories`), so the fake implementation can be replaced by a real API without touching screens.

- `AuthRepository`: `requestOtp`, `verifyOtp`, `completeRegistration`, `startSession`, `restoreSession`, `signOut`. All return `Result<T>` with typed `Failure`s (`AuthFailure.reason`: `userNotFound`, `invalidCode`).
- Use cases (`domain/use_cases/auth_use_cases.dart`): `RequestOtp`, `VerifyOtp`, `CompleteRegistration` validate input with the pure validators first, so invalid input never reaches the repository (`InvalidInputFailure`).
- `FakeAuthRepository` (`data/`): ~1s latency (`fakeAuthLatency`), accounts as JSON in a `KeyValueStore`, fake OTP `123456` (`fakeOtpCode`). Storage errors become `StorageFailure`.
- `KeyValueStore` (`core/storage`): `SecureKeyValueStore` (flutter_secure_storage) in production, `InMemoryKeyValueStore` in tests.

## Flow decisions
- Registration is two-phase: `completeRegistration` saves the account but does **not** start a session. The Welcome screen's "Let's explore" calls `startSession`. Reason: the redirect guard sends logged-in users away from auth routes, which would skip Welcome if the session started at the date-of-birth step.
- Login for an unknown number fails at `requestOtp` (`userNotFound`) so the phone screen can show the inline "register" link.
- Registering an existing number overwrites that account instead of failing, so the same flow can be repeated (e.g. the airplane-mode recording).
- Wrong-OTP counting and the 3-strike lock live in presentation state, not here: the repository only judges the code.
