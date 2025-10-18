# 🚀 SEED TO TREE - SOVEREIGN STACK QUICKSTART

**Generated**: October 16, 2025  
**Launch Timeline**: 2 hours to first deployment  
**Philosophy**: From Seed to Tree - Digital Earth Architecture

---

## 🎯 What You're Building

A **sovereignty-first QA audit service** for marketing campaigns with:
- Zero vendor lock-in
- Complete data transparency
- AGQ (values alignment) scoring
- One-click data export
- Immediate deletion rights

**Revenue Model**: Service-based (Tier 1 monetization)
- $500-2000 per audit
- 14-day Sprint 1 to first paying customer
- Scalable to platform in Sprint 2-3

---

## 📊 System Architecture Overview

```
Digital Earth: 4-Layer Stack

┌──────────────────────────────────────┐
│ 🌐 CRUST (Client-Facing)            │
│  • platform-outreach                 │
│  • marketing-qa-audits               │
└───────────────┬──────────────────────┘
                │
┌───────────────▼──────────────────────┐
│ 🔄 MANTLE (Orchestration)            │
│  • qa-orchestration (n8n + Docker)   │
└───────────────┬──────────────────────┘
                │
┌───────────────▼──────────────────────┐
│ ⚙️ CORE (Engine)                      │
│  • sacred-qa-studio (Playwright + AI)│
└──────────────────────────────────────┘
```

---

## ⚡ RAPID DEPLOYMENT (Choose Your Speed)

### Option A: Full Stack (2 hours)
All 4 repos + complete workflows + landing page

### Option B: MVP Only (45 minutes)
Core + Orchestration (run audits without public landing)

### Option C: Demo Mode (15 minutes)
Docker stack + sample audit (no client portal)

**Recommended**: Start with Option B, expand to A within week 1.

---

## 🛠️ Prerequisites Check

Run this verification script:

```bash
# Check all tools
echo "🔍 Verifying Installation..."

# Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found - Install from https://docker.com"
fi

# Node.js
if command -v node &> /dev/null; then
    echo "✅ Node.js: $(node --version)"
else
    echo "❌ Node.js not found - Install from https://nodejs.org"
fi

# Git
if command -v git &> /dev/null; then
    echo "✅ Git: $(git --version)"
else
    echo "❌ Git not found - Install from https://git-scm.com"
fi

# Python (optional for local dev)
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "⚠️ Python not found - Optional but recommended"
fi
```

**Required**:
- ✅ Docker 20+
- ✅ Node.js 18+
- ✅ Git 2.30+

**Accounts Needed**:
- [ ] Supabase (free tier) - Database
- [ ] Cal.com (free) - Booking
- [ ] GitHub (free) - Code hosting
- [ ] (Optional) Vercel/Netlify - Landing page hosting

---

## 📁 Repository Structure

```
~/projects/
├── qa-orchestration/          # Workflow automation (n8n)
│   ├── docker-compose.yml     # Full stack
│   ├── .env.example           # Configuration template
│   ├── workflows/             # n8n workflow JSONs
│   └── README.md
│
├── platform-outreach/         # Public-facing site
│   ├── landing/               # Marketing site
│   │   └── index.html         # Main landing page
│   ├── sovereignty/           # Client portal
│   │   ├── dashboard.html     # Export/delete controls
│   │   └── data-lineage.html  # Transparency view
│   └── README.md
│
├── sacred-qa-studio/          # Test automation core
│   ├── tests/                 # Playwright test scripts
│   ├── api/                   # FastAPI backend
│   ├── database/              # Supabase schema
│   ├── agq/                   # AGQ scoring engine
│   └── README.md
│
└── marketing-qa-audits/       # Client deliverables
    ├── templates/             # Report templates
    ├── intake/                # Forms & surveys
    ├── exports/               # Export definitions
    └── clients/               # Client folders
        └── {client-name}/     # Per-client structure
```

---

## 🚀 DEPLOYMENT: Step-by-Step

### Step 1: Initialize All Repositories (10 min)

```bash
cd ~/projects

# qa-orchestration (already initialized)
cd qa-orchestration
# Copy files from generated pack (coming next)

# platform-outreach
cd ../platform-outreach
git pull origin main  # If you have existing work
# Add new sovereignty files

# sacred-qa-studio
cd ../sacred-qa-studio
git pull origin main
# Add AGQ engine & API specs

# marketing-qa-audits
cd ../marketing-qa-audits
git pull origin main
# Add templates & export specs
```

