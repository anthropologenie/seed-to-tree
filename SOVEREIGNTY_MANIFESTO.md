# 🛡️ Seed to Tree - Sovereignty Manifesto

**Version**: 1.0.0  
**Effective Date**: October 16, 2025  
**Philosophy**: From Seed to Tree - Data dignity as a fundamental right

---

## Our Covenant with Clients

Every client who trusts us with their marketing data receives **irrevocable guarantees** of data sovereignty, transparency, and the right to exit without penalty.

---

## The Five Pillars of Data Sovereignty

### 1. 🏛️ **Complete Data Ownership**

**Guarantee**: Your data belongs to you, always and forever.

**What This Means**:
- All audit data stored in YOUR designated Supabase project (or self-hosted DB)
- We have READ-ONLY access, revocable at any time
- Zero vendor lock-in: All test scripts exportable as standalone files
- Migration path documented for self-hosting

**Technical Implementation**:
```yaml
Data Storage Architecture:
  Client Database: client-controlled Supabase project
  Our Access: Temporary API key, logged and auditable
  Retention: Client decides (1 month to forever)
  Deletion: Irreversible upon request, within 24 hours
```

---

### 2. 🔓 **Radical Transparency**

**Guarantee**: You see everything we do, in real-time.

**What This Means**:
- Every Playwright test script visible in your portal
- All API calls logged with timestamps
- AGQ scoring algorithm is open-source
- Audit methodology documented in plain language

**Technical Implementation**:
```yaml
Transparency Dashboard:
  Activity Log: Real-time feed of all actions
  Test Scripts: Downloadable, runnable outside our platform
  Data Lineage: Visual map of where your data lives
  API Audit Trail: Every request/response logged
```

---

### 3. 📦 **One-Click Full Export**

**Guarantee**: Get all your data in usable formats, instantly.

**What This Means**:
- Export button available 24/7 in your sovereignty dashboard
- Includes: JSON, CSV, PDF reports, Playwright scripts, screenshots
- Export is COMPLETE - no hidden data, no partial extracts
- No approval needed, no delay, no questions asked

**Technical Implementation**:
```yaml
Export Package Contains:
  /audit-results/
    - full-audit-data.json (raw results)
    - test-results.csv (spreadsheet format)
    - agq-scores.json (values alignment tracking)
  /test-scripts/
    - playwright-tests/ (runnable .spec.js files)
    - config.json (test configuration)
  /reports/
    - executive-summary.pdf
    - detailed-findings.pdf
    - agq-scorecard.pdf
  /media/
    - screenshots.zip
    - videos.zip (if recorded)
  /sovereignty/
    - data-lineage-map.json
    - api-audit-trail.csv
    - MIGRATION_GUIDE.md (how to self-host)
```

---

### 4. 🗑️ **Immediate Deletion Rights**

**Guarantee**: Request deletion, get confirmation within 24 hours.

**What This Means**:
- "Delete All My Data" button in sovereignty dashboard
- Irreversible deletion from all systems (DB, backups, logs)
- Written confirmation with deletion certificate
- Audit trail proving data destruction

**Technical Implementation**:
```yaml
Deletion Protocol:
  Step 1: Request submitted via dashboard
  Step 2: Automated deletion from primary DB (5 min)
  Step 3: Backup purge initiated (12 hours)
  Step 4: Verification scan (23 hours)
  Step 5: Deletion certificate issued (24 hours)
  
Deletion Certificate Includes:
  - Unique deletion ID
  - Timestamp of request
  - List of systems purged
  - Cryptographic proof of deletion
  - Right to audit confirmation
```

---

### 5. 📊 **AGQ: Values Alignment Scoring**

**Guarantee**: We measure ourselves on YOUR values, not ours.

**What This Means**:
- AGQ (Aspirational Gravity Quotient) scores our ethics (1-5)
- Tracked: Transparency, Data Ownership, Ethical AI, Accessibility
- Every audit report includes AGQ scorecard
- Clients can flag values violations

