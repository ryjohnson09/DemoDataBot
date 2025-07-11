# DemoDataBot

## What DemoDatabot Does

## Prerequisites
Demobot uses [Claude Code](https://www.anthropic.com/claude-code) to generate projects. To run Demobot, you need:

1. **Node.js** - Required to run Claude Code (comes with `npx`)
2. **Anthropic API Key** - Set the `ANTHROPIC_API_KEY` environment variable with your API key

## Usage

### Quick Start

1. Open a terminal in this directory
2. Start demobot by running Claude Code:

    ```bash
    npx @anthropic-ai/claude-code
    ```

3. Tell it to create a demo project for your customer:

    ```
    > Create a demo project for [Company Name].
    ```

4. Answer the setup questions. If there are certain prompts that you don't know the answer to, you can call them out as "unknown" or "unsure" and Demobot will research them for you.
5. Occasionally, Demobot may ask for confirmation or additional details. Respond as needed.

### IDE Integration
Claude Code integrates with VS Code based IDEs like Cursor, Windsurf, and Positron. [Anthropic's documentation](https://docs.anthropic.com/en/docs/claude-code/ide-integrations) indicates that the Claude Code extension should automatically install and configure itself in these environments when you run `claude` from the integrated terminal. However Positron isn't yet a supported IDE. However, you can manually install [the extension](https://open-vsx.org/extension/Anthropic/claude-code) in Positron by searching for "Claude Code" in the extensions marketplace. Once installed, you can run Demobot directly from the IDE by clicking on the Claude Code icon that appears in the corner of the editor or by using the command pallette (`Ctrl+Shift+P` or `Cmd+Shift+P`) and selecting "Run Claude Code".

### AWS Bedrock Integration
If you prefer to use AWS Bedrock instead of an Anthropic API key, configure the following before running Claude Code:

1. Sign in to AWS via the CLI. See [Confluence](https://positpbc.atlassian.net/wiki/spaces/CLOUDOPS/pages/36343631/AWS+Single+Sign+On#Interactive-Setup) for details.

2. Set the following environment variables in your terminal or shell configuration file (e.g., `.bashrc`, `.zshrc`):

    ```bash
    export CLAUDE_CODE_USE_BEDROCK=1
    export ANTHROPIC_MODEL='us.anthropic.claude-3-7-sonnet-20250219-v1:0'
    export DISABLE_PROMPT_CACHING=1
    ```

3. Start Claude Code

To verify that the Bedrock integration is working, run `/status` from Claude Code. You should see a message indicating that Bedrock is enabled:

```
 API Configuration 
  L API Provider: AWS Bedrock
  L AWS Region: us-east-1
```

### Example Interaction
