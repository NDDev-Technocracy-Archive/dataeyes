set shell := ["bash", "-euo", "pipefail", "-c"]

# List the project commands.
default:
    @just --list

# Prepare the locked test environment on an execution host.
setup:
    uv sync --project model-bench --locked --extra dev --python python

# Check source formatting and lint without installing or executing the application.
check:
    just --fmt --check
    ruff check model-bench/src model-bench/tests
    ruff format --check model-bench/src model-bench/tests

# Run the existing mocked and deterministic tests in the prepared environment.
test:
    uv run --project model-bench --no-sync pytest -q model-bench/tests --junitxml=ci-reports/python.xml

# Run the complete source and Python component validation.
verify: check test

# Retain the existing static security scan, with usage metrics disabled.
[group("ci")]
ci-semgrep:
    uv tool run --from semgrep --with-requirements .github/requirements.txt semgrep scan --error --metrics off --config p/ci
