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

<evaluation_criteria>
Evaluate the response based on:
- Completeness of coverage for each section
- Clarity and actionability of instructions
- Proper use of VS Code-specific terminology and concepts
- Quality and relevance of code examples
- Adherence to best practices in extension development
</evaluation_criteria>

<fallback_instructions>
If specific details about VS Code APIs or extension development practices are uncertain:
- Clearly state the uncertainty
- Provide general guidance based on software development best practices
- Document any assumptions made
- Suggest alternative approaches where applicable
</fallback_instructions>

<prioritization>
Prioritize the following sections if time or space is limited:
1. Extension Overview
2. Implementation Guide
3. Testing Guide
4. VS Code-Specific Considerations
5. Security Considerations
</prioritization>

<version_specificity>
Target the documentation for:
- VS Code version 1.85+
- Latest stable release of VS Code Extension API
- Node.js LTS version
- TypeScript 5.0+
</version_specificity>

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

### Testing Chat Participants
```typescript
import * as assert from 'assert';
import * as vscode from 'vscode';
import { CodeTutorParticipant } from '../src/participants';
import { MockChatRequest, MockResponseStream, MockExtensionContext } from './mocks';

suite('Code Tutor Participant Tests', () => {
    let participant: CodeTutorParticipant;
    let context: vscode.ExtensionContext;
    let stream: MockResponseStream;
    let request: MockChatRequest;

    setup(() => {
        context = new MockExtensionContext();
        participant = new CodeTutorParticipant(context);
        stream = new MockResponseStream();
        request = new MockChatRequest('Tell me about variables in Python');
    });

    test('Should handle basic chat request', async () => {
        await participant.handleRequest(request, context, stream, new vscode.CancellationTokenSource().token);

        assert.ok(stream.responses.length > 0, 'Should have received responses');
        assert.ok(stream.isComplete, 'Stream should be marked as complete');
        assert.ok(!stream.hasError, 'Should not have any errors');
    });

    test('Should maintain conversation history', async () => {
        // First message
        await participant.handleRequest(
            new MockChatRequest('What is a variable?'),
            context,
            stream,
            new vscode.CancellationTokenSource().token
        );

        // Second message should include context from first
        const stream2 = new MockResponseStream();
        await participant.handleRequest(
            new MockChatRequest('Show me an example'),
            context,
            stream2,
            new vscode.CancellationTokenSource().token
        );

        assert.ok(stream2.responses.length > 0);
        assert.ok(stream2.responses.some(r => r.includes('variable')),
            'Second response should reference context from first message');
    });

    test('Should handle cancellation', async () => {
        const tokenSource = new vscode.CancellationTokenSource();
        const promise = participant.handleRequest(request, context, stream, tokenSource.token);

        // Cancel the request
        tokenSource.cancel();
        await promise;

        assert.ok(stream.responses.some(r => r.includes('cancelled')),
            'Should indicate cancellation in response');
    });

    test('Should handle errors gracefully', async () => {
        // Simulate error by using invalid model
        request.model = null;
        await participant.handleRequest(request, context, stream, new vscode.CancellationTokenSource().token);

        assert.ok(stream.hasError, 'Should have error state');
        assert.ok(stream.error.includes('Error processing request'),
            'Should have descriptive error message');
    });
});

// Mock implementations
class MockChatRequest implements vscode.ChatRequest {
    constructor(
        public prompt: string,
        public model: any = {
            sendRequest: async () => ({
                text: ['Mock response']
            })
        },
        public command?: string
    ) {}
}

class MockResponseStream implements vscode.ChatResponseStream {
    public responses: string[] = [];
    public isComplete = false;
    public hasError = false;
    public error = '';

    async markdown(content: string): Promise<void> {
        this.responses.push(content);
    }

    async complete(): Promise<void> {
        this.isComplete = true;
    }

    async error(message: string): Promise<void> {
        this.hasError = true;
        this.error = message;
    }
}

class MockExtensionContext implements vscode.ExtensionContext {
    public history: vscode.ChatResponseTurn[] = [];
    // ... other required implementation details
}
```
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

<section name="Multishot Examples">
<thinking>
To provide comprehensive examples, I should include:
1. Basic chat participant implementation
2. Advanced streaming response handling
3. Error handling and recovery
4. Integration with VS Code commands
5. Testing scenarios
</thinking>
<content>
## Implementation Examples