**AGQ Scoring Criteria**:

| Dimension | Score 5 (Exemplary) | Score 1 (Needs Work) |
|-----------|---------------------|----------------------|
| **Transparency** | All methods visible, audit trail public | Black-box processes, no logging |
| **Data Ownership** | Client controls storage, instant export | Vendor lock-in, export barriers |
| **Ethical AI** | Open algorithms, human oversight | Proprietary AI, no explainability |
| **Accessibility** | WCAG AAA, multi-format exports | Basic compliance only |

**Technical Implementation**:
```python
# AGQ Scoring Engine (simplified)
def calculate_agq(audit_result):
    scores = {
        'transparency': assess_transparency(audit_result),
        'ownership': assess_data_ownership(audit_result),
        'ethical_ai': assess_ai_ethics(audit_result),
        'accessibility': assess_accessibility(audit_result)
    }
    
    agq_score = sum(scores.values()) / len(scores)
    return {
        'overall_agq': round(agq_score, 2),
        'dimensions': scores,
        'recommendation': generate_recommendation(scores)
    }
```

---

## Anti-Lock-In Protocols

### **The Exit Test**: Can a client leave us tomorrow with zero loss?

**YES, if all of these are true**:

✅ Client has complete export of all data  
✅ Test scripts run independently (no proprietary deps)  
✅ Reports are in open formats (PDF, CSV, JSON)  
✅ Migration guide exists for self-hosting  
✅ No contracts longer than 30 days  
✅ No penalties for cancellation  

**Technical Guarantees**:
```yaml
Technology Stack Choices:
  Database: Supabase (self-hostable PostgreSQL)
  Test Framework: Playwright (open-source, MIT licensed)
  Workflows: n8n (open-source, fair-code licensed)
  Reports: Markdown → PDF (no proprietary tools)
  
NO Dependencies On:
  ❌ Proprietary SaaS platforms
  ❌ Closed-source test tools
  ❌ Vendor-specific APIs
  ❌ Non-exportable data formats
```

---

## GDPR/CCPA Compliance (Built-In)

### **Data Subject Rights** - Automated, Not Optional

| Right | Implementation | Response Time |
|-------|---------------|---------------|
| **Right to Access** | Sovereignty dashboard shows all data | Real-time |
| **Right to Export** | One-click full export button | Instant |
| **Right to Deletion** | Automated deletion workflow | 24 hours |
| **Right to Rectification** | Client can edit audit metadata | Real-time |
| **Right to Restrict** | Pause all processing via dashboard | 5 minutes |

### **Consent Management**

```yaml
Consent Tracking:
  Initial Consent: Recorded during booking
  Purpose Limitation: Only for QA audits (no marketing use)
  Data Minimization: Only campaign URLs + contact info
  Storage Limitation: Client chooses retention period
  
Consent Can Be:
  - Withdrawn at any time (sovereignty dashboard)
  - Granular (audit vs. analytics vs. communications)
  - Auditable (full consent history visible)
```

---

## Sovereignty Dashboard: Feature Spec

### **Client Portal Features**

```javascript
// Key Features in Sovereignty Dashboard
const DASHBOARD_FEATURES = {
  data_overview: {
    storage_location: "Show Supabase project ID",
    data_size: "MB/GB of data stored",
    retention_period: "Days until auto-deletion"
  },
  
  transparency: {
    activity_log: "Real-time feed of all actions",
    api_audit_trail: "Every API call with timestamp",
    test_scripts_viewer: "Browse all Playwright tests"
  },
  
  export_controls: {
    full_export_button: "Download everything as ZIP",
    scheduled_exports: "Auto-export weekly/monthly",
    export_history: "Track all past exports"
  },
  
  deletion_controls: {
    delete_all_button: "Nuclear option - irreversible",
    deletion_history: "Track what was deleted when",
    deletion_certificate: "Proof of data destruction"
  },
  
  agq_tracking: {
    agq_scorecard: "Your values alignment scores",
    trend_chart: "AGQ over time",
    flag_violations: "Report sovereignty breaches"
  }
};
```

