# DemoDataBot

DemoDataBot will create a synthetic data set optimized for EDA, visualization, and web app development. For more information about the data, please view the `CLAUDE.md` and `.claude/PLAN.md` files.

## Prerequisites

Demobot uses [Claude Code](https://www.anthropic.com/claude-code) to generate projects. To run Demobot, you need:

1.  **Node.js** - Required to run Claude Code (comes with `npx`)
2.  **Anthropic API Key** - Set the `ANTHROPIC_API_KEY` environment variable with your API key

## Usage

### Quick Start

1.  Open a terminal in this directory

2.  Start demobot by running Claude Code:

    ``` bash
    npx @anthropic-ai/claude-code
    ```

3.  Tell it to create a demo project for your customer:

    ```         
    > Create data for [Company Name].
    ```

4.  Answer the setup questions. If there are certain prompts that you don't know the answer to, you can call them out as "unknown" or "unsure" and Demobot will research them for you.

5.  Occasionally, Demobot may ask for confirmation or additional details. Respond as needed.