### Step 2: Set Up Supabase (15 min)

```bash
# 1. Create project at https://supabase.com
# 2. Note your credentials:
#    - Project URL: https://xxxxx.supabase.co
#    - Anon Key: eyJxxxx...
#    - Service Key: eyJxxxx...

# 3. Run database migrations
cd ~/projects/sacred-qa-studio/database
# (SQL files will be generated - run them in Supabase SQL Editor)
```

### Step 3: Configure qa-orchestration (20 min)

```bash
cd ~/projects/qa-orchestration

# Copy environment template
cp .env.example .env

# Edit .env with your credentials
nano .env
```

**Required .env variables**:
```bash
# Supabase
SUPABASE_URL=https://xxxxx.supabase.co
SUPABASE_KEY=your_anon_key_here

# n8n
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=choose_secure_password

# Cal.com webhook
CALCOM_WEBHOOK_SECRET=your_webhook_secret

# Email (optional for Sprint 1)
SMTP_HOST=smtp.gmail.com
SMTP_USER=your@email.com
SMTP_PASSWORD=app_specific_password
```

### Step 4: Launch Docker Stack (10 min)

```bash
cd ~/projects/qa-orchestration

# Start all services
docker-compose up -d

# Verify all containers running
docker-compose ps

# Expected output:
# n8n           running   0.0.0.0:5678->5678/tcp
# postgres      running   5432/tcp
# redis         running   6379/tcp

# Check logs
docker-compose logs -f n8n
```

**Access n8n**: http://localhost:5678
- Login with credentials from .env
- Import workflows from `/workflows/` folder

### Step 5: Import n8n Workflows (15 min)

```bash
# In n8n UI (http://localhost:5678):
# 1. Click "Workflows" → "Import from File"
# 2. Upload each workflow:
#    - 01_booking_to_intake.json
#    - 02_intake_to_audit.json
#    - 03_audit_to_report.json

# 3. Configure each workflow:
#    - Set Supabase credentials
#    - Set webhook URLs
#    - Test connections
```

### Step 6: Deploy Landing Page (20 min)

```bash
cd ~/projects/platform-outreach/landing

# Option A: Deploy to Vercel (recommended)
# 1. Install Vercel CLI: npm i -g vercel
# 2. Deploy: vercel --prod

# Option B: Deploy to Netlify
# 1. Drag & drop to https://netlify.com

# Option C: Serve locally for testing
python3 -m http.server 8000
# Visit: http://localhost:8000
```

**Configure Cal.com**:
1. Create event type: "Free Marketing QA Audit"
2. Add webhook: `http://your-server:5678/webhook/booking`
3. Embed booking widget in landing page

### Step 7: Test End-to-End (30 min)

```bash
# TEST 1: Booking Flow
# 1. Visit landing page
# 2. Click "Book Free Audit"
# 3. Complete booking
# 4. Check n8n logs for webhook received

# TEST 2: Audit Execution
cd ~/projects/sacred-qa-studio
# Run sample test
npm run test:sample

# TEST 3: Report Generation
# (Triggered automatically by workflow)
# Check ~/projects/marketing-qa-audits/clients/test-client/

# TEST 4: Sovereignty Dashboard
# 1. Visit sovereignty/dashboard.html
# 2. Test "Export All Data" button
# 3. Test "Request Deletion" form
```

### Step 8: GitHub Setup (20 min)

```bash
# For each repository:
cd ~/projects/qa-orchestration

# Create GitHub repo, then:
git remote add origin git@github.com:YOUR_USERNAME/qa-orchestration.git
git branch -M main
git add .
git commit -m "Initial commit: Sovereign QA orchestration stack"
git push -u origin main

# Repeat for all 4 repos
```

---

## 🎯 Sprint 1 Milestones

### Week 1: Foundation (Days 1-7)

**Day 1-2**: Infrastructure
- [x] Docker stack running
- [x] Supabase configured
- [x] Landing page live
- [x] GitHub repos created

**Day 3-4**: Integration
- [ ] n8n workflows operational
- [ ] Cal.com webhook working
- [ ] Test audit runs successfully

