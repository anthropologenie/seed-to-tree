#!/bin/bash
# Complete setup for Sacred QA Audits ↔ Jobs Application Automation integration
#
# This script sets up the complete symbiotic integration between the two projects.
# Run from ~/projects/ directory.

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Functions
print_header() {
    echo ""
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${CYAN}$1${NC}"
    echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo ""
}

print_step() {
    echo -e "${BLUE}▸${NC} $1"
}

print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

# Header
clear
echo -e "${CYAN}"
cat << "EOF"
╔═══════════════════════════════════════════════════════════════╗
║                                                               ║
║     🔗  Sacred QA Audits ↔ Jobs Automation Integration      ║
║                                                               ║
║              Complete Setup & Deployment Script               ║
║                                                               ║
╚═══════════════════════════════════════════════════════════════╝
EOF
echo -e "${NC}"

# Step 1: Verify structure
print_header "Step 1: Verifying Project Structure"

print_step "Checking for required directories..."

if [ ! -d "sacred-qa-audits" ]; then
    print_error "sacred-qa-audits/ directory not found"
    echo "  Expected location: $(pwd)/sacred-qa-audits"
    exit 1
fi

if [ ! -d "jobs-application-automation" ]; then
    print_error "jobs-application-automation/ directory not found"
    echo "  Expected location: $(pwd)/jobs-application-automation"
    exit 1
fi

print_success "Both projects found"
print_step "Sacred QA Audits: $(pwd)/sacred-qa-audits"
print_step "Jobs Automation:  $(pwd)/jobs-application-automation"

# Step 2: Verify database
print_header "Step 2: Verifying Jobs Database"

print_step "Checking for jobs-tracker.db..."

DB_PATH="jobs-application-automation/data/jobs-tracker.db"

if [ ! -f "$DB_PATH" ]; then
    print_warning "Database not found at $DB_PATH"
    print_step "This is okay if you're setting up for the first time"
else
    print_success "Database found"

    # Check if parliament_decisions table exists
    print_step "Checking for parliament_decisions table..."

    TABLE_CHECK=$(sqlite3 "$DB_PATH" "SELECT name FROM sqlite_master WHERE type='table' AND name='parliament_decisions';" 2>/dev/null || echo "")

    if [ -z "$TABLE_CHECK" ]; then
        print_warning "parliament_decisions table not found - migration needed"
    else
        print_success "parliament_decisions table exists"
    fi
fi

# Step 3: Apply database migration
print_header "Step 3: Applying Database Migration"

print_step "Navigating to jobs-application-automation..."
cd jobs-application-automation

if [ -f "scripts/apply_parliament_migration.sh" ]; then
    print_step "Running migration script..."

    if bash scripts/apply_parliament_migration.sh; then
        print_success "Migration completed successfully"
    else
        print_error "Migration failed"
        cd ..
        exit 1
    fi
else
    print_warning "Migration script not found at scripts/apply_parliament_migration.sh"
    print_step "You may need to create the parliament_decisions table manually"
fi

cd ..

# Step 4: Install Sacred QA dependencies
print_header "Step 4: Installing Sacred QA Audits Dependencies"

print_step "Navigating to sacred-qa-audits..."
cd sacred-qa-audits

if [ -f "requirements.txt" ]; then
    print_step "Installing Python dependencies..."

    if pip3 install -r requirements.txt --quiet; then
        print_success "Dependencies installed"
    else
        print_error "Failed to install dependencies"
        cd ..
        exit 1
    fi
else
    print_warning "requirements.txt not found"
    print_step "Installing core dependencies manually..."
    pip3 install pydantic pytest pytest-cov --quiet
    print_success "Core dependencies installed"
fi

# Step 5: Verify installation
print_header "Step 5: Verifying Installation"

print_step "Checking Python imports..."

python3 -c "
import sys
try:
    from src.integrations.jobs_db_integration import JobsDBIntegration
    from src.integrations.validation import ParliamentValidator
    from src.parliament.kragentic_parliament import KragenticParliament
    print('✓ All imports successful')
