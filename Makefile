.PHONY: test run benchmark audit adaption-dataset v7-preflight v7-provider-check v7-draft v7-kit v7-authority v7-blind-review v7-finalize v7-seal v7-run v7-verify v7-provider-verify v8-unlock

test:
	pytest -q

run:
	python -m apps.api

benchmark:
	python scripts/run_benchmark.py

audit:
	python scripts/run_postrepair_audit.py

adaption-dataset:
	python scripts/make_adaption_dataset.py

v7-preflight:
	python scripts/run_v7_preflight.py

v7-provider-check:
	python scripts/check_provider_retrieval_capability.py

v7-draft:
	python scripts/generate_v7_review_draft.py data/multilingual/v7_source_seeds.jsonl --languages hi te

v7-kit:
	python scripts/prepare_v7_qualification_kit.py

v7-authority:
	python scripts/fill_v7_authority_drafts.py

v7-blind-review:
	python scripts/prepare_v7_blind_reviews.py data/multilingual/v7_authored.jsonl

v7-finalize:
	python scripts/finalize_v7_reviews.py data/multilingual/v7_authored.jsonl data/multilingual/v7_primary_review.jsonl data/multilingual/v7_secondary_review.jsonl

v7-seal:
	python scripts/seal_v7_holdout.py data/multilingual/v7_reviewed.jsonl

v7-run:
	python scripts/run_v7_multilingual.py


v7-verify:
	python scripts/verify_v7_evidence.py

v7-provider-verify:
	python scripts/verify_v7_provider_evidence.py

v8-unlock:
	python scripts/check_v8_unlock.py
