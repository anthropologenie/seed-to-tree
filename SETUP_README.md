# Sacred QA Audits ↔ Jobs Automation Integration Setup

## Quick Setup

### One-Command Installation

From `~/projects/` directory:

```bash
./setup_complete_integration.sh
```

This script will:
1. ✅ Verify project structure
2. ✅ Check database existence
3. ✅ Apply database migration
4. ✅ Install Python dependencies
5. ✅ Verify installation
6. ✅ Run integration tests
7. ✅ Perform validation test
8. ✅ Create quick-start script

### Manual Setup

If you prefer manual setup:

#### 1. Apply Database Migration
```bash
cd jobs-application-automation
./scripts/apply_parliament_migration.sh
cd ..
```

#### 2. Install Dependencies
```bash
cd sacred-qa-audits
pip3 install -r requirements.txt
```

#### 3. Run Tests
```bash
python3 -m pytest tests/test_full_integration.py -v
```

#### 4. Start Using
```bash
python3 examples/job_advisory_shell.py
```

## Directory Structure

Expected structure in `~/projects/`:

```
~/projects/
├── setup_complete_integration.sh    # Setup script
├── SETUP_README.md                  # This file
├── sacred-qa-audits/
│   ├── src/
│   │   ├── integrations/
│   │   │   ├── jobs_db_integration.py
│   │   │   └── validation.py
│   │   ├── parliament/
│   │   └── agents/
│   ├── examples/
│   │   ├── job_advisory_shell.py
│   │   └── job_advisory_demo.py
│   ├── tests/
│   │   ├── test_validation.py
│   │   └── test_full_integration.py
│   ├── requirements.txt
│   ├── INTEGRATION.md
│   ├── SYMBIOTIC_ARCHITECTURE.md
│   └── .github/
│       └── workflows/
│           └── test-integration.yml
└── jobs-application-automation/
    ├── data/
    │   └── jobs-tracker.db
    ├── scripts/
    │   └── apply_parliament_migration.sh
    └── migrations/
        └── 004_add_parliament_decisions.sql
```

## Requirements

### System Requirements
- **Python**: 3.10 or higher
- **OS**: Linux, macOS, or WSL2
- **Disk Space**: ~100 MB

### Python Packages
- `pydantic>=2.0.0` - Data validation
- `pytest>=7.0.0` - Testing framework
- `pytest-cov>=4.0.0` - Coverage reporting

These will be installed automatically by the setup script.

## Quick Start After Setup

### Option 1: Interactive Shell
```bash
cd sacred-qa-audits
python3 examples/job_advisory_shell.py
```

Commands available:
- `list 80` - List jobs with score ≥80
- `show 42` - View job #42 details
- `advise 42` - Get Parliament recommendation
- `skills` - Show your skill levels
- `stats` - View accuracy report
- `calibrate` - Get threshold suggestions
- `help` - Show all commands

### Option 2: Demo Script
```bash
cd sacred-qa-audits
python3 examples/job_advisory_demo.py
```

### Option 3: Python API
```python
from src.integrations.jobs_db_integration import JobsDBIntegration
from src.parliament.kragentic_parliament import KragenticParliament

# Connect to database
jobs_db = JobsDBIntegration()
jobs_db.connect()

# Create Parliament with integration
parliament = KragenticParliament(integration=jobs_db)

# Get context and advice
context = jobs_db.fetch_context("job_evaluation", opportunity_id=42)
query = "Should I apply to this role?"
decision, trace = parliament.deliberate(query, context)

print(f"Decision: {decision}")
print(f"Confidence: {trace.confidence:.1%}")
```

## Troubleshooting

### Database not found
**Error**: `jobs-tracker.db not found`

**Solution**: Create the database first in `jobs-application-automation`:
```bash
cd jobs-application-automation
# Follow jobs-application-automation setup instructions
```

### Import errors
**Error**: `ModuleNotFoundError: No module named 'pydantic'`

**Solution**: Install dependencies:
```bash
pip3 install -r sacred-qa-audits/requirements.txt
```

### Tests failing
**Error**: Tests fail during setup

**Solution**: Check test output for specific errors. Common issues:
- Database path incorrect
- Missing tables (run migration)
- Python version < 3.10

### Permission denied
**Error**: `Permission denied: ./setup_complete_integration.sh`

**Solution**: Make script executable:
```bash
chmod +x setup_complete_integration.sh
```

## Verification

After setup, verify the integration:

```bash
cd sacred-qa-audits
python3 -c "
from src.integrations.jobs_db_integration import JobsDBIntegration
jobs_db = JobsDBIntegration()
assert jobs_db.connect(), 'Connection failed'
print('✓ Integration verified')
"
```

## Next Steps

After successful setup:

1. **Read the documentation**:
   - `sacred-qa-audits/INTEGRATION.md` - Complete guide
   - `sacred-qa-audits/SYMBIOTIC_ARCHITECTURE.md` - Deep dive

2. **Try the examples**:
   - Interactive shell: `job_advisory_shell.py`
   - Full demo: `job_advisory_demo.py`

3. **Start tracking decisions**:
   - Use `advise` command for recommendations
   - Log outcomes with `log` command
   - Monitor accuracy with `stats` command

## CI/CD Integration

GitHub Actions workflow is included at `.github/workflows/test-integration.yml`.

To enable CI/CD:
1. Push to GitHub
2. GitHub Actions will automatically run tests on:
   - Every push to `main` or `develop`
   - Every pull request
   - Manual workflow trigger

The workflow tests:
- Python 3.10, 3.11, 3.12 compatibility
- Unit tests (validation module)
- Integration tests (full workflow)
- Example scripts
- Documentation existence
- Code linting (informational)

## Support

- **Documentation**: See `sacred-qa-audits/INTEGRATION.md`
- **Issues**: File on GitHub
- **Tests**: Run `pytest tests/test_full_integration.py -v`

---

**Setup Script Version**: 1.0.0
**Last Updated**: 2024-11-19
