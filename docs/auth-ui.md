# Auth UI (Task 1 screens)

**Why**: login and registration share one flow state so the back arrow keeps what was typed and every step guards against double submission.

- `RegistrationFlow` (keepAlive notifier, `presentation/providers/registration_flow.dart`): holds raw field text, `intent` (login/register), `isBusy`, `wrongOtpCount`. Actions (`submitPhone`, `submitOtp`, `resendOtp`, `submitProfile`, `startExploring`) ignore calls while busy, so a double tap sends one request. Wrong-code counting and the 3-strike lock live here; `OtpSubmitOutcome` tells the screen what to do.
- Screens: Onboarding, Phone (1/4), OTP (2/4), Name (3/4), Date of birth (4/4), Welcome, Splash. Steps `push` so back restores state; DOB uses `go(welcome)` so back cannot return to a finished step.
- Login ends in `SessionNotifier.signIn`; the redirect guard moves to Home. Registration ends at Welcome, where "Let's explore" starts the session ([auth-domain.md](auth-domain.md)).
- OTP input is one hidden numeric `TextField` behind six display boxes (paste, backspace, SMS autofill handled by a real input). Wrong code: boxes shake and clear, message under the boxes. Resend is available at 0:00, or immediately when locked.
- Errors show after the field first loses focus (`AppTextField`), never while typing. Phone "not registered" shows an inline message with a Register link that switches the flow to register.
- Shared widgets in `core/presentation/widgets/`: `PrimaryButton` (press scale, morphs to a spinner while loading), `AppTextField` (animated focus/error border), `PressScale`, `RoundBackButton`, `AuthBackground`, `DonutArt`, placeholder sheet for Google/Apple/Facebook/Terms/Privacy.
- `StepProgressRing` sweeps from the previous step's fill to the current one (25 -> 100%) and morphs into a check at 100%.
- Transitions: `stepPage` (shared-axis slide) for steps, `fadePage` for splash/welcome. Durations from `AppMotion`, which honours Reduce Motion.

Known gaps: illustration is a painted donut until bundled art is added; social icons use plain glyphs (no brand assets); font is the platform default pending a brand font.
Tests: `test/features/auth/presentation/auth_flow_test.dart` (widget tests through the real router).
