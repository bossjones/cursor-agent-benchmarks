Your task is to create comprehensive documentation for a VS Code Chat Extension, focusing on practical usage, implementation details, and testing examples. Structure your response using the following sections:

Extension Overview:
- Explain the extension's purpose, core functionality, and key features
- Describe how it integrates with VS Code's Chat/Language Model APIs
- List any key dependencies or requirements
- Detail the chat participant and command structure

Installation and Setup:
- Provide step-by-step installation instructions for development
- Detail VS Code environment setup requirements
- List all required dependencies with version specifications
- Include necessary VS Code configuration steps
- Explain the extension activation events

Implementation Guide:
- Describe the chat participant implementation
- Detail the chat request handler setup
- Explain message handling and streaming
- Document command registration and handling
- Show how to integrate with VS Code's Language Model API
- Include error handling patterns

Usage Guide:
- Provide detailed examples of common chat interactions
- Include code snippets demonstrating key functionality
- Explain important classes, methods, and interfaces
- Document configuration options and settings
- Show example chat responses and interactions

Testing Guide:
For each test case, provide:
1. Test purpose and description
2. Required VS Code test fixtures and setup
3. Complete test implementation
4. Expected outcomes and assertions

Example Test Case Format:
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

Testing Best Practices:
- Use VS Code's built-in testing framework
- Implement proper type checking in all tests
- Create mock objects for VS Code APIs
- Test chat interactions thoroughly
- Implement proper error handling tests
- Test both success and error cases
- Include edge case testing
- Document test coverage requirements

VS Code Extension Testing:
- Document VS Code test runner setup
- Explain extension test activation
- Show how to mock VS Code APIs
- Demonstrate test workspace setup
- Include command testing patterns

Error Handling and Edge Cases:
- Document expected VS Code exceptions
- Show how to test error conditions
- Provide examples of boundary testing
- Include validation testing examples

Extension Packaging:
- Document extension bundling process
- Show how to package for marketplace
- Include CI/CD setup examples
- Detail version management

Debugging Guide:
- Explain VS Code extension debugging
- Document launch configurations
- Include logging best practices
- Show debugging tool usage

Remember to:
- Include TSDoc comments for all functions
- Add proper TypeScript types
- Document VS Code API dependencies
- Show proper error handling
- Include cleanup in tests
- Demonstrate extension isolation

VS Code-Specific Considerations:
- Detail workspace trust requirements
- Explain extension activation events
- Document command registration
- Show proper VS Code API usage
- Include extension manifest details