### Basic Chat Participant
```typescript
import * as vscode from 'vscode';

/**
 * Base prompt for the code tutor chat participant.
 */
const BASE_PROMPT = `You are a helpful code tutor. Your job is to teach the user with simple
descriptions and sample code of the concept. Respond with a guided overview of the concept
in a series of messages.`;

/**
 * Chat participant implementation for a code tutor.
 */
export class CodeTutorParticipant {
    readonly id = 'example.codeTutor';
    readonly displayName = 'Code Tutor';
    private readonly _iconPath: vscode.Uri;

    constructor(context: vscode.ExtensionContext) {
        this._iconPath = vscode.Uri.joinPath(context.extensionUri, 'tutor.jpeg');
    }

    /**
     * Handles incoming chat requests.
     *
     * @param request - The chat request from VS Code
     * @param context - Extension context
     * @param stream - Response stream for sending messages back
     * @param token - Cancellation token
     */
    async handleRequest(
        request: vscode.ChatRequest,
        context: vscode.ExtensionContext,
        stream: vscode.ChatResponseStream,
        token: vscode.CancellationToken
    ): Promise<void> {
        try {
            // Initialize messages with base prompt
            const messages = [
                vscode.LanguageModelChatMessage.User(BASE_PROMPT),
            ];

            // Get previous conversation history
            const previousMessages = context.history.filter(
                (h) => h instanceof vscode.ChatResponseTurn
            );

            // Add previous messages to maintain context
            previousMessages.forEach((m) => {
                let fullMessage = '';
                m.response.forEach((r) => {
                    const mdPart = r as vscode.ChatResponseMarkdownPart;
                    fullMessage += mdPart.value.value;
                });
                messages.push(vscode.LanguageModelChatMessage.Assistant(fullMessage));
            });

            // Add current user message
            messages.push(vscode.LanguageModelChatMessage.User(request.prompt));

            // Send request to language model
            const response = await request.model.sendRequest(messages, {}, token);

            // Stream response back to user
            for await (const fragment of response.text) {
                await stream.markdown(fragment);
            }

            await stream.complete();
        } catch (error) {
            await stream.error(`Error processing request: ${error.message}`);
        }
    }
}

/**
 * Activates the extension.
 *
 * @param context - Extension context
 */
export function activate(context: vscode.ExtensionContext) {
    // Create and register the chat participant
    const tutor = vscode.chat.createChatParticipant(
        "chat-tutorial.code-tutor",
        new CodeTutorParticipant(context).handleRequest
    );

    // Set the participant icon
    tutor.iconPath = vscode.Uri.joinPath(context.extensionUri, 'tutor.jpeg');
}
```

### Advanced Streaming Example
```typescript
/**
 * Chat participant that supports different tutoring modes.
 */
export class AdvancedTutorParticipant {
    /**
     * Different prompts for different tutoring modes.
     */
    private readonly PROMPTS = {
        base: 'You are a helpful code tutor...',
        exercise: 'You are a helpful tutor providing exercises...',
        debug: 'You are a helpful debugging assistant...'
    };

    /**
     * Handles chat requests with support for different modes.
     */
    async handleRequest(
        request: vscode.ChatRequest,
        context: vscode.ExtensionContext,
        stream: vscode.ChatResponseStream,
        token: vscode.CancellationToken
    ): Promise<void> {
        try {
            // Select prompt based on command
            const prompt = this.getPromptForCommand(request.command);

            // Initialize conversation
            const conversation = await this.buildConversation(prompt, context.history);

            // Add current request
            conversation.push(vscode.LanguageModelChatMessage.User(request.prompt));

            // Process in chunks with progress indication
            await stream.markdown('Processing request...\n');

            // Send request to model
            const response = await request.model.sendRequest(conversation, {
                temperature: 0.7,
                maxTokens: 1000
            }, token);

            // Stream response with markdown formatting
            for await (const fragment of response.text) {
                if (token.isCancellationRequested) {
                    await stream.markdown('\n\n*Request cancelled*');
                    return;
                }
                await stream.markdown(fragment);
            }

            await stream.complete();
        } catch (error) {
            await stream.error(`Error in advanced tutor: ${error.message}`);
        }
    }

    /**
     * Builds the conversation history with appropriate prompt.
     */
    private async buildConversation(
        prompt: string,
        history: readonly vscode.ChatResponseTurn[]
    ): Promise<vscode.LanguageModelChatMessage[]> {
        const messages = [vscode.LanguageModelChatMessage.User(prompt)];

        // Add conversation history
        history.filter(h => h instanceof vscode.ChatResponseTurn)
              .forEach(m => {
                  let fullMessage = '';
                  m.response.forEach(r => {
                      const mdPart = r as vscode.ChatResponseMarkdownPart;
                      fullMessage += mdPart.value.value;
                  });
                  messages.push(vscode.LanguageModelChatMessage.Assistant(fullMessage));
              });

        return messages;
    }

    /**
     * Gets the appropriate prompt based on the command.
     */
    private getPromptForCommand(command?: string): string {
        switch (command) {
            case 'exercise':
                return this.PROMPTS.exercise;
            case 'debug':
                return this.PROMPTS.debug;
            default:
                return this.PROMPTS.base;
        }
    }
}
```
</content>
</section>