except ImportError as e:
    print(f'✗ Import failed: {e}')
    sys.exit(1)
" || {
    print_error "Import verification failed"
    cd ..
    exit 1
}

print_success "Installation verified"

# Step 6: Run integration tests
print_header "Step 6: Running Integration Tests"

print_step "Executing test suite..."
echo ""

if python3 -m pytest tests/test_full_integration.py -v --tb=short 2>&1 | tee /tmp/integration_test_output.txt; then
    TEST_RESULT=0
else
    TEST_RESULT=1
fi

echo ""

if [ $TEST_RESULT -eq 0 ]; then
    print_success "All integration tests passed ✅"
else
    print_error "Some tests failed"
    print_warning "Review test output above for details"
    echo ""
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        cd ..
        exit 1
    fi
fi

# Step 7: Quick validation test
print_header "Step 7: Quick Validation Test"

print_step "Testing basic integration connectivity..."

python3 -c "
import sys
from pathlib import Path

# Add parent to path
sys.path.insert(0, str(Path.cwd()))

try:
    from src.integrations.jobs_db_integration import JobsDBIntegration

    # Try to connect
    jobs_db = JobsDBIntegration()

    if jobs_db.connect():
        print('✓ Successfully connected to jobs database')

        # Try to fetch context
        context = jobs_db.fetch_context('job_evaluation')
        print(f'✓ Context fetched: {len(context)} keys')

        jobs_db.disconnect()
        print('✓ Successfully disconnected')
    else:
        print('⚠ Could not connect to database (this is okay if database is empty)')

except Exception as e:
    print(f'✗ Validation test failed: {e}')
    sys.exit(1)
"

if [ $? -eq 0 ]; then
    print_success "Integration validation successful"
else
    print_warning "Validation had issues (may be okay for fresh setup)"
fi

cd ..

# Step 8: Final summary
print_header "🎉 Setup Complete!"

echo -e "${GREEN}The Sacred QA Audits ↔ Jobs Automation integration is ready!${NC}"
echo ""
echo -e "${CYAN}Next Steps:${NC}"
echo ""
echo "1. Start the interactive shell:"
echo -e "   ${YELLOW}cd sacred-qa-audits${NC}"
echo -e "   ${YELLOW}python3 examples/job_advisory_shell.py${NC}"
echo ""
echo "2. Or run the demo:"
echo -e "   ${YELLOW}python3 examples/job_advisory_demo.py${NC}"
echo ""
echo "3. Or use the Python API:"
echo -e "   ${YELLOW}python3${NC}"
echo "   >>> from src.integrations.jobs_db_integration import JobsDBIntegration"
echo "   >>> jobs_db = JobsDBIntegration()"
echo "   >>> jobs_db.connect()"
echo ""
echo -e "${CYAN}Documentation:${NC}"
echo "  • Integration Guide:  sacred-qa-audits/INTEGRATION.md"
echo "  • Architecture Deep Dive: sacred-qa-audits/SYMBIOTIC_ARCHITECTURE.md"
echo "  • Test Report: sacred-qa-audits/TEST_REPORT.md"
echo ""
echo -e "${CYAN}Shell Commands:${NC}"
echo "  • list [score]  - List scraped jobs"
echo "  • advise <id>   - Get Parliament recommendation"
echo "  • skills        - Show your skill levels"
echo "  • stats         - View accuracy report"
echo "  • calibrate     - Get threshold suggestions"
echo "  • help          - Show all commands"
echo ""

# Optional: Create quick-start script
print_step "Creating quick-start script..."

cat > sacred-qa-audits/start_shell.sh << 'ENDSCRIPT'
#!/bin/bash
# Quick-start script for job advisory shell

cd "$(dirname "$0")"
python3 examples/job_advisory_shell.py
ENDSCRIPT

chmod +x sacred-qa-audits/start_shell.sh
print_success "Created sacred-qa-audits/start_shell.sh for quick access"

echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✅ INTEGRATION SETUP SUCCESSFUL${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
