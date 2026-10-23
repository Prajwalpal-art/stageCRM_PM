# Bug reports and observed test failures

## Current suite

No product bug is confirmed by the latest saved run. On 2026-10-23,
[`results/output.xml`](../../results/output.xml) records a pass for
`Verify User Credits field is mandatory`; it contains no failures. It does not
cover the other 32 tests discovered under `testcases/`.

Use [the bug report template](./BUG-REPORT-TEMPLATE.md) to record new,
reproducible findings. Do not infer a product defect from a test that was not
run or from a `PASS` without an assertion for the behavior in question.

## Historical automation failures

The root [`output.xml`](../../output.xml) records a run from 2026-05-14 against
`testcases/tenant-management.robot`. That file is absent from the current
discovered suite, so these findings are retained as historical automation
failures, not confirmed product bugs. They have not been reproduced against
the current tests.

### HIST-AUTO-001 - Manual tenant run cannot locate its image fixture

- **Type / status:** Test automation / historical, untriaged
- **Affected case:** `Verify Admin Able To Create Manual Tenant`
- **Evidence:** The recorded run failed with `File ... does not exist` for the
  `cyprus-1302383_1920.jpg` image under a Downloads path from the prior machine.
- **Expected:** The test should resolve a configured, available upload fixture.
- **Actual:** The first tenant-creation test stopped before completing because
  the image fixture was missing.
- **Root cause:** Not established; the result only proves that this particular
  machine-specific path was unavailable.

### HIST-AUTO-002 - Licensed invite run lost its browser session

- **Type / status:** Test automation or environment / historical, untriaged
- **Affected case:** `Verify That Tenant Is Able To Create With Invite Method Licensed Type`
- **Evidence:** `InvalidSessionIdException`; Chrome was disconnected before the
  test could continue.
- **Expected:** The browser session should remain active for the invite flow.
- **Actual:** The saved run could not use the WebDriver session.
- **Root cause:** Not established by the saved result.

### HIST-AUTO-003 - Free-trial invite run lost its browser session

- **Type / status:** Test automation or environment / historical, untriaged
- **Affected case:** `Verify That tenant Is Able To Create With Invite Method With Free Trial`
- **Evidence:** `InvalidSessionIdException`; Chrome was disconnected before the
  test could continue.
- **Expected:** The browser session should remain active for the invite flow.
- **Actual:** The saved run could not use the WebDriver session.
- **Root cause:** Not established by the saved result.

### HIST-AUTO-004 - Combined invite run had no browser window

- **Type / status:** Test automation or environment / historical, untriaged
- **Affected case:** `User Able To Create Both Free Trial And Licensed Tenants`
- **Evidence:** `NoSuchWindowException`; the target browser window was already
  closed.
- **Expected:** The browser window should remain available through both invite
  flows.
- **Actual:** The saved run could not continue after the window closed.
- **Root cause:** Not established by the saved result.

### HIST-AUTO-005 - End-to-end tenant run had no browser window

- **Type / status:** Test automation or environment / historical, untriaged
- **Affected case:** `Whole Tenant Creation Flow Including Manual Creation And Invite Creation`
- **Evidence:** `NoSuchWindowException`; the target browser window was already
  closed.
- **Expected:** The browser window should remain available through the complete
  manual and invite flows.
- **Actual:** The saved run could not continue after the window closed.
- **Root cause:** Not established by the saved result.
