Here's an updated version of the prompt incorporating best practices for Claude 3.5, including long context prompting tips, chaining complex prompts, using XML tags, and incorporating chain of thought prompting:

<instructions>
Your task is to create comprehensive documentation for a VS Code Chat Extension. Focus on practical usage, implementation details, and testing examples. Structure your response using the sections outlined below. For each section, think through the key points that need to be covered and provide detailed, actionable information.

Use the following guidelines throughout your response:
- Be clear, direct, and detailed in your explanations
- Include relevant code snippets where appropriate
- Use markdown formatting for better readability
- Incorporate TypeScript types and TSDoc comments in code examples
- Consider VS Code-specific requirements and best practices
</instructions>

<sections>
<section name="Extension Overview">
<thinking>
To provide a comprehensive overview, I should:
1. Explain the core purpose and functionality
2. Describe integration with VS Code APIs
3. List key dependencies and requirements
4. Detail the chat participant and command structure
</thinking>
<content>
## Extension Overview
[Your detailed content here]
</content>
</section>

<section name="Installation and Setup">
<thinking>
For a thorough installation guide, I need to:
1. Provide step-by-step instructions for development setup
2. Detail VS Code environment requirements
3. List all dependencies with version specifications
4. Explain VS Code configuration steps
5. Describe extension activation events
</thinking>
<content>
## Installation and Setup
[Your detailed content here]
</content>
</section>

<section name="Implementation Guide">
<thinking>
To create a comprehensive implementation guide, I should:
1. Describe chat participant implementation in detail
2. Explain chat request handler setup
3. Detail message handling and streaming processes
4. Document command registration and handling
5. Show integration with VS Code's Language Model API
6. Include error handling patterns and best practices
</thinking>
<content>
## Implementation Guide
[Your detailed content here]
</content>
</section>

<section name="Usage Guide">
<thinking>
For an effective usage guide, I need to:
1. Provide detailed examples of common chat interactions
2. Include code snippets demonstrating key functionality
3. Explain important classes, methods, and interfaces
4. Document configuration options and settings
5. Show example chat responses and interactions
</thinking>
<content>
## Usage Guide
[Your detailed content here]
</content>
</section>

<section name="Testing Guide">
<thinking>
To create a comprehensive testing guide, I should:
1. Explain VS Code's testing framework setup
2. Provide detailed test case examples
3. Include best practices for extension testing
4. Cover error handling and edge case testing
5. Explain mocking VS Code APIs for testing
</thinking>
<content>
## Testing Guide
[Your detailed content here]

### Example Test Case
```typescript
// Example test file: src/test/suite/extension.test.ts
import * as assert from 'assert';
import * as vscode from 'vscode';
import { MockChatRequest, MockResponseStream } from './mocks';

suite('Extension Test Suite', () => {
    vscode.window.showInformationMessage('Starting test suite');

    test('Chat Handler Test', async () => {
        // Test setup
        const request = new MockChatRequest();
        const stream = new MockResponseStream();

        // Execute test
        await handler(request, context, stream);

        // Assertions
        assert.strictEqual(stream.responses.length, 1);
        assert.strictEqual(stream.responses[0].content, 'expected response');
    });
});
```

### Testing Best Practices
[List of best practices]

### VS Code Extension Testing
[Detailed explanation of VS Code-specific testing considerations]

### Error Handling and Edge Cases
[Examples and explanations of error handling and edge case testing]
</content>
</section>

<section name="Extension Packaging">
<thinking>
For a comprehensive packaging guide, I should:
1. Document the extension bundling process
2. Explain how to package for the VS Code marketplace
3. Include CI/CD setup examples
4. Detail version management best practices
</thinking>
<content>
## Extension Packaging
[Your detailed content here]
</content>
</section>

<section name="Debugging Guide">
<thinking>
To create an effective debugging guide, I need to:
1. Explain VS Code extension debugging processes
2. Document launch configurations
3. Include logging best practices
4. Show debugging tool usage examples
</thinking>
<content>
## Debugging Guide
[Your detailed content here]
</content>
</section>

<section name="VS Code-Specific Considerations">
<thinking>
To cover VS Code-specific considerations, I should:
1. Detail workspace trust requirements
2. Explain extension activation events
3. Document command registration processes
4. Show proper VS Code API usage examples
5. Include extension manifest details
</thinking>
<content>
## VS Code-Specific Considerations
[Your detailed content here]
</content>
</section>
</sections>

<formatting>
Remember to use appropriate markdown formatting throughout your response:
- Use ## for main section headers
- Use ### for subsections
- Use backticks (`) for inline code
- Use triple backticks (```) for code blocks, specifying the language (e.g., ```
- Use bullet points (-) for lists
- Use bold (**) for emphasis on important points
</formatting>

---
Answer from Perplexity: pplx.ai/share