**Day 5-7**: Polish
- [ ] Sovereignty dashboard functional
- [ ] First client booked
- [ ] AGQ scoring calibrated

### Week 2: First Customer (Days 8-14)

**Day 8-10**: Pilot Audit
- [ ] Client intake completed
- [ ] Audit executed
- [ ] Report delivered

**Day 11-14**: Scaling
- [ ] Second client booked
- [ ] Workflows optimized
- [ ] Sprint 2 planning

---

## 🛡️ Sovereignty Verification Checklist

Before declaring Sprint 1 complete, verify:

### Data Ownership
- [ ] Client can export all data (test the button)
- [ ] Export includes Playwright scripts
- [ ] Export is complete (no hidden data)

### Transparency
- [ ] Activity log shows all actions
- [ ] API audit trail accessible
- [ ] Test scripts viewable in portal

### Deletion Rights
- [ ] "Delete All Data" button works
- [ ] Deletion completes within 24 hours
- [ ] Deletion certificate generated

### AGQ Tracking
- [ ] AGQ scores calculated for all audits
- [ ] AGQ visible in reports
- [ ] AGQ trend chart functional

### Anti-Lock-In
- [ ] Migration guide exists
- [ ] All tools are open-source
- [ ] Client can self-host

---

## 🚨 Common Issues & Fixes

### Issue: Docker containers won't start

```bash
# Check if ports are in use
sudo lsof -i :5678  # n8n
sudo lsof -i :5432  # postgres

# Kill conflicting processes or change ports in docker-compose.yml
```

### Issue: n8n workflows not triggering

```bash
# Check webhook URLs
docker-compose logs n8n | grep webhook

# Test webhook manually
curl -X POST http://localhost:5678/webhook/test \
  -H "Content-Type: application/json" \
  -d '{"test": "data"}'
```

### Issue: Supabase connection failing

```bash
# Verify credentials in .env
echo $SUPABASE_URL
echo $SUPABASE_KEY

# Test connection
curl $SUPABASE_URL/rest/v1/ \
  -H "apikey: $SUPABASE_KEY"
```

### Issue: Playwright tests failing

```bash
cd ~/projects/sacred-qa-studio

# Install dependencies
npm install

# Update browsers
npx playwright install

# Run with debug
DEBUG=pw:api npm run test
```

---

## 📊 Success Metrics

### Sprint 1 Success = ALL of these:

**Technical**:
- ✅ Docker stack running stably (99% uptime)
- ✅ All 3 n8n workflows operational
- ✅ Playwright tests execute reliably
- ✅ Landing page live and fast (<2s load)

**Business**:
- ✅ 1 pilot audit delivered
- ✅ Client AGQ score ≥ 4.0
- ✅ 3 more clients booked
- ✅ $500-2000 revenue generated

**Sovereignty**:
- ✅ Export button works (tested)
- ✅ Deletion flow works (tested)
- ✅ AGQ tracking operational
- ✅ Data lineage visible

---

## 🌟 What Each Repository Does (Quick Reference)

### **qa-orchestration** (The Nervous System)
**Purpose**: Automate everything between booking and delivery

**Key Files**:
- `docker-compose.yml` - Full stack definition
- `workflows/01_booking_to_intake.json` - Cal.com → Supabase
- `workflows/02_intake_to_audit.json` - Form → Test execution
- `workflows/03_audit_to_report.json` - Results → PDF

**You'll interact with this**: Daily (monitoring workflows)

---

### **platform-outreach** (The Face)
**Purpose**: Attract clients and provide sovereignty controls

**Key Files**:
- `landing/index.html` - Marketing site
- `sovereignty/dashboard.html` - Client portal (export/delete)
- `sovereignty/data-lineage.html` - Transparency view

**You'll interact with this**: Weekly (updating copy, checking bookings)

---

### **sacred-qa-studio** (The Brain)
**Purpose**: Execute tests and calculate AGQ scores

**Key Files**:
- `tests/critical-paths.spec.js` - Playwright tests
- `api/audit.py` - FastAPI endpoints
- `agq/scoring-engine.py` - Values alignment calculator
- `database/schema.sql` - Supabase tables

**You'll interact with this**: Per audit (running tests, reviewing results)

---

### **marketing-qa-audits** (The Deliverables)
**Purpose**: Generate beautiful reports and manage client data

