"""
app/metadata.py — pure file-metadata logic, ZERO Azure/third-party dependencies.

Kept separate from function_app.py on purpose: this module imports only the standard
library, so it can be unit-tested fast and offline (tests/test_metadata.py) and reused
by both the blob trigger and any future code paths. function_app.py imports from here.
"""

from __future__ import annotations

import hashlib
import os
from datetime import datetime, timezone
from typing import Any


def extract_metadata(name: str, data: bytes) -> dict[str, Any]:
    """Compute file metadata from a name and its raw bytes.

    Returns a JSON-serializable document keyed by a stable file id (the SHA-256 of
    the contents), suitable for upserting into Cosmos DB. Content-addressed id means
    re-processing the same bytes is idempotent.
    """
    sha256 = hashlib.sha256(data).hexdigest()
    return {
        "id": sha256,
        "fileId": sha256,
        "name": name,
        "sizeBytes": len(data),
        "extension": os.path.splitext(name)[1].lower().lstrip("."),
        "sha256": sha256,
        "processedAt": datetime.now(timezone.utc).isoformat(),
    }