<section name="Accessibility Considerations">
<thinking>
To address accessibility, I should:
1. Explain how to make the extension keyboard-accessible
2. Describe color contrast requirements
3. Discuss screen reader compatibility
4. Provide examples of accessible UI components
</thinking>
<content>
## Accessibility Considerations

### Keyboard Navigation
- Ensure all features are accessible via keyboard
- Implement proper focus management
- Support standard VS Code keyboard shortcuts

### Screen Reader Support
- Use proper ARIA labels
- Provide meaningful status messages
- Ensure chat responses are screen reader friendly

### Visual Considerations
- Follow VS Code's theming guidelines
- Maintain sufficient color contrast
- Support high contrast themes
</content>
</section>

<section name="Internationalization">
<thinking>
For internationalization, I need to cover:
1. How to structure the extension for easy localization
2. Best practices for string externalization
3. Handling of right-to-left languages
4. Date, time, and number formatting considerations
</thinking>
<content>
## Internationalization

### Localization Setup
```typescript
import * as vscode from 'vscode';
import * as nls from 'vscode-nls';

const localize = nls.loadMessageBundle();

export class LocalizedChatParticipant {
    readonly displayName = localize('participant.name', 'Localized Participant');

    async handleRequest(request: ChatRequest): Promise<void> {
        const response = localize('response.greeting', 'Hello from {0}!', this.displayName);
        // Implementation
    }
}
```

### RTL Support
- Use VS Code's built-in RTL support
- Test with RTL languages
- Handle bidirectional text properly
</content>
</section>

<section name="Performance Considerations">
<thinking>
For performance, I should discuss:
1. Efficient use of VS Code APIs
2. Asynchronous programming best practices
3. Minimizing extension activation time
4. Optimizing resource usage
</thinking>
<content>
## Performance Considerations

### Extension Activation
- Use lazy activation events
- Minimize startup impact
- Implement proper cleanup

### Resource Management
- Cache expensive computations
- Implement proper disposal patterns
- Use VS Code's built-in progress indicators

### API Usage Optimization
```typescript
export class OptimizedChatParticipant {
    private cache = new Map<string, Promise<string>>();

    async handleRequest(request: ChatRequest): Promise<void> {
        // Use cached results when possible
        const cacheKey = this.getCacheKey(request);
        if (this.cache.has(cacheKey)) {
            return this.cache.get(cacheKey);
        }

        // Process new requests efficiently
        const resultPromise = this.processRequest(request);
        this.cache.set(cacheKey, resultPromise);
        return resultPromise;
    }
}
```
</content>
</section>

<section name="Security Considerations">
<thinking>
For security, I need to cover:
1. Handling sensitive data
2. Secure communication practices
3. Input validation and sanitization
4. Potential security risks specific to VS Code extensions
</thinking>
<content>
## Security Considerations

### Data Security
- Use VS Code's SecretStorage for sensitive data
- Implement proper input validation
- Handle secrets securely

### Communication Security
- Use secure protocols
- Validate external data
- Implement proper error handling

### Example Security Implementation
```typescript
import * as vscode from 'vscode';

export class SecureChatParticipant {
    private readonly secrets: vscode.SecretStorage;

    constructor(context: vscode.ExtensionContext) {
        this.secrets = context.secrets;
    }

    async handleRequest(request: ChatRequest): Promise<void> {
        // Validate input
        if (!this.isValidRequest(request)) {
            throw new Error('Invalid request');
        }

        // Handle secrets securely
        const apiKey = await this.secrets.get('api-key');
        if (!apiKey) {
            throw new Error('API key not found');
        }

        // Process request securely
        // Implementation
    }
}
```
</content>
</section>
</sections>

<formatting>
Remember to use appropriate markdown formatting throughout your response:
- Use ## for main section headers
- Use ### for subsections
- Use backticks (`) for inline code
- Use triple backticks (```) for code blocks, specifying the language (e.g., ```typescript)
- Use bullet points (-) for lists
- Use bold (**) for emphasis on important points
</formatting>

---
Answer from Perplexity: pplx.ai/share
