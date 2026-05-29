"""
app/tests/test_metadata.py — unit tests for the pure metadata-extraction logic.

These run with no Azure dependencies (no network, credentials, or azure-* packages),
so they make a fast, reliable gate in the app CI pipeline (.github/workflows/app.yml).
The Azure I/O paths are exercised separately by the end-to-end smoke test in the runbook.

pytest is configured (pyproject.toml) with pythonpath=["app"], so `import metadata`
resolves without importing function_app.py (which needs the azure-functions package).

Run:  pytest -q
"""

from metadata import extract_metadata


def test_extract_metadata_basic_fields():
    data = b"hello world"
    doc = extract_metadata("greeting.txt", data)
    assert doc["name"] == "greeting.txt"
    assert doc["sizeBytes"] == len(data)
    assert doc["extension"] == "txt"
    assert len(doc["sha256"]) == 64  # SHA-256 hex digest


def test_extract_metadata_id_is_content_hash_and_stable():
    data = b"same content"
    a = extract_metadata("a.bin", data)
    b = extract_metadata("b.bin", data)
    # id is derived from content, so identical bytes -> identical id (idempotent upsert)
    assert a["id"] == a["sha256"] == b["id"]


def test_extract_metadata_handles_no_extension():
    doc = extract_metadata("README", b"x")
    assert doc["extension"] == ""
