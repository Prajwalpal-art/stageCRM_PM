# UI automation test plan

## Scope and maintenance

This catalog covers the Robot Framework tests discovered under `testcases/` on
2026-10-23: 33 tests in three suites. The descriptions below capture the
intended scenario and expected behavior from the test names and keyword flows;
they are not a substitute for assertions in the test code.

Update this catalog whenever tests are added, removed, or materially changed:

1. Run `robotcode discover tests testcases` and reconcile the case list below.
2. Review the corresponding test and keyword code for the intended behavior.
3. Run the relevant tests in an authorized staging environment, then record
   the result and date in the execution record.
4. Record confirmed failures using [the bug report template](./BUG-REPORT-TEMPLATE.md).

Many tests perform UI actions without asserting the resulting application state.
A Robot Framework `PASS` therefore means only that the recorded steps completed
without a failure; it does not prove every expected behavior below unless the
test contains a corresponding assertion.

## Running tests safely

These are browser-driven tests against the staging CRM. Tenant and user flows
can create persistent records. Run them only with an authorized test account
and disposable test data in a non-production environment. The tenant tests also
refer to local upload files; configure valid fixture paths on the machine
running the suite before execution.

From the repository root, the existing full-suite command is:

```text
robot -d results testcases
```

This is also what `infra/AllTC.bat` runs. To discover the current test names and
static diagnostics, use:

```text
robotcode discover tests testcases
robotcode analyze code testcases keywords
```

For a single case, select the discovered long name rather than passing an
individual `.robot` file:

```text
robotcode robot -bl "Testcases.Tenant-management2.Verify User Credits field is mandatory" testcases
```

## Test catalog

### Branch management

| Test case | Coverage and expected behavior | Latest saved result |
|---|---|---|
| `Verify User Able To Login` | User authentication; valid credentials should open the CRM. | Not in latest saved run |

### Tenant management

