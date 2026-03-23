# AGENTS.md

This document outlines the conventions, commands, and best practices for agentic coding agents operating within this repository. Adhering to these guidelines ensures consistency, maintainability, and efficient collaboration across the team.

---

## **1. Build, Lint, and Test Commands**

The project uses `npm` as its package manager. The following scripts are defined in `package.json`:

### **Development & Build**

- **Build:** Compiles the project using `react-router`.
  ```bash
  npm run build
  ```
- **Development:** Starts the development server with Shopify CLI integration.
  ```bash
  npm run dev
  ```
- **Typecheck:** Ensures type correctness across the codebase.
  ```bash
  npm run typecheck
  ```

### **Code Quality**

- **Lint:** Checks for code quality and style issues using ESLint.
  ```bash
  npm run lint
  ```

### **Testing**

While the project does not have a pre-configured testing framework, agents are encouraged to implement tests using **Vitest** for its excellent TypeScript support and fast execution.

- **To run all tests:**
  ```bash
  npx vitest run
  ```
- **To run a single test file:**
  ```bash
  npx vitest run <path-to-test-file>
  ```
- **To run tests in watch mode (recommended for development):**
  ```bash
  npx vitest
  ```

---

## **2. Code Style Guidelines**

The project uses TypeScript and enforces strict code quality through ESLint and Prettier.

### **A. Imports**

1.  **Node.js Built-in:** `import path from "path";`
2.  **Third-Party:** `import { PrismaClient } from "@prisma/client";`
3.  **Internal Modules:** `import { MyComponent } from "./components/MyComponent";`

- **Style:** Use absolute paths for library imports and relative paths (starting with `./` or `../`) for internal project modules.
- **Types:** Always use `import type` for type-only imports to aid bundler efficiency and clarity.

### **B. Formatting**

- **Tool:** Prettier is used. Follow its auto-formatting rules.
- **Semicolons:** Required at the end of statements.
- **Indentation:** 2 spaces.
- **Quotes:** Double quotes for strings. Use single quotes for JSX attributes if preferred for consistency.

### **C. TypeScript**

- **Strictness:** Favor explicit typing for function parameters, return types, and complex object shapes.
- **Interface vs. Type:** Use `interface` for object definitions and `type` for complex types, aliases, unions, and intersections.
- **New Code:** All new code must be written in TypeScript (`.ts` or `.tsx`).

### **D. Naming Conventions**

- **Variables/Functions:** `camelCase` (e.g., `calculateTotal`).
- **Classes/Interfaces/Components:** `PascalCase` (e.g., `OrderService`).
- **Constants:** `UPPER_SNAKE_CASE` (e.g., `DEFAULT_TIMEOUT`).
- **Files:** `kebab-case` (e.g., `db.server.ts`).

### **E. Error Handling & Logging**

- **Async Operations:** Always wrap in `try...catch`.
- **Granularity:** Use specific error types.
- **Logging:** Ensure consistent error logging across the application.

---

## **3. Repository Rules & Best Practices**

- **Database:** Always run migrations after schema changes:
  ```bash
  npm run setup
  ```
- **Security:** NEVER commit credentials, API keys, or sensitive environment variables.
- **Performance:** For long-running operations or processes, ensure they don't block the main event loop.

---

## **4. Cursor/Copilot Configuration**

No explicit `.cursor/rules/`, `.cursorrules`, or `.github/copilot-instructions.md` are currently defined. Agents should strictly follow the guidelines established in this `AGENTS.md` file.

---

_Last Updated: 2026-03-23_
