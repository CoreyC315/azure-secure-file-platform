"""
app/function_app.py — the workload that gives the infrastructure a purpose.

Two Azure Functions (Python v2 programming model):
  1. process_blob  — Event Grid / blob trigger on the `landing` container. Reads an
                     uploaded file, extracts metadata, and writes a result document
                     to Cosmos DB.
  2. get_result    — HTTP GET /results/{id}; returns a previously processed document.

Design rules:
  * All Azure access uses DefaultAzureCredential + the Function App's MANAGED IDENTITY.
    There are no connection strings or keys in this file or in app settings.
  * The pure logic lives in metadata.py so it can be unit tested with pytest and no
    cloud dependencies (see tests/test_metadata.py).

STATUS: scaffold — Azure I/O bodies are stubbed (TODO milestone 4); metadata.extract_metadata
is real so the test suite passes today.
"""

from __future__ import annotations

import logging
import os

import azure.functions as func

from metadata import extract_metadata

app = func.FunctionApp()

# Config sourced from app settings (set by Terraform from module outputs).
COSMOS_ENDPOINT = os.environ.get("COSMOS_ENDPOINT", "")
COSMOS_DATABASE = os.environ.get("COSMOS_DATABASE", "files")
COSMOS_CONTAINER = os.environ.get("COSMOS_CONTAINER", "results")


def _cosmos_container():
    """Return a Cosmos container client authenticated via managed identity.

    TODO(milestone 4): implement with azure.cosmos.CosmosClient + DefaultAzureCredential.
    """
    raise NotImplementedError("Cosmos client wiring lands in milestone 4")


@app.blob_trigger(arg_name="blob", path="landing/{name}", connection="LandingStorage")
def process_blob(blob: func.InputStream) -> None:
    """Triggered when a file lands in the `landing` container."""
    logging.info("Processing blob: %s (%s bytes)", blob.name, blob.length)
    data = blob.read()
    doc = extract_metadata(os.path.basename(blob.name or "unknown"), data)
    logging.info("Extracted metadata: %s", doc["id"])
    # TODO(milestone 4): _cosmos_container().upsert_item(doc)


@app.route(route="results/{id}", methods=["GET"], auth_level=func.AuthLevel.FUNCTION)
def get_result(req: func.HttpRequest) -> func.HttpResponse:
    """Return a previously processed metadata document by id."""
    result_id = req.route_params.get("id")
    logging.info("Fetching result: %s", result_id)
    # TODO(milestone 4): read from Cosmos and return JSON; 404 if missing.
    return func.HttpResponse(
        body='{"status":"not_implemented","id":"%s"}' % result_id,
        status_code=501,
        mimetype="application/json",
    )
