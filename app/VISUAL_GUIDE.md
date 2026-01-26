# 🎨 Archii App - Visual Guide

## Screen Flow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│                        🌟 SPLASH SCREEN                         │
│                                                                 │
│              ┌─────────────────────────────┐                  │
│              │                             │                  │
│              │     Grid Background         │                  │
│              │                             │                  │
│              │         ARCHII              │                  │
│              │                             │                  │
│              │   Design smarter with AI    │                  │
│              │                             │                  │
│              │      ⏳ Loading...          │                  │
│              │                             │                  │
│              └─────────────────────────────┘                  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
                            ↓ (3 seconds)
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│                        🔐 LOGIN SCREEN                          │
│                                                                 │
│              ┌─────────────────────────────┐                  │
│              │         🏗️ Icon            │                  │
│              │         ARCHII              │                  │
│              │                             │                  │
│              │    [Email Input]            │                  │
│              │    [Password Input]         │                  │
│              │                             │                  │
│              │    [Sign In Button]         │                  │
│              │                             │                  │
│              │    ───── or ─────           │                  │
│              │                             │                  │
│              │ [🌐 Continue with Google]   │                  │
│              │                             │                  │
│              └─────────────────────────────┘                  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────────┐
│ ARCHII                                    🔔  👤               │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  Welcome back, John! 👋                                        │
│  Ready to design something amazing?                            │
│                                                                 │
│  ┌───────────────────────────────────────────────────────┐   │
│  │  ➕  Start New Design                        →         │   │
│  │      AI-powered interior design in minutes             │   │
│  └───────────────────────────────────────────────────────┘   │
│                                                                 │
│  ┌───────────────────────────────────────────────────────┐   │
│  │  💬  Ask Archii anything...                    →       │   │
│  └───────────────────────────────────────────────────────┘   │
│                                                                 │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐                      │
│  │   12    │  │   48    │  │  $92k   │                      │
│  │Projects │  │ Designs │  │  Saved  │                      │
│  └─────────┘  └─────────┘  └─────────┘                      │
│                                                                 │
│  Recent Projects                              View All →       │
│                                                                 │
│  ┌──────────┐  ┌──────────┐                                  │
│  │   🛏️    │  │   🍳    │                                  │
│  │  Modern  │  │ Minimal  │                                  │
│  │  Bedroom │  │ Kitchen  │                                  │
│  └──────────┘  └──────────┘                                  │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
                     ↓ (Click Start New Design)