---

## Data Lineage Visualization

### **Where Does My Data Live?**

```
CLIENT DATA JOURNEY MAP:

1. BOOKING CAPTURED
   ├─ Cal.com (booking data)
   │  └─ Webhook → n8n (in transit only)
   │
   └─ Stored: Your Supabase project
      Location: [Your chosen region]
      Access: Your API key
      
2. INTAKE FORM SUBMITTED
   ├─ Form data sent to n8n
   │  └─ Processed → Supabase
   │
   └─ Stored: Your Supabase project
      + Client folder created locally
      
3. AUDIT EXECUTED
   ├─ Playwright tests run
   │  ├─ Screenshots captured (temp)
   │  └─ Results sent to Supabase
   │
   └─ Stored: 
      - Database: Your Supabase
      - Files: marketing-qa-audits/clients/{you}/
      
4. REPORT GENERATED
   └─ Stored: Your client folder
      + Available in sovereignty dashboard
      
5. AT ANY TIME: FULL EXPORT
   └─ Creates: Complete ZIP package
      Contains: Everything above + migration guide
```

---

## Open-Source Commitment

### **What We Share Publicly**

**100% Open** (MIT License):
- Playwright test templates
- AGQ scoring algorithms
- Audit report templates
- Data lineage mappers

**Open-Core** (Fair-Code):
- n8n workflow definitions
- Sovereignty dashboard
- API specifications

**Closed** (Proprietary - But Exportable):
- Client-specific configurations
- Customized audit scripts
- (But clients get copies of THEIR scripts)

---

## Sovereignty Violations: What Happens?

### **If We Ever Violate These Principles**:

**Immediate Actions**:
1. Public disclosure of violation within 24 hours
2. Affected clients notified directly
3. Free migration assistance offered
4. Penalties paid (detailed in service agreement)

**Examples of Violations**:
- ❌ Hiding data from export packages
- ❌ Making deletion difficult or delayed
- ❌ Using client data for purposes not consented
- ❌ Locking features behind proprietary formats
- ❌ Preventing self-hosting

**Client Remedies**:
- Full refund + 3 months free service
- Expedited migration to competitor
- Open-source any proprietary scripts
- Public apology + corrective action plan

---

## Why This Matters

### **The Conventional SaaS Model**:
```
Client → Vendor's Black Box → Opaque Results
         └─ Data trapped
         └─ Export crippled
         └─ Migration impossible
         └─ Vendor owns relationship
```

### **The Seed to Tree Model**:
```
Client ←→ Transparent Engine ←→ Client's Infrastructure
         ├─ Full visibility
         ├─ Instant export
         ├─ Self-hosting ready
         └─ Client owns everything
```

---

## Sovereignty Checklist (For Every Feature)

Before shipping ANY feature, verify:

- [ ] Client can export all data generated by this feature
- [ ] Feature doesn't require proprietary tools
- [ ] Feature enhances transparency (not obscures it)
- [ ] Client can disable/delete feature data
- [ ] AGQ impact assessed and documented
- [ ] Migration path exists (to self-hosting)
- [ ] GDPR/CCPA compliance verified
- [ ] No vendor lock-in introduced

**If ANY checkbox is unchecked → Feature is NOT sovereign → DO NOT SHIP**

---

## From Seed to Tree 🌱 → 🌳

This manifesto is a living document. As we grow from a seed (single-client service) to a tree (scalable platform), these principles remain unchanged.

**Our Promise**: When profit and sovereignty conflict, sovereignty wins. Always.

---

**Signed**: Krapheno (Seed to Tree)  
**Date**: October 16, 2025  
**Contact**: admin@krapheno.com  

**Client Rights Hotline**: Available 24/7 for sovereignty concerns

---

*This manifesto is version-controlled and publicly accessible. Any changes require client notification + 30-day review period.*