| Test case | Coverage and expected behavior | Latest saved result |
|---|---|---|
| `Verify Admin Able To Create Manual Tenant` | Manual tenant onboarding, company documents, owner details, conduct check, identity documents, and tenant credits; the flow should reach the final credit/agreement step. | Not in latest saved run |
| `Verify That Tenant Is Able To Create With Invite Method Licensed Type` | Invite onboarding with the licensed subscription; invitation should be submitted with the requested credits and duration. | Not in latest saved run |
| `Verify That tenant Is Able To Create With Invite Method With Free Trial` | Invite onboarding with the free-trial option; invitation should be submitted without licensed-credit setup. | Not in latest saved run |
| `User Able To Create Both Free Trial And Licensed Tenants` | Create one licensed and one free-trial invite in the same session; both flows should complete. | Not in latest saved run |
| `Whole Tenant Creation Flow Including Manual Creation And Invite Creation` | End-to-end manual onboarding and invite onboarding; each flow should reach its final submission step. | Not in latest saved run |
| `Verify Company Name Accepts Valid Input` | Valid company-name input; the form should accept the name and allow progression. | Not in latest saved run |
| `Verify Company Name cannot be left blank` | Required company-name validation; an empty name should be rejected and progression blocked. | Not in latest saved run |
| `Verify that the Email field is mandatory and appropriate validation is displayed when no value is entered.` | Required company email validation; an empty email should show validation and block progression. | Not in latest saved run |
| `verify the maximum character limit for the Company Name field` | Company-name length boundary; input beyond the supported limit should be constrained or rejected according to the product rule. The exact limit is not specified by this test. | Not in latest saved run |
| ` verify that the First Name field accepts valid alphabetic characters` | First-name acceptance; valid alphabetic input should be accepted through the owner-details step. | Not in latest saved run |
| `Verify that the First Name field is mandatory` | Required first-name validation; an empty first name should be rejected. | Not in latest saved run |
| `Verify that the Company Name field accepts permitted special characters` | Company-name character policy; the field should accept only the special characters permitted by the product rule. | Not in latest saved run |
| `Verify that numeric characters are not allowed in the First Name field` | First-name validation; a name containing digits should be rejected or show validation. | Not in latest saved run |
| `Verify that the Last Name field is mandatory` | Required last-name validation; an empty last name should be rejected. | Not in latest saved run |
| `Verify that a valid mobile number with the India country code is accepted` | International mobile input; a valid Indian number and country code should be accepted. | Not in latest saved run |
| `Verify Mobile Number Mandatory Validation in Licensed Tenant Creation` | Required mobile validation in the licensed tenant flow; an empty number should be rejected. | Not in latest saved run |
| `Verify Invalid Mobile Number Format Validation in Licensed Tenant Creation` | Mobile-format validation in the licensed tenant flow; an invalid short number should be rejected. | Not in latest saved run |
| `Verify Valid Email Format Acceptance in Licensed Tenant Creation` | Email-format acceptance in the licensed tenant flow; a valid email address should be accepted. | Not in latest saved run |
| `Verify Email Mandatory Validation in Licensed Tenant Creation` | Required email validation in the licensed tenant flow; an empty email should be rejected. | Not in latest saved run |
| `Verify Invalid Email Format Validation in Licensed Tenant Creation` | Email-format validation in the licensed tenant flow; a malformed email should be rejected. | Not in latest saved run |
| `Verify Duplicate Email Validation in Licensed Tenant Creation` | Duplicate-email validation; an already registered email should be rejected with appropriate feedback. | Not in latest saved run |
| `Verify Licensed Subscription Selection in Licensed Tenant Creation` | Licensed subscription selection; the licensed option should become selected. | Not in latest saved run |
| `Verify Free Trial Deselection When Licensed Subscription is Selected` | Subscription exclusivity; selecting licensed should deselect free trial. | Not in latest saved run |
| `Verify Valid User Credits Entry in Licensed Tenant Creation` | Valid credit entry; `10` should be retained and should not produce the out-of-range validation message. | Not in latest saved run |
| `Verify User Credits field is mandatory` | Required user-credit validation; submitting without credits should display the missing-credit validation. | PASS (2026-10-23) |

### User management

| Test case | Coverage and expected behavior | Latest saved result |
|---|---|---|
| `Verify User Able To login` | User authentication; valid credentials should open the CRM. | Not in latest saved run |
| `User Able To Log Out` | Logout; the user should be signed out of the CRM. | Not in latest saved run |
| `User Able To View Profile` | Profile navigation; the signed-in user should be able to open the profile view. | Not in latest saved run |
| `Verify Admin Able To Create User For General Management Role` | Admin user creation for the General Management role; the user should be created and the flow should return cleanly. | Not in latest saved run |
| `Verify Admin Able To Search User` | User search; the target user should be discoverable in the results. | Not in latest saved run |
| `Verify Admin Able To View User Details` | User-detail navigation; the selected user's details should be displayed. | Not in latest saved run |
| `Verify And Validate That Admin Able To Export User Details` | User export; an export file should be downloaded and opened successfully. | Not in latest saved run |

## Execution record

The most recent saved run is [`results/output.xml`](../../results/output.xml):
1 test passed, 0 failed, and 0 skipped on 2026-10-23. It covers only
`Verify User Credits field is mandatory`; the other 32 discovered cases are not
represented in that run.

Static analysis of the six Robot files found 0 errors, 0 warnings, and 22
hints. The hints report variables redefined between keyword resources; they
are not execution failures.

The root [`output.xml`](../../output.xml) is a historical run from 2026-05-14
for `testcases/tenant-management.robot`, a file not present in the current
discovered suite. It records five automation failures and is not evidence that
any of the current 33 tests failed. The observations are preserved separately
in [BUG-REPORTS.md](./BUG-REPORTS.md), marked historical and untriaged.