┌─────────────────────────────────────────────────────────────────┐
│ ← New Project                          Step 1 of 4             │
├─────────────────────────────────────────────────────────────────┤
│ ████ ──── ──── ────  (Progress Bar)                           │
│                                                                 │
│              Upload Your Space                                 │
│         Stand at a corner and capture                          │
│              the full room                                     │
│                                                                 │
│  ┌───────────────────────────────────────────────────────┐   │
│  │                                                         │   │
│  │             📷                                          │   │
│  │     Take Photo or Upload                               │   │
│  │       JPG, PNG up to 10MB                              │   │
│  │                                                         │   │
│  └───────────────────────────────────────────────────────┘   │
│                                                                 │
│              [Continue Button]                                 │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────────┐
│ ← New Project                          Step 2 of 4             │
├─────────────────────────────────────────────────────────────────┤
│ ████ ████ ──── ────                                            │
│                                                                 │
│              Enter Dimensions                                  │
│         Help us understand your space                          │
│                                                                 │
│  ┌───────────────────────────────────────────────────────┐   │
│  │              📐                                         │   │
│  │                                                         │   │
│  │  [Length]    [Width]    [Height]                       │   │
│  │                                                         │   │
│  │  Room Type: [Bedroom ▼]                                │   │
│  │                                                         │   │
│  └───────────────────────────────────────────────────────┘   │
│                                                                 │
│         [Back]              [Continue]                         │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────────┐
│ ← New Project                          Step 3 of 4             │
├─────────────────────────────────────────────────────────────────┤
│ ████ ████ ████ ────                                            │
│                                                                 │
│              Design Preferences                                │
│                  Tell us your style                            │
│                                                                 │
│  Style: [Modern] [Minimal] [Luxury] [Rustic]                  │
│                                                                 │
│  Budget Range: ─────●────────────                              │
│                Low              Premium                         │
│                                                                 │
│  Color Palette: [⬜] [⬛] [🔵] [🟢]                           │
│                                                                 │
│  Purpose: [Work] [Relax] [Storage] [Study]                    │
│                                                                 │
│  Furniture: [Bed] [Desk] [Sofa] [Storage]                     │
│                                                                 │
│         [Back]              [Continue]                         │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────────┐
│ ← New Project                          Step 4 of 4             │
├─────────────────────────────────────────────────────────────────┤
│ ████ ████ ████ ████                                            │
│                                                                 │
│              Ready to Generate                                 │
│              Review your preferences                           │
│                                                                 │
│  Room Type: Bedroom                                            │
│  Style: Modern                                                 │
│  Budget: Medium                                                │
│  Purpose: Work, Relax                                          │
│  Furniture: Bed, Desk, Storage                                 │
│                                                                 │
│  ℹ️ AI generation will take 1-2 minutes...                    │
│                                                                 │
│         [Back]       [Generate Design ✨]                      │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────────┐
│                                                                 │
│              Generating Your Design                            │
│                                                                 │
│                    🔄 ✨                                        │
│                                                                 │
│         🎨 Analyzing your space...                             │
│                                                                 │
│         ████████████────── 75%                                 │
│                                                                 │
│  ℹ️ Our AI is analyzing your space and creating               │
│     a personalized design just for you                         │
│                                                                 │
└─────────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────────┐
│ ← Your Design                               📤  💾             │
├─────────────────────────────────────────────────────────────────┤
│  Layout  │  Visual  │  Cost  │  Notes                         │
│ ━━━━━━━━                                                       │
│                                                                 │
│  2D Floor Plan                       [12' × 10']              │
│  ┌───────────────────────────────────────────────────────┐   │
│  │                                                         │   │
│  │        ┌─────────────┐                                 │   │
│  │        │             │                                 │   │
│  │        │    Bed      │        ┌────┐                  │   │
│  │        │             │        │Desk│                  │   │
│  │        └─────────────┘        └────┘                  │   │
│  │                                                         │   │
│  │    ⭕ Chair                                            │   │
│  │                                                         │   │
│  └───────────────────────────────────────────────────────┘   │
│                                                                 │
│  Room Features:                                                │
│  🛏️ King Size Bed - Centered against wall                    │
│  💼 Work Desk - Near window for natural light                 │
│  🪑 Reading Chair - Cozy corner with floor lamp               │
│                                                                 │
│                                              [💬 Refine Design] │
└─────────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────────┐
│ ← Archii AI                                            ⋮       │
│   Design Assistant                                             │
├─────────────────────────────────────────────────────────────────┤
│  [Change colors] [Move furniture] [Adjust budget]             │
├─────────────────────────────────────────────────────────────────┤
│                                                                 │
│  ┌────────────────────────────────────────────────┐           │
│  │ 🤖 Hi! I'm here to help you refine your       │           │
│  │    design. You can ask me to:                  │           │
│  │    • Change colors or materials                │           │
│  │    • Adjust furniture placement                │           │
│  │    • Modify the budget                         │           │
│  └────────────────────────────────────────────────┘           │
│                                                       10:30     │
│                                                                 │
│                            ┌──────────────────────┐            │
│                            │ Make the room        │            │
│                            │ lighter              │            │
│                            └──────────────────────┘            │
│                                                       10:31     │
│                                                                 │
│  ┌────────────────────────────────────────────────┐           │
│  │ 🤖 Great! I can update the color scheme.      │           │
│  │    What colors would you prefer?               │           │
│  └────────────────────────────────────────────────┘           │
│                                                       10:31     │
│                                                                 │
├─────────────────────────────────────────────────────────────────┤
│ ➕  [Type your message...]               🎤         [Send 📤]  │
└─────────────────────────────────────────────────────────────────┘
```

## Color Palette

### Primary Colors
- **Blue**: `#2563EB` - Main brand color
- **Indigo**: `#4F46E5` - Secondary accent
- **Purple**: `#6366F1` - Gradient accent

### Background
- **Light**: `#F9FAFB` - Main background
- **White**: `#FFFFFF` - Card backgrounds

### Text
- **Dark**: `#111827` - Primary text
- **Gray**: `#6B7280` - Secondary text
- **Light Gray**: `#9CA3AF` - Disabled/hint text

### Borders
- **Light**: `#E5E7EB` - Default borders
- **Focus**: `#2563EB` - Active borders

## Typography

**Font Family**: Inter (Google Fonts)

**Sizes**:
- Headings: 28px, 24px, 20px
- Body: 16px, 14px
- Small: 12px

**Weights**:
- Bold: 700
- Semibold: 600
- Medium: 500
- Regular: 400

## Component Library

### Buttons
- **Primary**: Blue gradient with shadow
- **Outlined**: Border with transparent background
- **Text**: No background, colored text

### Cards
- **Elevation**: 0 (flat design)
- **Border Radius**: 16px
- **Shadow**: Subtle 0.05 opacity

### Inputs
- **Border Radius**: 12px
- **Filled**: Light gray background
- **Focus**: Blue border

### Chips
- **Selected**: Blue background, white text
- **Unselected**: Gray background, dark text
- **Border Radius**: 20px (fully rounded)

## Animation Timings

- **Fast**: 200-300ms (micro-interactions)
- **Normal**: 500ms (transitions)
- **Slow**: 800-1000ms (page transitions)
- **Loading**: 2000ms (rotation loops)

## Screen Breakpoints

- **Mobile**: < 600px
- **Tablet**: 600-900px
- **Desktop**: > 900px

(All screens are responsive by default)

---

**🎨 This visual guide helps understand the app's structure and design system!**
