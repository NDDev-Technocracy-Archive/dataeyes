# DataEyes

Maintenance source for the retired DataEyes benchmark service and its research documents.
The application and provider integrations remain inactive. CI runs static checks and
isolated component tests; it does not start the service or make live model requests.

- [Benchmark source and application documentation](model-bench/README.md)
- [Research documents](dataeyes-docs/)

## Source and component checks

Run `just check` for offline Ruff lint/format and Just formatting. It neither installs
dependencies nor imports the application. On an execution host, `just setup` prepares
the committed Python lock with its development dependencies, `just test` runs the existing
mocked HTTP and deterministic suites, and `just verify` combines both checks.

CI uses the same commands on Python 3.11 and 3.12 through the shared workflow. Both
matrix outcomes and the static security scan must pass. Existing CodeQL/Scorecard
coverage remains, and daily source security checks report history and dependency findings.
Dependabot coverage remains until a replacement updater is qualified.

Live provider, database, service and deployment acceptance is separate from these tests.
Existing research and benchmark records remain preserved.