**Key Files**:
- `templates/audit-report-template.md` - Report structure
- `templates/agq-scorecard.md` - Values tracking
- `intake/agq-survey.json` - Client values questionnaire
- `exports/export-package-spec.md` - Export format definition

**You'll interact with this**: Per client (generating reports, preparing exports)

---

## 🎓 Learning Resources

### If you're new to:

**Docker**: https://docs.docker.com/get-started/
- Focus on: docker-compose basics

**n8n**: https://docs.n8n.io/
- Focus on: Webhook triggers, Supabase nodes

**Playwright**: https://playwright.dev/
- Focus on: Page navigation, assertions

**Supabase**: https://supabase.com/docs
- Focus on: Database setup, API keys

---

## 🔄 Daily Operations (Once Live)

### Morning Ritual (10 min)
```bash
# Check Docker health
cd ~/projects/qa-orchestration
docker-compose ps

# Check n8n executions
# Visit http://localhost:5678 → "Executions"

# Review any failed workflows
```

### Per Client (2-3 hours)
```bash
# 1. Receive booking (automated via Cal.com)
# 2. Client receives intake form (automated via n8n)
# 3. Run audit when ready
cd ~/projects/sacred-qa-studio
npm run audit -- --client={client-id}

# 4. Review results, generate report
cd ~/projects/marketing-qa-audits
python scripts/generate-report.py {client-id}

# 5. Deliver via sovereignty dashboard
```

### Weekly Review (30 min)
- Check AGQ trends (are we improving?)
- Review client feedback
- Update test templates if needed
- Plan next sprint improvements

---

## 🚀 Next Steps After Sprint 1

### Sprint 2: Scale to 10 Clients
- Automated report generation
- Payment integration (Stripe)
- Enhanced AGQ tracking
- Multi-client sovereignty dashboard

### Sprint 3: Self-Service Platform
- Client login system
- Automated scheduling
- Real-time audit status
- Subscription pricing

### Sprint 4+: Productize
- White-label offering
- API for developers
- Marketplace for custom tests
- Community-contributed AGQ dimensions

---

## 💡 Philosophy: Why This Approach Works

### Traditional SaaS:
```
Build → Scale → Extract Value → Vendor Lock-In
```

### Seed to Tree:
```
Serve → Deliver Value → Enable Exit → Build Trust → Grow Organically
```

**The Paradox**: By making it easy to leave, clients never want to.

---

## 📞 Support & Community

**Questions?**
- GitHub Issues: Use repo-specific issues
- Email: support@krapheno.com
- Sovereignty Concerns: sovereignty@krapheno.com

**Contribute**:
- AGQ dimensions (suggest new values to track)
- Test templates (share your Playwright scripts)
- Report designs (submit beautiful templates)

---

## ✅ Final Pre-Launch Checklist

Before announcing to first client:

### Infrastructure
- [ ] Docker stack stable (24hr uptime test)
- [ ] All workflows tested end-to-end
- [ ] Backups configured (Supabase auto-backup on)
- [ ] Monitoring set up (uptime checks)

### Sovereignty
- [ ] Export tested with real data
- [ ] Deletion tested (use test account)
- [ ] AGQ calculations verified
- [ ] Manifesto published (link in footer)

### Business
- [ ] Pricing decided ($500-2000/audit)
- [ ] Service agreement drafted
- [ ] Cancellation policy clear (30-day, no penalty)
- [ ] Refund policy defined (100% if AGQ <3.0)

### Marketing
- [ ] Landing page live and tested
- [ ] Cal.com booking functional
- [ ] Email templates ready
- [ ] Social proof prepared (case study template)

---

## 🌱 → 🌳 From Seed to Tree

You're not building a company. You're growing an ecosystem.

**Start small**: 1 client, 1 audit, 1 perfect experience.  
**Grow organically**: Word-of-mouth, not ads.  
**Scale sovereignty**: Every client gets the same dignity.  
**Build trust**: By making exit easy, not hard.

---

**Time to launch.**

Your sovereign QA stack is ready to serve. Download the generated files, run the deploy script, and book your first client.

The Digital Earth Architecture begins with you. 🌍

---

*Generated by Seed to Tree Sovereign Stack Generator v1.0*  
*Questions? Issues? Improvements? Open a GitHub issue.*
